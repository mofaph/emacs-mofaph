(require 'diminish)

(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "whitespace"  '(diminish 'whitespace-mode))
(eval-after-load "company" '(diminish 'company-mode))
(diminish 'projectile-mode)
(diminish 'undo-tree-mode)
(diminish 'highlight-parentheses-mode)
(diminish 'abbrev-mode)
(diminish 'magit-auto-revert-mode)
(diminish 'helm-mode)

(provide 'init-diminish)
