;; -*- coding: utf-8 -*-

;;; mofaph@gmail.com
;;; 2009-7-13

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(defun fetch-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE.

Taken from: https://github.com/purcell/emacs.d/blob/master/init-elpa.el"
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (fetch-package package min-version t)))))

(fetch-package 'better-defaults)
(require 'better-defaults)

;; Local Variables:
;; no-byte-compile: t
;; End:
