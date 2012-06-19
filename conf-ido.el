(require 'ido)

(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")

(ido-mode t)
(ido-everywhere t)

(setq ido-enable-flex-matching t)
(setq ido-ignore-buffers '(
                           "\\` "
                           "^\\*.*\\*$"
                           ))

(provide 'conf-ido)
