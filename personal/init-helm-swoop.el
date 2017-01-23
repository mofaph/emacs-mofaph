(require 'helm)
(require 'helm-swoop)

(global-set-key (kbd "C-c h s") 'helm-swoop)
(global-set-key (kbd "C-c h a") 'helm-multi-swoop-all)

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows t)

(provide 'init-helm-swoop)
