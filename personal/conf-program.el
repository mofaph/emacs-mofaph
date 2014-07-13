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

;; 当编译失败时,跳转到第一个错误
(setq compilation-auto-jump-to-first-error t)

;; 当编译成功时，自动关闭编译消息窗口
(setq compilation-finish-functions
      (lambda (buf str)
        (when (and (string= (buffer-name buf) "*compilation*")
                   (not (string-match "exited abnormally" str)))
          (run-at-time 0.0 nil 'delete-windows-on buf))))

;; 高亮 FIXME|WARNING|BUG|NOTE|TODO 关键字
(dolist (mode (append c-related-mode
                      lisp-related-mode
                      '(sh-mode)))
  (font-lock-add-keywords mode
                          '(("\\<\\(FIXME\\|WARNING\\|BUG\\|NOTE\\|TODO\\):?\\>"
                             1
                             font-lock-warning-face t))))

(provide 'conf-program)
