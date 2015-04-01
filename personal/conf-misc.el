;; -*- coding: utf-8 -*-

;; 如果使用的 Emacs 版本没有相应的模式，那么需要使用不同的设置方法（以 recentf-mode 为例）：

;; (if (fboundp 'recentf-mode) (recentf-mode t))

(global-font-lock-mode t)
(global-hi-lock-mode t)
(global-auto-revert-mode 1)
(winner-mode 1)
(delete-selection-mode t)

(require 'uniquify)
;; 当寻找一个同名的文件，改变两个 buffer 的名字，前面加上目录名
(setq-default uniquify-buffer-name-style 'forward)

(provide 'conf-misc)
