(require 'multiple-cursors)

(global-set-key (kbd "C-c m e") 'mc/edit-lines)

(global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m *") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m m") 'mc/mark-more-like-this-extended)

(provide 'init-multiple-cursors)
