;; -*- coding: utf-8; -*-

(require 'conf-defun) ; open-newline-indent

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-j") 'open-newline-indent)))

(defun reindent-current-line-and-then-open-newline-above ()
  "Reindent current line, and then open newlline above current line."
  (interactive)
  (indent-according-to-mode)
  (delete-horizontal-space t)
  (move-beginning-of-line 1)
  (cond
   ((> (point) (point-min))
    (backward-char 1)
    (newline-and-indent))
   (t
    (open-line 1))))

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "M-j") 'reindent-current-line-and-then-open-newline-above)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))

(provide 'conf-ruby-mode)
