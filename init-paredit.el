;; -*- coding: utf-8; -*-

(require 'paredit nil t)

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "M-r") 'move-to-window-line-top-bottom)
     (define-key paredit-mode-map (kbd "M-R") 'paredit-raise-sexp)
     (define-key paredit-mode-map (kbd "C-j") 'open-newline-indent)
     (define-key paredit-mode-map (kbd "M-j") 'open-newline-above)

     ;; lisp-related-mode-hook: global-variable.el
     ;; FIXME: 不能在 ielm-mode 中启用 paredit
     (dolist (hook lisp-related-mode-hook)
       (add-hook hook 'enable-paredit-mode))))

(provide 'init-paredit)
