;; http://cx4a.org/software/auto-complete/manual.html

(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

(setq ac-auto-start nil)
(ac-config-default)
(define-key ac-mode-map (kbd "M-/") 'auto-complete)
