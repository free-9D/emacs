;;; init.el --- 核心调度与包管理

;; --- 1. 基础包管理设置 ---
(require 'package)

;; 优先设置国内镜像源
(setq package-archives '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; 禁用签名检查（解决时间同步导致的安装失败问题）
(setq package-check-signature nil)

;; 初始化包系统
(package-initialize)

;; --- 2. Custom 文件重定向 ---
;; 将 Emacs 自动生成的配置存放到独立的 custom.el，保持 init.el 干净
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; --- 3. 自动安装 use-package ---
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
;; 默认让 use-package 自动下载不在本地的包
(setq use-package-always-ensure t)

;; --- 4. 模块调度 ---
;; 将 lisp 目录加入加载路径，方便 require 查找
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; 加载自定义模块
(require 'init-basic)
(require 'init-cpp)

;;; init.el 结束
