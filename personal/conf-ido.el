;; [1] https://github.com/purcell/emacs.d/blob/master/init-ido.el
;; [2] http://www.masteringemacs.org/articles/2010/10/10/introduction-to-ido-mode/
;; [3] http://www.emacswiki.org/cgi-bin/wiki/InteractivelyDoThings

(require 'ido)

(setq ido-save-directory-list-file (concat user-emacs-directory "ido.last"))

(ido-mode t)
(ido-everywhere t)

(setq ido-enable-flex-matching t)
(setq ido-ignore-extensions t)
(setq ido-ignore-buffers '(
                           "\\` "
                           "^\\*.*\\*$"
                           ".ido.last"
                           ".loaddefs.el"
                           "archive-contents"
                           "cookies"
                           ))

(setq ido-create-new-buffer 'always)
(setq ido-file-extensions-order '(".c" ".h" ".el" ".sh" ".cpp" ".lisp"))
(setq ido-max-directory-size 100000)
;(setq ido-use-virtual-buffers t)

(provide 'conf-ido)
