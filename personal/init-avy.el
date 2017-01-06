(require 'avy)

(global-unset-key (kbd "C-q"))
(global-set-key (kbd "C-q") 'avy-goto-word-0)

(global-set-key (kbd "M-g M-g") 'avy-goto-char)
(global-set-key (kbd "M-g M-f") 'avy-goto-line)

(global-set-key (kbd "C-c i c") 'avy-copy-line)
(global-set-key (kbd "C-c i m") 'avy-move-line)
(global-set-key (kbd "C-c i r") 'avy-copy-region)

(global-set-key (kbd "M-g M-q") 'avy-pop-mark)

(provide 'init-avy)
