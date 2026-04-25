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
    )
  "不希望显示行号的模式列表")

;; 遍历列表，为这些模式统一挂上“禁用行号”的钩子
(dolist (mode-hook my/no-line-numbers-modes)
  (add-hook mode-hook (lambda () (display-line-numbers-mode -1))))

;; --- Gruvbox 主题配置 ---
(use-package gruvbox-theme
  :ensure t
  :config
  ;; 加载 Gruvbox 的深色高对比度版本
  ;; 可选版本：gruvbox-dark-soft, gruvbox-dark-medium, gruvbox-dark-hard
  (load-theme 'gruvbox-dark-medium t))

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

;; --- 结尾 ---
(provide 'init-basic)
