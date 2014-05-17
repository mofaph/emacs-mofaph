;; desktop
(load "desktop")
(setq-default desktop-dirname "~/.emacs.d")
(setq-default desktop-load-locked-desktop t)
(setq desktop-save 'if-exists)
(desktop-save-mode 1)
(desktop-read "~/.emacs.d")

(provide 'conf-session)
