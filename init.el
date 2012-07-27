;; -*- coding: utf-8 -*-

;;; mofaph@gmail.com
;;; 2009-7-13

(defvar elisp-dir "~/.emacs.d/elisp/"
  "The directory holds the Emacs Lisp code.")

(add-to-list 'load-path elisp-dir)
(add-to-list 'load-path "~/.emacs.d")

(require 'conf-basic)
(require 'conf-ido)
(require 'conf-ibuffer)
(require 'conf-uniquify)
(require 'conf-fullscreen)
(require 'conf-theme)
(require 'conf-icomplete)
(require 'conf-winner)
(require 'conf-font)
(require 'conf-misc)
(require 'conf-program)
(require 'conf-gui)

(require 'conf-info)
(require 'conf-cc-mode)

;; 暂时不能使用 package.el 管理的插件
(require 'conf-qmake-mode)
(require 'conf-slime)

;; 使用 package.el 管理第三方插件
(require 'conf-package)

;; 配置 package.el 管理的插件
;; 同时需要更新 installed-packages.txt
(require 'browse-kill-ring)
(require 'switch-window)
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode) ; c-eldoc

(require 'init-nav)
(require 'init-smex)
(require 'init-undo-tree)
(require 'init-ace-jump-mode)
(require 'init-move-text)
(require 'init-expand-region)
(require 'init-mark-multiple)
(require 'init-kill-ring-search)
(require 'init-highlight-symbol)
(require 'init-auto-complete)
(require 'init-magit)

(require 'conf-key-binding)
(require 'conf-defun)
(require 'conf-session)

;; Local Variables:
;; no-byte-compile: t
;; End:
