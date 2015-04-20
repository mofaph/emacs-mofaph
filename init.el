;; -*- coding: utf-8 -*-

;;; mofaph@gmail.com
;;; 2009-7-13

(load (concat user-emacs-directory "personal/global-variable.el"))

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
(require 'conf-cmake-mode)
(require 'conf-find-file)
(require 'conf-hippie-expand)

;;; manual

(require 'conf-slime)
(require 'elpa-mirror "elpa-mirror.el" 'dont-singal-error-if-file-not-found)

;;; package.el

(require 'conf-package)

(require 'better-defaults)
(ido-ubiquitous)
(require 'init-flx-ido)
(require 'init-ido-sort-mtime)
(require 'init-switch-window)
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode) ; c-eldoc
(require 'lua-mode)
(require 'fixme-mode)

(require 'init-helm)
(require 'init-helm-gtags)
(require 'init-swiper-helm)
(require 'init-ido-complete-space-or-hyphen)
(require 'init-ido-vertical-mode)
(require 'init-undo-tree)
(require 'init-multiple-cursors)
(require 'init-ace-jump-mode)
(require 'init-popwin)
(require 'init-projectile)
(require 'init-hungry-delete)
(require 'init-move-text)
(require 'init-expand-region)
(require 'init-highlight-parentheses)
(require 'init-highlight-symbol)
(require 'init-magit)
(require 'init-company-mode)
(require 'init-paredit)
(require 'init-keyfreq)
(require 'init-buffer-move)
(require 'init-smartrep)
(require 'init-xcscope)
(require 'init-diminish)

(require 'conf-key-binding)
(require 'conf-defun)
(require 'conf-session)

(run-at-time 5 nil 'next-review-day)

;; Local Variables:
;; no-byte-compile: t
;; End:
