(require 'switch-window)

(global-unset-key (kbd "C-x o"))
(global-set-key (kbd "C-x o") 'switch-window)

(provide 'init-switch-window)
