;; -*- coding: utf-8 -*-

;; Info node: emacs(top)->Emacs Lisp Packages
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Packages.html#Packages
;; http://ergoemacs.org/emacs/emacs_package_system.html

(defun fetch-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE.

Token from: https://github.com/purcell/emacs.d/blob/master/init-elpa.el"
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
  (add-to-list 'package-archives '("melpa-stable"       . "http://melpa-stable.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("melpa"              . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("marmalade"          . "http://marmalade-repo.org/packages/") t)

  (setq package-enable-at-startup nil)  ; 避免在处理完 init.el 后再次加载扩展包
  (package-initialize)                  ; 由于在启动时就配置包了，所以应该加载包

  (dolist (package '(
                     ace-jump-mode                      ; https://github.com/winterTTr/ace-jump-mode
                     auto-complete                      ; http://cx4a.org/software/auto-complete/
                     auto-complete-clang                ; https://github.com/brianjcj/auto-complete-clang
                     better-defaults                    ; https://github.com/technomancy/better-defaults
                     buffer-move                        ; http://www.emacswiki.org/cgi-bin/wiki/buffer-move.el
                     c-eldoc                            ; http://github.com/nflath/c-eldoc
                     company                            ; http://nschum.de/src/emacs/company-mode/
                     diminish                           ; http://www.eskimo.com/~seldon
                     expand-region                      ; https://github.com/magnars/expand-region.el
                     flx                                ; https://github.com/lewang/flx
                     flx-ido                            ; https://github.com/lewang/flx
                     gitconfig-mode                     ; https://github.com/lunaryorn/git-modes
                     gitignore-mode                     ; https://github.com/lunaryorn/git-modes
                     git-messenger                      ; https://github.com/syohex/emacs-git-messenger
                     goto-last-change                   ; http://www.emacswiki.org/emacs/goto-last-change.el
                     helm                               ; http://emacs-helm.github.io/helm/
                     helm-gtags                         ; https://github.com/syohex/emacs-helm-gtags
                     helm-projectile                    ; https://github.com/bbatsov/projectile
                     highlight-parentheses              ; http://nschum.de/src/emacs/highlight-parentheses/
                     highlight-symbol                   ; http://nschum.de/src/emacs/highlight-symbol/
                     hungry-delete                      ; http://github.com/nflath/hungry-delete
                     ido-complete-space-or-hyphen       ; https://github.com/doitian/ido-complete-space-or-hyphen/blob/master/ido-complete-space-or-hyphen.el
                     ido-sort-mtime                     ; https://github.com/pkkm/ido-sort-mtime
                     ido-ubiquitous                     ; https://github.com/DarwinAwardWinner/ido-ubiquitous
                     ido-vertical-mode                  ; https://github.com/rson/ido-vertical-mode.el
                     imenu-anywhere                     ; https://github.com/vitoshka/imenu-anywhere
                     indent-guide                       ; https://github.com/zk-phi/indent-guide
                     keyfreq                            ; https://github.com/dacap/keyfreq
                     lua-mode                           ; http://immerrr.github.com/lua-mode/
                     magit                              ; https://github.com/magit/magit
                     move-text                          ; http://www.emacswiki.org/emacs/move-text.el
                     multiple-cursors                   ; https://github.com/magnars/multiple-cursors.el
                     nav                                ; http://code.google.com/p/emacs-nav/
                     paredit                            ; http://mumble.net/~campbell/emacs/paredit.el
                     popwin                             ; https://github.com/m2ym/popwin-el
                     projectile                         ; https://github.com/bbatsov/projectile
                     protobuf-mode                      ; https://code.google.com/p/protobuf/
                     region-bindings-mode               ; https://github.com/fgallina/region-bindings-mode
                     sicp                               ; http://www.neilvandyke.org/sicp-texi/
                     smartrep                           ; https://github.com/myuhe/smartrep.el
                     switch-window                      ; https://github.com/dimitri/switch-window
                     undo-tree                          ; http://www.dr-qubit.org/emacs.php
                     xcscope                            ; http://cscope.sourceforge.net/
                     ))
    (fetch-package package)))

(provide 'conf-package)

;; Local Variables:
;; no-byte-compile: t
;; End:
