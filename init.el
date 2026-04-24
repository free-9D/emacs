;;; init.el --- 核心调度

(setq inhibit-startup-message t)    ;; 禁用启动画面
(setq initial-scratch-message nil) ;; scratch 缓冲留白
(setq display-pkg-info nil)        ;; 减少包信息提示

;; 针对 GDK 错误的潜在缓解方案：禁用一些高级 UI 特性
(setq use-dialog-box nil)
(setq use-file-dialog nil)

;; 1. 优先设置国内镜像源
(require 'package)
(setq package-archives '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; 2. 强制不检查签名（如果因为时间同步问题报错，可以加上这一行）
(setq package-check-signature nil)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(package-initialize)

;; 3. 剩下的 use-package 配置保持不变
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
    (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; 加载路径
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; 模块启动
(require 'init-basic)
(require 'init-cpp)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
