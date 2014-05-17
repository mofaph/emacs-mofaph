(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "C-c SPC") 'ace-jump-mode)))

(provide 'init-ace-jump-mode)
