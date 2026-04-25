;;; init-basic.el --- 基础 UI 与编辑行为

;; --- 1. 启动与全局 UI 优化 ---
(setq inhibit-startup-message t)    ;; 禁用启动画面
(setq initial-scratch-message nil) ;; *scratch* 缓冲留白
(setq display-pkg-info nil)        ;; 减少包信息提示

;; 禁用高级 UI 特性（有效缓解 GDK/图形环境兼容性报错）
(setq use-dialog-box nil)
(setq use-file-dialog nil)

;; 设置默认字体和大小 (JetBrains Mono)
(set-face-attribute 'default nil :font "JetBrains Mono-12")

;; --- 2. 界面显示配置 ---
(global-display-line-numbers-mode t)     ;; 开启行号
(setq display-line-numbers-type 'relative) ;; 使用相对行号

;; 定义一个列表，包含所有“不需要显示行号”的模式
(defvar my/no-line-numbers-modes
  '(vterm-mode-hook
    eshell-mode-hook
    shell-mode-hook
    term-mode-hook
    help-mode-hook
    dashboard-mode-hook
    treemacs-mode-hook
    prog-mode-hook ;; 如果你想在纯文本模式也禁用，可以调整这里
    )
  "不希望显示行号的模式列表")

;; 遍历列表，为这些模式统一挂上“禁用行号”的钩子
(dolist (mode-hook my/no-line-numbers-modes)
  (add-hook mode-hook (lambda () (display-line-numbers-mode -1))))

;; --- Catppuccin 主题配置 ---
(use-package catppuccin-theme
  :config
  ;; 设置你喜欢的色调，可选：'latte, 'frappe, 'macchiato, 'mocha
  (setq catppuccin-flavor 'latte) 
  (load-theme 'catppuccin t))

;; --- 3. 缩进与排版配置 ---
(setq-default indent-tabs-mode nil) ;; 禁用 Tab，用空格代替
(setq-default tab-width 2)          ;; 全局缩进宽度为 2
(setq c-basic-offset 2)             ;; C/C++ 缩进偏移量为 2

;; --- 4. 基础编辑增强插件 ---

;; smartparens: 智能括号配对
(use-package smartparens
  :config 
  (smartparens-global-mode t) 
  (show-paren-mode t))

;; yasnippet: 代码片段/模板引擎
(use-package yasnippet
  :ensure t
  :config
  (setq yas-verbosity 1) ;; 减少冗余日志
  (yas-global-mode 1))

;; --- 语法检查基础框架 (通用) ---
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t)
  :config
  ;; 如果你觉得检查太频繁，可以设置延迟（单位：秒）
  (setq flycheck-check-syntax-automatically '(save mode-enabled idle-change))
  (setq flycheck-idle-change-delay 1.0))

;; --- 全局 LSP 基础配置 ---
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred) ;; 延迟加载，提高启动速度
  :bind (:map lsp-mode-map     ;; 只要是 LSP 激活的地方，这些快捷键都通用
         ("M-." . lsp-find-definition)
         ("M-?" . lsp-find-references))
  :config
  ;; 1. 基础性能优化 (所有语言通用)
  (setq lsp-idle-delay 0.5)                 ;; 响应延迟
  (setq lsp-diagnostics-provider :flycheck) ;; 强制使用我们刚才配置的全局 Flycheck
  
  ;; 2. 视觉偏好
  (setq lsp-enable-symbol-highlighting t)   ;; 符号高亮
  (setq lsp-ui-doc-enable nil)              ;; 禁用浮窗（尤其是在终端环境下）
  (setq lsp-headerline-breadcrumb-enable nil) ;; 禁用顶部的面包屑导航（可选，看个人喜好）
  
  ;; 3. 性能小贴士：调大 Emacs 每次读取进程数据的缓存（默认太小，LSP 会卡）
  (setq read-process-output-max (* 1024 1024)))

;; --- 结尾 ---
(provide 'init-basic)
