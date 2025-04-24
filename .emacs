(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes t)
 '(custom-safe-themes t)
 '(eglot-confirm-server-edits nil nil nil "Customized with use-package eglot")
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(auctex catppuccin-theme company dashboard doom-modeline doom-themes
            exec-path-from-shell go-mode haskell-mode kaolin-themes
            ligature nerd-icons-completion nerd-icons-dired rust-mode
            sly weyland-yutani-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

(load-file "~/.config/emacs/init.el")
