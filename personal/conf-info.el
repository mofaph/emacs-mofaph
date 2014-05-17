(eval-after-load 'info
  '(progn
     (add-hook 'Info-mode-hook (lambda () (setq show-trailing-whitespace nil)))
     (setq Info-hide-note-references nil)))

(provide 'conf-info)
