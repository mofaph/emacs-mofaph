(require 'xcscope)

(cscope-setup)

(eval-after-load 'xcscope
  '(progn
     (define-key cscope-list-entry-keymap (kbd "M-k") 'kill-buffer-no-comfirm)))

(provide 'init-xcscope)
