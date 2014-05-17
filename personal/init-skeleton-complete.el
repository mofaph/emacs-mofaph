(if (require 'skeleton-complete nil t)
    (progn (skeleton-complete-global-mode 1))
  (message "Warning: no skeleton-complete installed."))

(provide 'init-skeleton-complete)
