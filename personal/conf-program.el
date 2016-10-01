;; -*- coding: utf-8 -*-

(electric-pair-mode 1)
(superword-mode 1)

;; which-function
(setq which-func-modes t)
(which-function-mode t)

;; imenu
(setq imenu-auto-rescan t)
(global-set-key (kbd "C-c C-j") 'imenu)

;; eldoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interactive-mode-hook 'turn-on-eldoc-mode)

;; find-func
(require 'find-func)
(find-function-setup-keys)

;; man
(setq Man-switches "-a")

(provide 'conf-program)
