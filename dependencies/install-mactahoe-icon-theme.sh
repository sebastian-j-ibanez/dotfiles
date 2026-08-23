#!/usr/bin/env bash
# Install/update vinceliuice's MacTahoe icon theme in the user icon directory.
# With no arguments, install the upstream's uncoloured default variant.

set -Eeuo pipefail

repo_url="https://github.com/vinceliuice/MacTahoe-icon-theme.git"
source_dir="${XDG_CACHE_HOME:-$HOME/.cache}/dotfiles/MacTahoe-icon-theme"
icon_dir="${XDG_DATA_HOME:-$HOME/.local/share}/icons"

for command in git gtk-update-icon-cache; do
  if ! command -v "$command" >/dev/null; then
    printf 'Missing required command: %s\n' "$command" >&2
    exit 1
  fi
done

if [[ -d "$source_dir/.git" ]]; then
  git -C "$source_dir" pull --ff-only
elif [[ -e "$source_dir" ]]; then
  printf 'Expected a Git checkout at %s; refusing to overwrite it.\n' "$source_dir" >&2
  exit 1
else
  mkdir -p "$(dirname "$source_dir")"
  git clone --depth=1 "$repo_url" "$source_dir"
fi

mkdir -p "$icon_dir"

if (( $# == 0 )); then
  set -- --theme default
fi

exec "$source_dir/install.sh" --dest "$icon_dir" "$@"
