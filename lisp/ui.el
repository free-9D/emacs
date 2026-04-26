;;; ui.el --- 界面显示与交互补全配置 -*- lexical-binding: t; -*-

;; --- 1. 核心交互界面 (Vertico) ---
(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  :config
  ;; 允许循环滚动，到列表底部后回到顶部，操作更连贯
  (setq vertico-cycle t)
  ;; 终端下建议增加列表高度以利用空间
  (setq vertico-count 12))

;; --- 2. 补全注解增强 (Marginalia) ---
(use-package marginalia
  :ensure t
  :init
  ;; 在 Minibuffer 选项右侧显示文件大小、权限、行号等元数据
  (marginalia-mode))

;; --- 3. 快捷键提示 (Which-key) ---
(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  ;; 设置弹出等待时间（秒），0.5 秒比较适合终端用户
  (setq which-key-idle-delay 0.5)
  
  ;; 设置弹出位置，终端建议放在底部 (side-window-bottom)
  (setq which-key-popup-type 'side-window)
  
  ;; 针对终端环境的视觉优化：
  ;; 如果终端窗口较小，可以限制最大高度
  (setq which-key-side-window-max-height 0.25))

;; --- 4. 侧边栏文件树 (Treemacs) ---
(use-package treemacs
  :ensure t
  :bind
  ;; 绑定快捷键，对应 Telescope 用户习惯的目录树切换
  ("C-x t t" . treemacs)
  ("C-x t B" . treemacs-bookmark)
  ("C-x t C-t" . treemacs-find-file))

(provide 'ui)
