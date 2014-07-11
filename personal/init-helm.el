(require 'helm)

(global-set-key (kbd "M-1") 'helm-imenu)
(global-set-key (kbd "M-2") 'helm-buffers-list)
;;; M-3 helm-projectile
(global-set-key (kbd "M-4") 'helm-bookmarks)
(global-set-key (kbd "C-c h a") 'helm-apropos)
(global-set-key (kbd "C-c h f") 'helm-for-files)
(global-set-key (kbd "C-c h g") 'helm-do-grep)
(global-set-key (kbd "C-c h i") 'helm-imenu)
(global-set-key (kbd "C-c h C-@") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h m") 'helm-man-woman)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-c h r") 'helm-register)

(provide 'init-helm)
