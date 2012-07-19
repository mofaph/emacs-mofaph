;; http://cx4a.org/software/auto-complete/manual.html

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/.ac-dict")
(setq ac-user-dictionary-files "~/.emacs.d/.dict")

(set-default 'ac-sources
             '(ac-source-abbrev
               ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer
               ac-source-imenu))

(setq ac-auto-show-menu nil)
(setq ac-auto-start nil)
(setq ac-dwim nil)

(ac-set-trigger-key "TAB")
(define-key ac-mode-map (kbd "M-/") 'auto-complete)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (dolist (mode '(ac-source-features
                            ac-source-functions
                            ac-source-symbols
                            ac-source-gtags
                            ac-source-semantic)
                          (add-to-list 'ac-sources mode)))))

(ac-clear-dictionary-cache)

(provide 'init-auto-complete)
