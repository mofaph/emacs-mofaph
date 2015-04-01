;; desktop
(load "desktop")
(setq-default desktop-dirname user-emacs-directory)
(setq-default desktop-load-locked-desktop t)
(setq desktop-save 'if-exists)
(setq desktop-restore-reuses-frames nil)
(desktop-save-mode 1)
(desktop-read user-emacs-directory)

(provide 'conf-session)
