(require 'smartrep)

(smartrep-define-key global-map "M-g"
  '(("n" . (next-error))))

(provide 'init-smartrep)
