;; -*- coding: utf-8 -*-

;; elisp-dir 已经在 ~/.emacs.d/init.el 中定义了
(when (file-directory-p (expand-file-name elisp-dir))
  (require 'qmake-mode "qmake.el"))

(provide 'conf-qmake-mode)
