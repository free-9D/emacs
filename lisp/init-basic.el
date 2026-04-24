;;; init-basic.el --- 基础装修
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; Tab = 2 & 括号
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq c-basic-offset 2)

(use-package smartparens
  :config (smartparens-global-mode t) (show-paren-mode t))
(use-package yasnippet
  :ensure t
  :config
  (setq yas-verbosity 1) ;; 只显示重要错误，不显示“没找到模板”这种废话
  (yas-global-mode 1))

(provide 'init-basic)
