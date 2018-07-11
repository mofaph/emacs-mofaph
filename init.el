;; -*- coding: utf-8 -*-

;;; mofaph@gmail.com
;;; 2009-7-13


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load (concat user-emacs-directory "personal/global-variable.el"))

(require 'conf-basic)
(require 'conf-ibuffer)
(require 'conf-icomplete)
(require 'conf-font)
(require 'conf-misc)
(require 'conf-program)

(require 'conf-info)
(require 'conf-dired)
(require 'conf-cc-mode)
(require 'conf-org-mode)
(require 'conf-hippie-expand)
(require 'conf-email)

;;; manual

(require 'elpa-mirror "elpa-mirror.el" 'dont-singal-error-if-file-not-found)

;;; package.el

(require 'conf-package)

(require 'better-defaults)
(require 'init-switch-window)
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode) ; c-eldoc

(require 'init-helm)
;(require 'init-helm-swoop)
(require 'init-undo-tree)
(require 'init-multiple-cursors)
(require 'init-ace-jump-mode)
(require 'init-avy)
(require 'init-popwin)
(require 'init-projectile)
(require 'init-hungry-delete)
(require 'init-move-text)
(require 'init-expand-region)
(require 'init-highlight-parentheses)
(require 'init-magit)
(require 'init-keyfreq)
(require 'init-buffer-move)
(require 'init-smartrep)
(require 'init-cmake-ide)
(require 'init-elfeed)

(require 'conf-key-binding)
(require 'conf-defun)
(require 'conf-session)

(load-theme 'sanityinc-solarized-dark)

(run-at-time 5 nil 'next-review-day)

;; Local Variables:
;; no-byte-compile: t
;; End:
