;; http://www.emacswiki.org/emacs/IbufferMode#toc3

(require 'ibuffer)
(require 'ibuf-ext)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(add-to-list 'ibuffer-never-show-predicates "^\\*")

(provide 'conf-ibuffer)
