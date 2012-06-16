(require 'ido)

(ido-mode t)
(setq ido-ignore-buffers '("\\` "
                           "\\*scratch\\*"
                           "Completions\\*$"
                           "\\*Help\\*"
                           "^\\*Ido"
                           "^\\*Messages\\*"))

(provide 'conf-ido)
