;; -*- coding: utf-8; -*-

(require 'paredit nil t)

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "M-r") 'move-to-window-line-top-bottom)
     (define-key paredit-mode-map (kbd "M-R") 'paredit-raise-sexp)

     ;; lisp-related-mode-hook: conf-program.el
     (dolist (hook lisp-related-mode-hook)
       (add-hook hook 'enable-paredit-mode))))

(provide 'init-paredit)
