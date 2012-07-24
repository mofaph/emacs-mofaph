;; -*- coding: utf-8 -*-

;; elisp-dir 已经在 ~/.emacs.d/init.el 中定义了
(when (file-exists-p (expand-file-name (concat elisp-dir "qmake.el")))
  (require 'qmake-mode "qmake.el"))

(provide 'conf-qmake-mode)
