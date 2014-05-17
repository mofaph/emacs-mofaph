;; -*- coding: utf-8; -*-

(require 'hippie-exp)

(global-unset-key (kbd "M-/"))
(global-set-key (kbd "M-/") 'hippie-expand)

(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-all-abbrevs
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-list
        try-expand-line))

(provide 'conf-hippie-expand)
