(require 'keyfreq)

(defun turnon-keyfreq-mode ()
  (interactive)
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(defun turnoff-keyfreq-mode ()
  (interactive)
  (keyfreq-mode -1)
  (keyfreq-autosave-mode -1))

(setq keyfreq-excluded-commands
      '(self-insert-command
        abort-recursive-edit
        ace-jump-done
        ace-jump-move
        backward-char
        backward-kill-word
        backward-word
        browse-kill-ring-insert-and-quit
        browse-kill-ring-forward
        browse-kill-ring-quit
        clipboard-kill-ring-save
        company-complete-common
        company-complete-number
        company-complete-selection
        company-ignore
        comint-send-input
        comint-previous-input
        delete-backward-char
        ;; {{ nothing to optimize in dired
        dired
        dired-do-async-shell-command
        dired-find-file
        diredp-next-line
        diredp-previous-line
        ;; }}
        describe-variable
        erase-message-buffer
        eval-buffer
        ffip
        forward-char
        forward-word
        goto-line
        pwd
        ido-complete
        ido-delete-backward-updir
        ido-exit-minibuffer
        ido-switch-buffer
        indent-new-comment-line
        isearch-abort
        isearch-other-meta-char
        isearch-other-control-char
        isearch-backward-regexp
        isearch-cancel
        isearch-delete-char
        isearch-exit
        isearch-forward-regexp
        isearch-printing-char
        isearch-repeat-forward
        isearch-ring-retreat
        ispell-minor-check
        keyboard-escape-quit
        keyboard-quit
        keyfreq-mode
        keyfreq-save-now
        keyfreq-show
        kill-sentence
        left-char
        minibuffer-complete
        minibuffer-complete-and-exit
        minibuffer-keyboard-quit
        move-beginning-of-line
        move-end-of-line
        newline-and-indent
        next-history-element
        next-line
        hippie-expand
        org-beginning-of-line
        org-cycle
        org-end-of-line
        org-force-self-insert
        org-return
        org-self-insert-command
        package-menu-execute
        previous-history-element
        previous-line
        quit-window
        right-char
        save-buffer
        save-buffers-kill-terminal
        self-insert-command
        suspend-frame
        turnon-keyfreq-mode
        undo-tree-redo
        undo-tree-undo
        yank
        ))

(setq keyfreq-file (concat user-emacs-directory "keyfreq"))
(setq keyfreq-file-lock (concat user-emacs-directory "keyfreq.lock"))

(unless (file-exists-p (file-truename keyfreq-file))
  (with-temp-buffer
    (insert "()")
    (write-file (file-truename keyfreq-file))))

;; And use keyfreq-show to see how many times you used a command.
;; comment out below line if there is performance impact
(turnon-keyfreq-mode)
(provide 'init-keyfreq)
