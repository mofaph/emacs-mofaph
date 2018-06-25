(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(global-set-key (kbd "M-1") 'helm-imenu)
(global-set-key (kbd "M-2") 'helm-buffers-list)
(global-set-key (kbd "M-3") 'helm-find-files)
(global-set-key (kbd "M-4") 'helm-bookmarks)
(global-set-key (kbd "M-8") 'helm-occur)

(global-set-key (kbd "C-c h a") 'helm-apropos)
(global-set-key (kbd "C-c h f") 'helm-for-files)
(global-set-key (kbd "C-c h g") 'helm-do-grep)
(global-set-key (kbd "C-c h i") 'helm-imenu)
(global-set-key (kbd "C-c h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h m") 'helm-man-woman)
(global-set-key (kbd "C-c h r") 'helm-register)

(global-unset-key (kbd "M-x"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x M-x") 'execute-extended-command)

(global-unset-key (kbd "M-y"))
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(provide 'init-helm)
