;; -*- coding: utf-8; -*-

(require 'hippie-exp)

(global-unset-key (kbd "M-/"))
(global-set-key (kbd "M-/") 'hippie-expand)

(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))

(provide 'conf-hippie-expand)
