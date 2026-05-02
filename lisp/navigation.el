;;; navigation.el --- 全局搜索与项目导航配置 -*- lexical-binding: t; -*-

;; --- 1. 搜索匹配算法 (Orderless) ---
(use-package orderless
  :ensure t
  :custom
  ;; 支持类似 Telescope 的多关键词搜索（空格分隔即可，不分顺序）
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  ;; 针对文件搜索，优先尝试部分匹配
  (completion-category-overrides '((file (styles . (partial-completion))))))

;; --- 2. 核心搜索增强 (Consult) ---
(use-package consult
  :ensure t
  :bind (;; 类似 Telescope find_files (查找项目内文件)
         ("C-x f" . project-find-file)
         ;; 类似 Telescope current_buffer_fuzzy_find (当前文件实时搜索)
         ("M-g g" . consult-line)
         ;; 类似 Telescope live_grep (项目内实时全文搜索)
         ("M-g r" . consult-ripgrep)
         ;; Consult-imenu (函数导航)
         ("M-g i" . consult-imenu)
         ;; 类似 Telescope buffers (快速切换 Buffer)
         ("C-x b" . consult-buffer))
  :custom
  ;; 针对终端环境优化的预览设置：
  ;; 延迟 0.5 秒预览，防止快速移动时光标抖动，any 表示任意键触发预览
  (consult-preview-key '(:debounce 0.5 any))
  
  ;; 使用更快的 fd 工具替代传统的 find 命令
  (consult-find-args "fd --color=never --hidden --full-path")
  
  :config
  ;; 如果是在虚拟机终端运行，可以根据需要禁用某些复杂预览
  (setq consult-project-function (lambda (_) (project-root (project-current)))))

(use-package multiple-cursors
  :ensure t
  :bind (
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)))

(provide 'navigation)
