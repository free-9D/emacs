;;; init-cpp.el --- C/C++ 开发环境配置 (Eglot 现代版)

;; ==========================================================
;; 1. C/C++ 视觉与 Hook 配置
;; ==========================================================
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)
(add-hook 'c-mode-common-hook #'my/cpp-ui-enhancements)

;; ==========================================================
;; 2. 自定义 UI 增强函数 (适配 Gruvbox 主题)
;; ==========================================================
(defun my/cpp-ui-enhancements ()
  "专门针对 C++ 编辑环境的视觉微调"
  
  ;; 1. 增强括号匹配颜色
  (set-face-attribute 'show-paren-match nil
                      :background "#3c3836" ;; Gruvbox 经典灰褐色
                      :foreground "#fabd2f" ;; Gruvbox 亮黄色
                      :weight 'bold)

  ;; 2. 增强当前行号的颜色
  (set-face-attribute 'line-number-current-line nil
                      :foreground "#fe8019" ;; Gruvbox 鲜橙色
                      :weight 'bold)

  ;; 3. 开启高亮当前行
  (hl-line-mode 1))

(provide 'init-cpp)
