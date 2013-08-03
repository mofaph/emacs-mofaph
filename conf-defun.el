;; -*- coding: utf-8 -*-

(defun open-newline-indent ()
  "Open new line and indent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "C-j") 'open-newline-indent)

(dolist (hook (append c-related-mode-hook
                      lisp-related-mode-hook
                      '(
                        asm-mode-hook
                        sh-mode-hook
                        )))
  (add-hook hook (lambda () (local-set-key (kbd "C-j") 'open-newline-indent))))

(defun open-newline-above ()
  "open a new line above current line."
  (interactive)
  (indent-according-to-mode)
  (move-end-of-line 1)
  (delete-horizontal-space t)
  (move-beginning-of-line 1)
  (open-line 1)
  (indent-according-to-mode))

(global-set-key (kbd "M-j") 'open-newline-above)

(dolist (hook (append c-related-mode-hook
                      lisp-related-mode-hook
                      '(
                        asm-mode-hook
                        sh-mode-hook
                        )))
  (add-hook hook (lambda () (local-set-key (kbd "M-j") 'open-newline-above))))

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

(defun give-tips-when-want-quit-emacs ()
  "Prevent ancident hit C-x C-c."
  (interactive)
  (message "Please using save-buffers-kill-terminal to quit Emacs."))

(global-set-key (kbd "C-x C-c") 'give-tips-when-want-quit-emacs)

;;;###autoload
(defun visit-term-buffer ()
  "Create or visit a terminal buffer.

Token from: http://emacsredux.com/blog/2013/03/29/terminal-at-your-fingertips/"
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term (getenv "SHELL")))
    (switch-to-buffer-other-window "*ansi-term*")))

(global-set-key (kbd "C-c t") 'visit-term-buffer)

;;;###autoload
(defun random-theme()
  "Random select theme

Token from: https://github.com/baohaojun/system-config/blob/master/.emacs_d/lisp/bhj-defines.el
"
  (interactive)
  (dolist (theme custom-enabled-themes)
    (disable-theme theme))
  (load-theme (let ((theme (nth (random (length (custom-available-themes))) (custom-available-themes))))
                (message "loaded theme: %s" theme)
                theme)))

;;;###autoload
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting.

Token from: http://whattheemacsd.com/file-defuns.el-01.html#disqus_thread
"
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

;;;###autoload
(defun top-join-line ()
  "Join the current line with the line beneath it.

Token from: http://emacsredux.com/blog/2013/05/30/joining-lines/"
  (interactive)
  (delete-indentation 1))

(global-set-key (kbd "C-^") 'top-join-line)

;;;###autoload
(defun find-user-init-file ()
  "Find emacs init file, usually called init.el.

Token from: http://emacsredux.com/blog/2013/05/18/instant-access-to-init-dot-el/"
  (interactive)
  (find-file user-init-file))

(global-set-key (kbd "C-c I") 'find-user-init-file)

;;;###autoload
(defun find-key-binding-record ()
  (interactive)
  (find-file (concat user-emacs-directory "conf-key-binding.el")))

(global-set-key (kbd "C-c K") 'find-key-binding-record)

(provide 'conf-defun)
