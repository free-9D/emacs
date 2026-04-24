;;; init-cpp.el --- 稳定兼容版 (禁用 Tree-sitter)

(use-package lsp-mode
  :ensure t
  ;; 核心：使用 c-mode 而不是 c-ts-mode
  :hook ((c-mode . lsp)
         (c++-mode . lsp))
  :bind (:map lsp-mode-map
         ("M-." . lsp-find-definition)
         ("M-?" . lsp-find-references))
  :config
  ;; 既然在终端，关掉没必要的视觉负担
  (setq lsp-enable-symbol-highlighting t)
  (setq lsp-ui-doc-enable nil))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  (require 'lsp-ui-flycheck)
  ;; 终端下 sideline (行末提示) 很有用
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-diagnostics t)
  ;; 快捷键：展示项目所有报错列表
  (global-set-key (kbd "C-c e") #'lsp-ui-flycheck-list))

(use-package company
  :ensure t
  :hook (after-init . global-company-mode) ;; 放在 hook 里，避免拖慢启动速度
  :init (global-company-mode t)
  :config
  (setq company-idle-delay 0.0
        company-minimum-prefix-length 1)
  ;; 核心：禁用 company-clang 这个干扰项
  (setq company-backends (delete 'company-clang company-backends)))

;; 重要：删除或注释掉之前关于 treesit 和 remap 的所有代码
;; 不要出现 (require 'treesit) 或者 c-ts-mode

(provide 'init-cpp)
