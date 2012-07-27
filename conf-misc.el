;; -*- coding: utf-8 -*-

;; 如果使用的 Emacs 版本没有相应的模式，那么需要使用不同的设置方法（以 recentf-mode 为例）：

;; (if (fboundp 'recentf-mode) (recentf-mode t))

(global-font-lock-mode t)
(global-linum-mode t)
(global-hi-lock-mode t)
(global-auto-revert-mode 1)

(delete-selection-mode t)
(recentf-mode t)
(setq recentf-save-file "~/.emacs.d/.recentf")

(provide 'conf-misc)
