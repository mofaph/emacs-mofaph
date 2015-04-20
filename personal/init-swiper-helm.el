(require 'swiper)
(require 'swiper-helm)

(global-unset-key (kbd "C-c h o"))
(global-set-key (kbd "C-c h o") 'swiper-helm)

(provide 'init-swiper-helm)
