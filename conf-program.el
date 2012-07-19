;; which-function
(setq which-func-modes t)
(which-function-mode t)

;; imenu
(setq imenu-auto-rescan t)

;; hl-line
(global-hl-line-mode 1)

;; eldoc
(add-hook 'emacs-lisp-mode-hook (lambda () (eldoc-mode 1)))
(add-hook 'lisp-interactive-mode-hook (lambda () (eldoc-mode 1)))

(provide 'conf-program)
