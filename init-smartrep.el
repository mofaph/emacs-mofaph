(require 'smartrep)

(smartrep-define-key global-map "M-g"
  '(("n" . (next-error))
    ("p" . (previous-error))))

(provide 'init-smartrep)
