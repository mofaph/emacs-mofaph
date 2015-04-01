(require 'projectile)
(require 'helm-projectile)

(projectile-global-mode)

(setq projectile-completion-system 'helm)
(helm-projectile-on)

(global-set-key (kbd "M-4") 'helm-projectile)

(provide 'init-projectile)
