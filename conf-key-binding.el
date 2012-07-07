;; 分离 C-m C-i C-[，只能在图形下工作
;; 摘自 http://blog.nguyenvq.com/2011/02/24/875/
;; Translate the problematic keys to the function key Hyper
(when (eq window-system 'x)
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

;;; 第三方扩展或者自定义的扩展的键绑定

;; key          command                         file
;; =============================================================================
;; C-j          open-newline-indent             conf-defun
;; M-j          open-newline-above              conf-defun
;; f11          toggle-fullscreen               conf-fullscreen
;; C-x C-b      ibuffer                         conf-ibuffer
;; C-x C-f      ido-find-file                   conf-ido
;; M-/          auto-complete                   init-auto-complete
;; C-x M-z      magit-status                    init-magit
;; f8           nav-toggle                      init-nav
;; M-x          smex                            init-smex
;; M-X          smex-major-mode-commands        init-smex
;; C-x M-x      execute-extended-command        init-smex

(provide 'conf-key-binding)
