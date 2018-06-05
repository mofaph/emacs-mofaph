(require 'avy)

(global-set-key (kbd "M-g M-g") 'avy-goto-char-2)
(global-set-key (kbd "M-g M-a") 'avy-goto-line)

(global-set-key (kbd "M-g M-q") 'avy-pop-mark)

(provide 'init-avy)
