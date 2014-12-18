(require 'diminish)

(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "whitespace"  '(diminish 'whitespace-mode))
(diminish 'company-mode)
(diminish 'paredit-mode)
(diminish 'projectile-mode)
(diminish 'undo-tree-mode)
(diminish 'highlight-parentheses-mode)
(diminish 'abbrev-mode)
(diminish 'magit-auto-revert-mode)
(diminish 'helm-gtags-mode)

(provide 'init-diminish)
