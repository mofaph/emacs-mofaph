;; -*- coding: utf-8 -*-

;;; mofaph@gmail.com
;;; 2009-7-13

(load "~/.emacs.d/global-variable.el")

(require 'conf-basic)
(require 'conf-ido)
(require 'conf-recentf)
(require 'conf-ibuffer)
(require 'conf-icomplete)
(require 'conf-font)
(require 'conf-misc)
(require 'conf-program)
(require 'conf-gui)

(require 'conf-info)
(require 'conf-dired)
(require 'conf-cc-mode)
(require 'conf-ruby-mode)
(require 'conf-org-mode)

;; 暂时不能使用 package.el 管理的插件
(require 'conf-qmake-mode)
(require 'conf-slime)
; elisp/ac-company

;; 使用 package.el 管理第三方插件
(require 'conf-package)

;; 配置 package.el 管理的插件
;; 同时需要更新 installed-packages.txt
(ido-ubiquitous)
(require 'browse-kill-ring)
(require 'switch-window)
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode) ; c-eldoc
(require 'lua-mode)

(require 'init-nav)
(require 'init-smex)
(require 'init-ido-complete-space-or-hyphen)
(require 'init-ido-vertical-mode)
(require 'init-undo-tree)
(require 'init-multiple-cursors)
(require 'init-region-bindings-mode)
(require 'init-ace-jump-mode)
(require 'init-popwin)
(require 'init-hungry-delete)
(require 'init-move-text)
(require 'init-expand-region)
(require 'init-kill-ring-search)
(require 'init-show-marks)
(require 'init-highlight-symbol)
(require 'init-auto-complete)
(require 'init-auto-complete-clang)
(require 'init-magit)
(require 'init-company-mode)
(require 'init-paredit)
(require 'init-keyfreq)
(require 'init-buffer-move)

(require 'conf-key-binding)
(require 'conf-defun)
(require 'conf-session)

;; Local Variables:
;; no-byte-compile: t
;; End:
