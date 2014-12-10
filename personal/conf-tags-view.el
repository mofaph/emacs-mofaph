
;; elisp-dir: global-variable.el
(when (file-exists-p (expand-file-name (concat elisp-dir "tags-view.el")))
  (require 'tags-view "tags-view.el")
  (global-set-key (kbd "M-6") 'tv-view-history))

(provide 'conf-tags-view)
