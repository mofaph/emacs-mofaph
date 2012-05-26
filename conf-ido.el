(require 'ido)

(ido-mode t)
(global-set-key (kbd "C-x C-f") 'ido-find-file)

(provide 'conf-ido)
