;; -*- coding: utf-8 -*-

;; elisp-dir: global-variable.el
(when (file-exists-p (expand-file-name (concat elisp-dir "qmake.el")))
  (require 'qmake-mode "qmake.el"))

(provide 'conf-qmake-mode)
