;; -*- coding: utf-8 -*-

(require 'package)

(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/"))

(package-initialize)

(provide 'conf-package)
