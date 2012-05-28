(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; 安装 el-get
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
     (goto-char (point-max))
     (eval-print-last-sexp)))))

;; FIXME: 当没有安装el-get时，下面的代码将不能运行，将会出现竞争条件
(when (require 'el-get nil t)
  (setq packages '(el-get goto-last-change))
  (el-get 'sync packages)
  (el-get 'wait)
  (setq el-get-user-package-directory "~/.emacs.d")
  (el-get-init "goto-last-change")
  (el-get-init "smex"))

(provide 'conf-el-get)
