;; -*- coding: utf-8 -*-

;; which-function
(setq which-func-modes t)
(which-function-mode t)

;; imenu
(setq imenu-auto-rescan t)

;; hl-line
(if window-system (global-hl-line-mode 1))

;; eldoc
(add-hook 'emacs-lisp-mode-hook (lambda () (eldoc-mode 1)))
(add-hook 'lisp-interactive-mode-hook (lambda () (eldoc-mode 1)))

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
