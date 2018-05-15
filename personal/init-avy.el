(require 'avy)

(global-set-key (kbd "M-g M-g") 'avy-goto-char)
(global-set-key (kbd "M-g M-w") 'avy-goto-word-0)
(global-set-key (kbd "M-g l") 'avy-goto-line)

(global-set-key (kbd "M-g M-q") 'avy-pop-mark)

(provide 'init-avy)
