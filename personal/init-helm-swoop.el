(require 'helm)
(require 'helm-swoop)

(global-set-key (kbd "C-c h s") 'helm-swoop)
(global-set-key (kbd "C-c h a") 'helm-multi-swoop-all)

(provide 'init-helm-swoop)
