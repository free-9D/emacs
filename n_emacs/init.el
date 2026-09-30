;; -*- lexical-binding: t; -*-

(message "========== MY INIT.EL IS LOADED ==========")

(setq custom-file "~/.config/emacs/emacs-custom.el")
(load custom-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil))
(customize-set-variable 'tool-bar-mode nil)
