;; -*- coding: utf-8 -*-

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

;; find-func
(require 'find-func)
(find-function-setup-keys)

;; 自动缩进
;; 这里没有使用 electric-indent-mode，因为这个次模式在自动缩进方面有问题
;; 它不能很好地处理在行末或者是空白行的行首键入 C-o，它总是会缩进不该缩进的行
(add-hook 'emacs-lisp-mode-hook (lambda () (define-key emacs-lisp-mode-map (kbd "RET") 'newline-and-indent)))
(add-hook 'c-mode-hook (lambda () (define-key c-mode-map (kbd "RET") 'newline-and-indent)))
(add-hook 'c++-mode-hook (lambda () (define-key c++-mode-map (kbd "RET") 'newline-and-indent)))
(add-hook 'lisp-mode-hook (lambda () (define-key lisp-mode-map (kbd "RET") 'newline-and-indent)))
(add-hook 'sh-mode-hook (lambda () (define-key sh-mode-map (kbd "RET") 'newline-and-indent)))

(provide 'conf-program)
