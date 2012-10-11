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
(dolist (hook '(emacs-lisp-mode-hook
                c-mode-hook
                c++-mode-hook
                lisp-mode-hook
                objc-mode-hook
                java-mode
                sh-mode-hook))
  (local-set-key (kbd "M-j") 'open-newline-above))

;; 使用 lambda 替代 _lambda_ （加下划线是因为在 Emacs 中设置会原地生效）
;; http://stackoverflow.com/questions/154097/whats-in-your-emacs
(defun sm-lambda-mode-hook ()
  (font-lock-add-keywords
   nil `(("\\<lambda\\>"
          (0 (progn (compose-region (match-beginning 0) (match-end 0)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(dolist (lisp-hook '(emacs-lisp-mode-hook
                     lisp-mode-hook
                     lisp-interactive-mode-hook
                     scheme-mode-hook))
  (add-hook lisp-hook 'sm-lambda-mode-hook))

;; 拷贝正则匹配的文本到 kill-ring，同时匹配的文本显示在一个缓冲区中
;; http://stackoverflow.com/questions/2289883/emacs-copy-matching-lines
(defun copy-lines-matching-re (re)
  "find all lines matching the regexp RE in the current buffer
putting the matching lines in a buffer named *matching*"
  (interactive "sRegexp to match: ")
  (let ((result-buffer (get-buffer-create "*matching*")))
    (with-current-buffer result-buffer
      (erase-buffer))
    (save-match-data
      (save-excursion
        (goto-char (point-min))
        (while (re-search-forward re nil t)
          (princ (buffer-substring-no-properties (line-beginning-position)
                                                 (line-beginning-position 2))
                 result-buffer))))
    (pop-to-buffer result-buffer)))

(defun move-beginning-of-line-enhance ()
  "Enhance the default move-beginning-of-line.

When the cursor looks like:

`'    hello w|orld`'

you pressed `'C-a`', and the cursor move to the real beginning of line.

If you pressed `'C-a`' again, you will get the cursor at the
first non-whitespace char:

`'    |hello world`'
"
  (interactive)
  (let ((column (- (point) (point-at-bol))))
    (cond
     ((/= column 0) (move-beginning-of-line nil))
     (t (back-to-indentation)))))

(global-set-key (kbd "C-a") 'move-beginning-of-line-enhance)

(provide 'conf-defun)
