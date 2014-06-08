;; -*- coding: utf-8 -*-

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

;; 当编译失败时,跳转到第一个错误
(setq compilation-auto-jump-to-first-error t)

;; 当编译成功时，自动关闭编译消息窗口
(setq compilation-finish-functions
      (lambda (buf str)
        (when (and (string= (buffer-name buf) "*compilation*")
                   (not (string-match "exited abnormally" str)))
          (run-at-time 0.0 nil 'delete-windows-on buf))))

;; 自动缩进
;; 这里没有使用 electric-indent-mode，因为这个次模式在自动缩进方面有问题
;; 它不能很好地处理在行末或者是空白行的行首键入 C-o，它总是会缩进不该缩进的行
(dolist (hook (append lisp-related-mode-hook
                      '(sh-mode-hook)))
  (add-hook hook (lambda () (local-set-key (kbd "RET") 'newline-and-indent))))

(electric-pair-mode 1)

;; 高亮 FIXME|WARNING|BUG|NOTE|TODO 关键字
(dolist (mode (append c-related-mode
                      lisp-related-mode
                      '(sh-mode)))
  (font-lock-add-keywords mode
                          '(("\\<\\(FIXME\\|WARNING\\|BUG\\|NOTE\\|TODO\\):?\\>"
                             1
                             font-lock-warning-face t))))

(defun highlight-80+-column ()
  "Highlight characters which exceed 80.

Token from https://github.com/purcell/emacs.d/blob/master/init-editing-utils.el"
  (when (= show-trailing-whitespace 1)  ; conf-basic.el
    (set (make-local-variable 'whitespace-style) '(face trailing lines-tail))
    (whitespace-mode 0)
    (whitespace-mode 1)))

(add-hook 'prog-mode-hook 'highlight-80+-column)

;;; 在以下的模式中，不要显示行尾的空白
;;; https://github.com/purcell/emacs.d/blob/master/lisp/init-editing-utils.el
(dolist (hook '(special-mode-hook
                eshell-mode-hook
                eww-mode
                slime-repl-mode-hook
                term-mode-hook
                comint-mode-hook
                compilation-mode-hook
                twittering-mode-hook
                minibuffer-setup-hook))
  (add-hook hook
            (lambda () (setq show-trailing-whitespace nil))))

(provide 'conf-program)
