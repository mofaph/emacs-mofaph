;; -*- coding: utf-8 -*-

(defun turn-off-font-lock-mode ()
  (font-lock-mode 0))

(add-to-list 'prog-mode-hook 'turn-off-font-lock-mode)

(global-font-lock-mode 1)
(electric-pair-mode 1)

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

(global-set-key (kbd "C-c o") 'ff-find-other-file)

(provide 'conf-program)
