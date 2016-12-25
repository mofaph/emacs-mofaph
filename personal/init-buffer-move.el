(require 'buffer-move)

(global-set-key (kbd "C-c z <up>")        'buf-move-up)
(global-set-key (kbd "C-c z <down>")      'buf-move-down)
(global-set-key (kbd "C-c z <left>")      'buf-move-left)
(global-set-key (kbd "C-c z <right>")     'buf-move-right)

(provide 'init-buffer-move)
