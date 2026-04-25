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

;; --- 3. 侧边栏文件树 (Treemacs) ---
(use-package treemacs
  :ensure t
  :bind
  ;; 绑定快捷键，对应 Telescope 用户习惯的目录树切换
  ("C-x t t" . treemacs)
  ("C-x t B" . treemacs-bookmark)
  ("C-x t C-t" . treemacs-find-file))

(provide 'ui)
