
;; 用 Ctl 加上鼠标滚轮操作来设置字体大小
(cond
 ((eq system-type 'gnu/linux)
     (global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
     (global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease))
 ((eq system-type 'windows-nt)
     (global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
     (global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)))

(global-set-key (kbd "C-x t")           'untabify)
(global-set-key (kbd "C-,")             'point-to-register)
(global-set-key (kbd "C-.")             'jump-to-register)
(global-set-key (kbd "C-\\")            'delete-trailing-whitespace)

;;; 第三方扩展或者自定义的扩展的键绑定

;; key          command                         file
;; =============================================================================
;; C-x C-c      give-tips-when-want-quit-emacs  conf-defun
;; C-j          open-newline-indent             conf-defun
;; M-j          open-newline-above              conf-defun
;; M-k          kill-buffer-no-comfirm          conf-defun
;; C-^          top-join-line                   conf-defun
;; C-c I        find-user-init-file             conf-defun
;; C-c K        find-key-binding-record         conf-defun
;; C-c o        ff-find-other-file              conf-find-file
;; f11          toggle-fullscreen               conf-gui
;; C-x C-b      ibuffer                         conf-ibuffer
;; C-x C-f      ido-find-file                   conf-ido
;; C-c a        org-agenda                      conf-org-mode
;; C-c b        org-iswitchb                    conf-org-mode
;; C-c c        org-capture                     conf-org-mode
;; C-c l        org-store-link                  conf-org-mode
;; C-c C-j      imenu                           conf-program
;; C-c SPC      ace-jump-mode                   init-ace-jump-mode
;; M-/          auto-complete                   init-auto-complete
;; M-S-up       buf-move-up                     init-buffer-move
;; M-y          helm-show-kill-ring             init-helm
;; M-S-down     buf-move-down                   init-buffer-move
;; M-S-left     buf-move-left                   init-buffer-move
;; M-S-right    buf-move-right                  init-buffer-move
;; C-=          er/expand-region                init-expand-region
;; C-F7         highlight-symbol-at-point       init-highlight-symbol
;; F7           highlight-symbol-next           init-highlight-symbol
;; S-F7         highlight-symbol-prev           init-highlight-symbol
;; M-F7         highlight-symbol-prev           init-highlight-symbol
;; C-S-F7       highlight-symbol-query-replace  init-highlight-symbol
;; C-x w *      highlight-symbol-at-point       init-highlight-symbol
;; C-c /        goto-last-change                init-goto-last-change
;; C-c j        imenu-anywhere                  init-imenu-anywhere
;; C-M-y        kill-ring-search                init-kill-ring-search
;; C-x C-z      magit-status                    init-magit
;; C-c m s      magit-status                    init-magit
;; C-c m g      magit-grep                      init-magit
;; C-c m b      magit-branch-manager            init-magit
;; C-c m l      magit-log                       init-magit
;; C-<          mc/mark-previous-like-this      init-multiple-cursors
;; C->          mc/mark-next-like-this          init-multiple-cursors
;; C-*          mc/mark-all-like-this           init-multiple-cursors
;; M-up         move-text-up                    init-move-text
;; M-down       move-text-down                  init-move-text
;; f9           nav-toggle                      init-nav
;; C-c f        forward-mark                    init-show-marks
;; C-c b        backward-mark                   init-show-marks
;; C-c s        show-marks                      init-show-marks
;; M-x          smex                            init-smex
;; M-X          smex-major-mode-commands        init-smex
;; C-x M-x      execute-extended-command        init-smex
;; M-R          paredit-raise-sexp              init-paredit

;;; M-1         helm-imenu                      init-helm
;;; M-2         helm-buffers-list               init-helm
;;; M-3         helm-find-files                 init-helm
;;; M-4         helm-projectile                 init-projectile
;;; M-5         helm-bookmarks                  init-helm
;;; M-6         tv-view-history                 conf-tags-view
;;; M-7         company-complete                init-company-mode

(provide 'conf-key-binding)
