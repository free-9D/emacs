;;; init-editor.el --- 基础编辑行为配置 -*- lexical-binding: t -*-

;; 集中管理备份文件
(setq backup-directory-alist
      `(("." . ,(expand-file-name "backups" user-emacs-directory))))

;; 也可以顺便把自动保存的文件也集中一下
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "backups/" user-emacs-directory) t)))

;; 禁止生成过时的锁定文件 (即 .#文件名)
(setq create-lockfiles nil)

(provide 'init-editor)
