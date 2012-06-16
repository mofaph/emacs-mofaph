(require 'ido)

(ido-mode t)
(ido-everywhere t)

(setq ido-enable-flex-matching t)
(setq ido-ignore-buffers '(
                           "\\` "
                           "^\\*.*\\*$"
                           ))

(provide 'conf-ido)
