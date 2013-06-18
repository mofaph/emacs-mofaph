;; -*- coding: utf-8 -*-

;; Info node: emacs(top)->Emacs Lisp Packages
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Packages.html#Packages
;; http://ergoemacs.org/emacs/emacs_package_system.html

;; 注意：使用 package.el 下载了插件之后，需要配置相应的插件，同时在
;; installed-packages.txt 中更新已经安装的插件列表
;;
;; 以 nav 为例说明配置插件的方法，为了和内置的插件区别，使用 package.el 管理的插
;; 件以 init-* 开头
;;
;; (require 'init-nav)
;;
;; 需要提供一个名为 init-nav.el 的文件在 ~/.emacs.d 目录下
;; 同时在 installed-packages.txt 中增加一行 nav
;;
;; 如果是删除一个插件，那么需要修改这个文件。同时在 installed-packages.txt 中删除
;; 对应的一行

;; https://github.com/purcell/emacs.d/blob/master/init-elpa.el
(defun fetch-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (fetch-package package min-version t)))))

(when (require 'package nil t)

  (require 'cl)

  ;; fix a package.el bug
  ;; https://github.com/bbatsov/prelude/blob/master/prelude/prelude-packages.el
  ;; http://melpa.milkbox.net/
  (setq url-http-attempt-keepalives nil)

  ;; add at the end of list
  (add-to-list 'package-archives '("melpa"              . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("tromey"             . "http://tromey.com/elpa/") t)
  (add-to-list 'package-archives '("marmalade"          . "http://marmalade-repo.org/packages/") t)

  (setq package-enable-at-startup nil)  ; 避免在处理完 init.el 后再次加载扩展包
  (package-initialize)                  ; 由于在启动时就配置包了，所以应该加载包

  (dolist (package '(
                     nav
                     smex
                     ido-complete-space-or-hyphen
                     ido-vertical-mode
                     switch-window
                     undo-tree
                     multiple-cursors
                     region-bindings-mode
                     ace-jump-mode
                     popwin
                     paredit
                     hungry-delete
                     move-text
                     buffer-move
                     expand-region
                     browse-kill-ring
                     kill-ring-search
                     c-eldoc
                     show-marks
                     highlight-symbol
                     lua-mode
                     company
                     auto-complete
                     auto-complete-clang
                     magit
                     keyfreq
                     ))
    (fetch-package package)))

(provide 'conf-package)

;; Local Variables:
;; no-byte-compile: t
;; End:
