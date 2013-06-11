(require 'keyfreq)

(let ((file1 (getenv "KEYFREQ_FILE"))
      (file2 "~/Dropbox/conf/.keyfreq")
      (file3 "~/.emacs.d/.keyfreq"))
  (cond
   (file1
    (setq keyfreq-file file1))
   ((file-exists-p file2)
    (setq keyfreq-file file2))
   ((file-exists-p file3)
    (setq keyfreq-file file3))
   (t
    (message "init-keyfreq: keyfreq-file leave to default."))))

(setq keyfreq-file-lock "~/.emacs.d/.keyfreq.lock")

(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(provide 'init-keyfreq)
