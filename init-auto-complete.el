;; http://cx4a.org/software/auto-complete/manual.html

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default) ; also enable global-auto-complete-mode

(add-to-list 'ac-dictionary-directories "~/.emacs.d/.ac-dict")
(setq ac-user-dictionary-files "~/.emacs.d/.dict")

(setq ac-auto-show-menu nil)
(setq ac-auto-start nil)
(setq ac-dwim nil)

(ac-set-trigger-key "TAB")
(define-key ac-mode-map (kbd "M-/") 'auto-complete)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

(ac-clear-dictionary-cache)

(provide 'init-auto-complete)
