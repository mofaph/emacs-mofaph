;; -*- coding: utf-8 -*-

(defun open-newline-indent ()
  "Open new line and indent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "C-j") 'open-newline-indent)

(defun open-newline-above ()
  "open a new line above current line."
  (interactive)
  (previous-line 1)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "M-j") 'open-newline-above)

(provide 'conf-defun)
