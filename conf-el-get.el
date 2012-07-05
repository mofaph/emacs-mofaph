;; -*- coding: utf-8 -*-

;;; 参考链接：
;; [1] https://github.com/DarwinAwardWinner/dotemacs/blob/master/site-lisp/el-get-init.el

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(setq el-get-install-branch "master"
      el-get-verbose t
      el-get-user-package-directory "~/.emacs.d"
      el-get-default-process-sync t)

(setq packages '(
                 goto-last-change
                 smex
                 switch-window
                 ))

;; 安装 el-get
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))

;; 使用 el-get 管理其他的插件
(when (require 'el-get nil t)
  (el-get 'sync packages)
  (el-get 'wait)

  (el-get-init "goto-last-change")
  (el-get-init "smex")
  (el-get-init "switch-window")
  )

(provide 'conf-el-get)

;; Local Variables:
;; no-byte-compile: t
;; End:
