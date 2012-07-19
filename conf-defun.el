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
  (delete-horizontal-space t)
  (move-beginning-of-line 1)
  (cond
   ((> (point) (point-min))
    (backward-char 1)
    (newline-and-indent))
   (t
    (open-line 1))))

(global-set-key (kbd "M-j") 'open-newline-above)
(add-hook 'c-mode-hook (lambda () (define-key c-mode-map (kbd "M-j") 'open-newline-above)))
(add-hook 'c++-mode-hook (lambda () (define-key c++-mode-map (kbd "M-j") 'open-newline-above)))

;; 使用 lambda 替代 _lambda_ （加下划线是因为在 Emacs 中设置会原地生效）
;; http://stackoverflow.com/questions/154097/whats-in-your-emacs
(defun sm-lambda-mode-hook ()
  (font-lock-add-keywords
   nil `(("\\<lambda\\>"
          (0 (progn (compose-region (match-beginning 0) (match-end 0)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(add-hook 'emacs-lisp-mode-hook 'sm-lambda-mode-hook)
(add-hook 'lisp-interactive-mode-hook 'sm-lamba-mode-hook)
(add-hook 'scheme-mode-hook 'sm-lambda-mode-hook)

(provide 'conf-defun)
