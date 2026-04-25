;;; init-cpp.el --- C/C++ 开发环境配置 (稳定兼容版)

;; ==========================================================
;; 1. LSP Mode (Language Server Protocol) 配置
;; ==========================================================
;; --- C/C++ 特定配置 ---
(use-package lsp-mode
  :hook ((c-mode . lsp)
         (c++-mode . lsp)
         ;; 调用我们在 init-cpp 定义的视觉微调
         (c-mode-common-hook . my/cpp-ui-enhancements)))

;; ==========================================================
;; 2. 自定义 UI 增强函数 (UI Enhancements)
;; ==========================================================
;; 使用 defun 定义一个函数：(defun 函数名 (参数列表) "文档注释" 代码体)
(defun my/cpp-ui-enhancements ()
  "专门针对 C++ 编辑环境的视觉微调函数"
  
  ;; --- Face (样式) 修改 ---
  ;; set-face-attribute 用来修改 Emacs 的“脸”（即字体颜色、背景等）
  
  ;; 1. 修改括号匹配外观：背景设为深灰色 (#585b70)，文字设为淡粉色 (#f5c2e7)
  (set-face-attribute 'show-paren-match nil
                      :background "#585b70"
                      :foreground "#f5c2e7"
                      :weight 'bold)

  ;; 2. 修改当前行号颜色：设为 Catppuccin 经典的薰衣草紫 (#cba6f7)，并加粗
  (set-face-attribute 'line-number-current-line nil
                      :foreground "#cba6f7"
                      :weight 'bold)

  ;; 3. 开启“当前行高亮”模式：在光标所在行下方显示一个淡淡的底色
  (hl-line-mode 1))


;; ==========================================================
;; 3. LSP UI 扩展配置
;; ==========================================================
(use-package lsp-ui
  :ensure t
  :after lsp-mode  ;; 确保在 lsp-mode 加载之后再加载此模块
  :config

  (setq lsp-diagnostics-provider :flycheck) ;; 强制使用 flycheck
  ;; 启用 Sideline：在行末直接显示报错信息或符号信息
  (setq lsp-ui-sideline-enable t)
  ;; 在 Sideline 中显示诊断结果（如语法错误提示）
  (setq lsp-ui-sideline-show-diagnostics t)
  
  ;; 定义全局快捷键：Ctrl-c e 快速打开项目内所有错误的列表窗口
  (global-set-key (kbd "C-c e") #'lsp-ui-flycheck-list))


;; ==========================================================
;; 4. Company (Complete Any) 补全引擎配置
;; ==========================================================
(use-package company
  :ensure t
  ;; 在 Emacs 初始化完成后开启全局补全模式
  :hook (after-init . global-company-mode)
  :init 
  ;; 显式开启全局模式
  (global-company-mode t)
  :config
  ;; 设置补全弹出延迟为 0 秒（即刻弹出）
  (setq company-idle-delay 0.0)
  ;; 设置输入 1 个字符后就开始尝试补全
  (setq company-minimum-prefix-length 1)
  
  ;; 核心优化：从补全后端列表中删除 company-clang
  ;; 原因：既然我们已经有了强大的 lsp-mode (clangd)，就不需要旧的 company-clang 干扰了
  (setq company-backends (delete 'company-clang company-backends)))


;; 声明本模块已就绪，方便 init.el 查找引用
(provide 'init-cpp)

;;; init-cpp.el 结束
