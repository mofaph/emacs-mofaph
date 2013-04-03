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

;; man
(setq Man-switches "-a")

;;; 定义一些语言相关的变量

(defvar c-related-mode '(c-mode
                         c++-mode
                         java-mode
                         objc-mode)
  "The C related mode.")

(defvar c-related-mode-hook
  (mapcar (lambda (mode)
            (intern (concat (symbol-name mode) "-hook")))
          c-related-mode)
  "The C related mode hook.")

(defvar lisp-related-mode '(emacs-lisp-mode
                            lisp-mode
                            lisp-interaction-mode
                            scheme-mode)
  "The Lisp related mode.")

(defvar lisp-related-mode-hook
  (mapcar (lambda (mode)
            (intern (concat (symbol-name mode) "-hook")))
          lisp-related-mode)
  "The Lisp related mode hook.")

;; 自动缩进
;; 这里没有使用 electric-indent-mode，因为这个次模式在自动缩进方面有问题
;; 它不能很好地处理在行末或者是空白行的行首键入 C-o，它总是会缩进不该缩进的行
(dolist (hook (append lisp-related-mode-hook
                      '(sh-mode-hook)))
  (add-hook hook (lambda () (local-set-key (kbd "RET") 'newline-and-indent))))

;; 高亮 FIXME|WARNING|BUG|NOTE|TODO 关键字
(dolist (mode (append c-related-mode
                      lisp-related-mode
                      '(sh-mode)))
  (font-lock-add-keywords mode
                          '(("\\<\\(FIXME\\|WARNING\\|BUG\\|NOTE\\|TODO\\):?\\>"
                             1
                             font-lock-warning-face t))))

;; https://github.com/purcell/emacs.d/blob/master/init-editing-utils.el
(defun highlight-80+-column ()
  (when (= show-trailing-whitespace 1)  ; conf-basic.el
    (set (make-local-variable 'whitespace-style) '(face trailing lines-tail))
    (whitespace-mode 0)
    (whitespace-mode 1)))

(add-hook 'prog-mode-hook 'highlight-80+-column)

(provide 'conf-program)
