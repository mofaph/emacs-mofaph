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
  (add-to-list 'package-archives '("melpa"              . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("tromey"             . "http://tromey.com/elpa/") t)
  (add-to-list 'package-archives '("marmalade"          . "http://marmalade-repo.org/packages/") t)

  (setq package-enable-at-startup nil)  ; 避免在处理完 init.el 后再次加载扩展包
  (package-initialize)                  ; 由于在启动时就配置包了，所以应该加载包

  (dolist (package '(
                     ace-jump-mode                      ; https://github.com/winterTTr/ace-jump-mode
                     auto-complete                      ; http://cx4a.org/software/auto-complete/
                     auto-complete-clang                ; https://github.com/brianjcj/auto-complete-clang
                     browse-kill-ring                   ; http://www.fan.gr.jp/~ring/doc/browse-kill-ring.html
                     buffer-move                        ; http://www.emacswiki.org/cgi-bin/wiki/buffer-move.el
                     c-eldoc                            ; http://github.com/nflath/c-eldoc
                     company                            ; http://nschum.de/src/emacs/company-mode/
                     expand-region                      ; https://github.com/magnars/expand-region.el
                     gitconfig-mode                     ; https://github.com/lunaryorn/git-modes
                     gitignore-mode                     ; https://github.com/lunaryorn/git-modes
                     git-messenger                      ; https://github.com/syohex/emacs-git-messenger
                     goto-last-change                   ; http://www.emacswiki.org/emacs/goto-last-change.el
                     helm                               ; http://emacs-helm.github.io/helm/
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
                     kill-ring-search                   ; http://nschum.de/src/emacs/kill-ring-search/
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
                     show-marks                         ; https://github.com/vapniks/mark
                     sicp                               ; http://www.neilvandyke.org/sicp-texi/
                     smartrep                           ; https://github.com/myuhe/smartrep.el
                     smex                               ; https://github.com/nonsequitur/smex
                     switch-window                      ; https://github.com/dimitri/switch-window
                     undo-tree                          ; http://www.dr-qubit.org/emacs.php
                     xcscope                            ; http://cscope.sourceforge.net/
                     ))
    (fetch-package package)))

(provide 'conf-package)

;; Local Variables:
;; no-byte-compile: t
;; End:
