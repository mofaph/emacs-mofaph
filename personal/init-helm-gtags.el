(setq helm-gtags-prefix-key "\C-cg")
(require 'helm-gtags)

(setq helm-gtags-ignore-case t
      ;; helm-gtags-auto-update t
      helm-gtags-use-input-at-cursor t
      helm-gtags-pulse-at-cursor t
      helm-gtags-suggested-key-mapping t)

;; Enable helm-gtags-mode in Dired so you can jump to any tag
;; when navigate project tree with Dired
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)

;; Enable helm-gtags-mode in languages that GNU Global supports
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'java-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g t") 'helm-gtags-find-tag)
(define-key helm-gtags-mode-map (kbd "C-c g r") 'helm-gtags-find-rtag)
(define-key helm-gtags-mode-map (kbd "C-c g s") 'helm-gtags-find-symbol)
(define-key helm-gtags-mode-map (kbd "C-c g f") 'helm-gtags-find-files)
(define-key helm-gtags-mode-map (kbd "C-c g p") 'helm-gtags-find-pattern)
(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)

(define-key helm-gtags-mode-map (kbd "C-c g .") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "C-c g ,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c g <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c g >") 'helm-gtags-next-history)

(define-key helm-gtags-mode-map (kbd "C-c g j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "C-c g P") 'helm-gtags-parse-file)

(global-unset-key (kbd "M-8"))
(global-set-key (kbd "M-8") 'helm-gtags-select)

(provide 'init-helm-gtags)
