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

;; 高亮 FIXME 关键字
(dolist (mode '(c-mode
                c++-mode
                emacs-lisp-mode
                lisp-mode
                java-mode
                sh-mode))
  (font-lock-add-keywords mode
                          '(("\\<\\(FIXME\\)\\>" 1 font-lock-warning-face t))))

;; https://github.com/purcell/emacs.d/blob/master/init-editing-utils.el
(defun highlight-80+-column ()
  (when (= show-trailing-whitespace 1)  ; conf-basic.el
    (set (make-local-variable 'whitespace-style) '(face trailing lines-tail))
    (whitespace-mode 0)
    (whitespace-mode 1)))

(add-hook 'prog-mode-hook 'highlight-80+-column)

(provide 'conf-program)
