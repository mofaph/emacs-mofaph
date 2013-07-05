(require 'highlight-parentheses)

; (setq hl-paren-colors '("blue" "red" "thistle" "orange"))

(setq hl-paren-colors '("black" "black" "black" "black"))

(setq hl-paren-background-colors '(
                                   "turquoise"
                                   "salmon"
                                   "orchid"
                                   "light pink"
                                   ))

(add-hook 'prog-mode-hook 'highlight-parentheses-mode)

(provide 'init-highlight-parentheses)
