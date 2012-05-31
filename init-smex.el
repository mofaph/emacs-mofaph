(require 'smex)
(smex-initialize)
(setq smex-save-file "~/.emacs.d/.smex-items")

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-x M-x") 'execute-extended-command)
