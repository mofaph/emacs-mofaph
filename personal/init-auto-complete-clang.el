;; -*- coding: utf-8; -*-

(require 'auto-complete-clang)

(defun ac-clang-setup ()
  (add-to-list 'ac-sources 'ac-source-clang))

(add-hook 'c-mode-common-hook 'ac-clang-setup)

(provide 'init-auto-complete-clang)
