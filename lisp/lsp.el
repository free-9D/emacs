;;; init-lsp.el --- 现代代码编辑增强 (Eglot, Treesit, Apheleia)

;; 1. Treesit-auto: 自动切换到 Tree-sitter 模式
;; Tree-sitter 提供比正则更快的解析速度和更精准的高亮
;;(use-package treesit-auto
;;  :ensure t
;;  :custom
;;  (treesit-auto-install 'prompt)
;;  :config
;;  (treesit-auto-add-to-auto-mode-alist 'all)
;;  (global-treesit-auto-mode))

;; 2. Eglot: Emacs 内置的轻量 LSP 客户端 (Emacs 29+)
(use-package eglot
  :ensure nil ;; 内置插件不需要 ensure
  :bind (:map eglot-mode-map
              ("M-." . xref-find-definitions)
              ("M-?" . xref-find-references)
              ("C-c r" . eglot-rename)
              ("C-c f" . eglot-format)) ;; 虽然有 apheleia，但保留手动格式化
  :hook ((c-mode c++-mode python-mode rust-mode) . eglot-ensure)
  :config
  ;; 性能：不要记录太多日志
  (setq eglot-events-buffer-size 0)
  ;; 配置 clangd 参数
  (add-to-list 'eglot-server-programs
               '((c++-mode c-mode) . ("clangd" 
                                      "--header-insertion=never" 
                                      "--completion-style=detailed"))))

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)                 
  (corfu-auto-delay 0.0)         
  (corfu-auto-prefix 1)          
  (corfu-cycle t)                
  :init
  (global-corfu-mode)
  :config
  ;; --- 核心修复：终端适配 ---
  (unless (display-graphic-p)
    (use-package corfu-terminal
      :ensure t
      :config
      (corfu-terminal-mode +1))))

;; 配合 Orderless (无序过滤) 体验更佳
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic)))

;; 3. Apheleia: 异步代码格式化 (保存时不卡顿)
;; 它可以让你在执行保存时，后台调用 clang-format 而不让 Emacs 界面转圈
(use-package apheleia
  :ensure t
  :config
  (apheleia-global-mode +1)
  ;; 可以针对具体模式指定格式化器
  (setf (alist-get 'c++-mode apheleia-mode-alist) 'clang-format)
  (setf (alist-get 'c-mode apheleia-mode-alist) 'clang-format))

;; 4. Flymake: Eglot 的原生语法检查配对
(use-package flymake
  :bind (:map flymake-mode-map
              ("M-n" . flymake-goto-next-error)
              ("M-p" . flymake-goto-prev-error)))

(provide 'lsp)
