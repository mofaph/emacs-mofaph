;; -*- coding: utf-8 -*-

;; Info node: emacs(top)->Emacs Lisp Packages
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Packages.html#Packages
;; http://ergoemacs.org/emacs/emacs_package_system.html

(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-enable-at-startup nil)

  ;; add at the end of list
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/") t)

  (package-initialize))

(provide 'conf-package)

;; Local Variables:
;; no-byte-compile: t
;; End:
