;;; early-init.el --- 启动优化配置 -*- lexical-binding: t -*-

;; 1. 垃圾回收（GC）优化
(setq gc-cons-threshold most-positive-fixnum)

;; 2. 暂时禁用文件处理器
(setq file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

;; 3. 界面预设（防止启动时闪烁 & 极致纯净）
(setq default-frame-alist
      '((menu-bar-lines . 0)
        (tool-bar-lines . 0)
        (vertical-scroll-bars . nil)
        ;; 额外建议：禁止窗口内边距闪烁
        (internal-border-width . 0)
        (left-fringe . 8)
        (right-fringe . 8)))

;; 4. 禁用 package.el 自动初始化
(setq package-enable-at-startup nil)

;; 5. 阻止默认的 UI 元素加载（双重保险）
;; 即使在终端启动，这些设置也能确保加载过程更轻量
(setq inhibit-x-resources t)

;; 6. 简单的编码优化
(set-language-environment "UTF-8")

;; --- 配置结束 ---
