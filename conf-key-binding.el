;; 分离 C-m C-i C-[，只能在图形下工作
;; 摘自 http://blog.nguyenvq.com/2011/02/24/875/
;; Translate the problematic keys to the function key Hyper
(when window-system
      (keyboard-translate ?\C-i ?\H-i)
      (keyboard-translate ?\C-m ?\H-m)
      (keyboard-translate ?\C-[ ?\H-[)
      (global-set-key [?\H-m] 'set-mark-command)
      (global-set-key [?\H-i] 'align))

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
(global-set-key (kbd "<f5>")            'previous-buffer)
(global-set-key (kbd "<f6>")            'next-buffer)

;;; 第三方扩展或者自定义的扩展的键绑定

;; key          command                         file
;; =============================================================================
;; C-x C-c      give-tips-when-want-quit-emacs  conf-defun
;; C-j          open-newline-indent             conf-defun
;; M-j          open-newline-above              conf-defun
;; f11          toggle-fullscreen               conf-gui
;; C-x C-b      ibuffer                         conf-ibuffer
;; C-x C-f      ido-find-file                   conf-ido
;; C-c a        org-agenda                      conf-org-mode
;; C-c b        org-iswitchb                    conf-org-mode
;; C-c c        org-capture                     conf-org-mode
;; C-c l        org-store-link                  conf-org-mode
;; C-c SPC      ace-jump-mode                   init-ace-jump-mode
;; M-/          auto-complete                   init-auto-complete
;; C-=          er/expand-region                init-expand-region
;; C-F7         highlight-symbol-at-point       init-highlight-symbol
;; F7           highlight-symbol-next           init-highlight-symbol
;; S-F7         highlight-symbol-prev           init-highlight-symbol
;; M-F7         highlight-symbol-prev           init-highlight-symbol
;; C-S-F7       highlight-symbol-query-replace  init-highlight-symbol
;; C-M-y        kill-ring-search                init-kill-ring-search
;; C-x C-z      magit-status                    init-magit
;; C-x r t      inline-string-rectangle         init-mark-multiple
;; C-<          mark-previous-like-this         init-mark-multiple
;; C->          mark-next-like-this             init-mark-multiple
;; C-*          mark-all-like-this              init-mark-multiple
;; C-M-m        mark-more-like-this             init-mark-multiple
;; M-up         move-text-up                    init-move-text
;; M-down       move-text-down                  init-move-text
;; f9           nav-toggle                      init-nav
;; M-x          smex                            init-smex
;; M-X          smex-major-mode-commands        init-smex
;; C-x M-x      execute-extended-command        init-smex
;; M-R          paredit-raise-sexp              init-paredit

(provide 'conf-key-binding)
