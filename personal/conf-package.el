;; -*- coding: utf-8 -*-

;; Info node: emacs(top)->Emacs Lisp Packages
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Packages.html#Packages
;; http://ergoemacs.org/emacs/emacs_package_system.html

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

(when (require 'package nil t)

  (require 'cl)

  ;; fix a package.el bug
  ;; https://github.com/bbatsov/prelude/blob/master/prelude/prelude-packages.el
  ;; http://melpa.milkbox.net/
  (setq url-http-attempt-keepalives nil)

  (setq package-archives '(("personal" . "~/opt/personal-elpa/")))

  (setq package-enable-at-startup nil)  ; 避免在处理完 init.el 后再次加载扩展包
  (package-initialize)                  ; 由于在启动时就配置包了，所以应该加载包

  (dolist (package '(
                     ;; zero config
                     better-defaults                    ; https://github.com/technomancy/better-defaults
                     c-eldoc                            ; http://github.com/nflath/c-eldoc
                     gitconfig-mode                     ; https://github.com/lunaryorn/git-modes
                     gitignore-mode                     ; https://github.com/lunaryorn/git-modes

                     ;; require config
                     avy
                     buffer-move                        ; http://www.emacswiki.org/cgi-bin/wiki/buffer-move.el
                     cmake-ide
                     elfeed
                     expand-region                      ; https://github.com/magnars/expand-region.el
                     flx                                ; https://github.com/lewang/flx
                     helm                               ; http://emacs-helm.github.io/helm/
                     helm-projectile                    ; https://github.com/bbatsov/projectile
                     highlight-parentheses              ; http://nschum.de/src/emacs/highlight-parentheses/
                     hungry-delete                      ; http://github.com/nflath/hungry-delete
                     keyfreq                            ; https://github.com/dacap/keyfreq
                     magit                              ; https://github.com/magit/magit
                     markdown-mode                      ; http://jblevins.org/projects/markdown-mode/
                     move-text                          ; http://www.emacswiki.org/emacs/move-text.el
                     multiple-cursors                   ; https://github.com/magnars/multiple-cursors.el
                     popwin                             ; https://github.com/m2ym/popwin-el
                     projectile                         ; https://github.com/bbatsov/projectile
                     rtags
                     smartrep                           ; https://github.com/myuhe/smartrep.el
                     switch-window                      ; https://github.com/dimitri/switch-window
                     undo-tree                          ; http://www.dr-qubit.org/emacs.php
                     ))
    (fetch-package package))

  ;; add at the end of list
  (add-to-list 'package-archives '("gnu"                . "http://elpa.emacs-china.org/gnu/") t)
  (add-to-list 'package-archives '("melpa-stable"       . "http://elpa.emacs-china.org/melpa-stable/") t)
  (add-to-list 'package-archives '("melpa"              . "http://elpa.emacs-china.org/melpa/") t)
  (add-to-list 'package-archives '("marmalade"          . "http://elpa.emacs-china.org/marmalade/") t)

  )

(provide 'conf-package)

;; Local Variables:
;; no-byte-compile: t
;; End:
