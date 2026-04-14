#!/usr/bin/env python3
"""
Automatically disable the internal laptop display (eDP-1) when an external
monitor is connected, and re-enable it when the external monitor is removed.

Listens to Hyprland's event socket for monitoradded/monitorremoved events.
"""

import json
import os
import socket
import subprocess
import sys
import time

INTERNAL = "eDP-1"
MONITORS_CONF = os.path.expanduser("~/.config/hypr/monitors.conf")
DISABLE_LINE = f"monitor = {INTERNAL}, disabled  # auto-added by monitor-switch\n"


def get_socket_path():
    sig = os.environ.get("HYPRLAND_INSTANCE_SIGNATURE")
    if not sig:
        print("HYPRLAND_INSTANCE_SIGNATURE not set", file=sys.stderr)
        sys.exit(1)
    runtime_dir = os.environ.get("XDG_RUNTIME_DIR", f"/run/user/{os.getuid()}")
    return f"{runtime_dir}/hypr/{sig}/.socket2.sock"


def has_external_monitor():
    result = subprocess.run(
        ["hyprctl", "monitors", "-j"], capture_output=True, text=True
    )
    monitors = json.loads(result.stdout)
    return any(m["name"] != INTERNAL and not m["disabled"] for m in monitors)


def restart_wallpaper():
    time.sleep(0.5)
    subprocess.run(["pkill", "-x", "swaybg"])
    time.sleep(0.2)
    subprocess.Popen(
        ["setsid", "uwsm-app", "--", "swaybg", "-i",
         os.path.expanduser("~/.config/omarchy/current/background"), "-m", "fill"],
        stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL
    )


def disable_internal():
    print(f"External monitor connected — disabling {INTERNAL}")
    with open(MONITORS_CONF) as f:
        content = f.read()
    if DISABLE_LINE not in content:
        with open(MONITORS_CONF, "w") as f:
            f.write(DISABLE_LINE + content)
        restart_wallpaper()


def enable_internal():
    print(f"External monitor removed — enabling {INTERNAL}")
    with open(MONITORS_CONF) as f:
        content = f.read()
    if DISABLE_LINE in content:
        with open(MONITORS_CONF, "w") as f:
            f.write(content.replace(DISABLE_LINE, ""))
        restart_wallpaper()


def main():
    # Handle state at startup (e.g. external monitor already plugged in)
    if has_external_monitor():
        disable_internal()
    else:
        enable_internal()

    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    sock.connect(get_socket_path())

    buffer = ""
    while True:
        data = sock.recv(4096).decode("utf-8", errors="replace")
        if not data:
            break
        buffer += data
        while "\n" in buffer:
            line, buffer = buffer.split("\n", 1)
            if line.startswith("monitoradded>>"):
                monitor = line.split(">>", 1)[1].strip()
                if monitor != INTERNAL:
                    time.sleep(0.5)
                    disable_internal()
            elif line.startswith("monitorremoved>>"):
                monitor = line.split(">>", 1)[1].strip()
                if monitor != INTERNAL:
                    # Wait and re-verify — Hyprland config reloads fire a
                    # transient monitorremoved even when the monitor stays
                    # physically connected, so only act if it's truly gone.
                    time.sleep(1.5)
                    if not has_external_monitor():
                        enable_internal()


if __name__ == "__main__":
    main()
