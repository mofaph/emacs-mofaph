(autoload 'kill-ring-search "kill-ring-search"
 "Search the kill ring in the minibuffer."
 (interactive))

(global-set-key (kbd "C-M-y") 'kill-ring-search)

(provide 'init-kill-ring-search)
