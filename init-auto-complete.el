;; http://cx4a.org/software/auto-complete/manual.html

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default) ; also enable global-auto-complete-mode

(setq ac-auto-start nil)
(setq ac-auto-show-menu nil)
(ac-set-trigger-key "TAB")
(define-key ac-mode-map (kbd "M-/") 'auto-complete)

(setq ac-use-menu-map t) ; recommended by the manual
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/.ac-dict")
(setq ac-user-dictionary-files "~/.emacs.d/.dict")

(setq ac-dwim nil)
(setq ac-use-quick-help nil)
(setq ac-menu-height 7)

;; default sources:
;;     ac-source-abbrev
;;     ac-source-dictionary
;;     ac-source-words-in-same-mode-buffers
;;
;; builtin setup:
;;     emacs-lisp-mode
;;     cc-mode
;;     ruby-mode
;;     css-mode
;;
;; see auto-complete-conf.el for more detail.

;; redefine ac-cc-mode-setup
;; original define is in auto-complete-conf.el
(defun ac-cc-mode-setup ()
  (setq ac-sources (append ac-sources '(ac-source-imenu ; add
                                        ac-source-yasnippet
                                        ac-source-gtags
                                        ac-source-semantic ; add
                                        ))))

;; shell
(defun ac-sh-mode-setup ()
  (setq ac-sources (append ac-sources '(ac-source-imenu
                                        ac-source-yasnippet))))
(add-hook 'sh-mode-hook 'ac-sh-mode-setup)

;; perl
(defun ac-perl-mode-setup ()
  (setq ac-sources (append ac-sources '(ac-source-imenu
                                        ac-source-yasnippet))))
(add-hook 'perl-mode-hook 'ac-perl-mode-setup)

;; python
(defun ac-python-mode-setup ()
  (setq ac-sources (append ac-sources '(ac-source-imenu
                                        ac-source-yasnippet))))
(add-hook 'python-mode-hook 'ac-python-mode-setup)

;; ruby
(add-hook 'ruby-mode-hook
          (lambda ()
            (make-local-variable 'ac-ignores)
            (add-to-list 'ac-ignores "end")))

;; Objctive-C
;; http://www.yifeiyang.net/iphone-development-techniques-of-environmental-articles-1-use-emacs-development-iphone-application/
(add-to-list 'ac-modes 'objc-mode)
(if (require 'ac-company "ac-company.el" t) ; elisp/ac-company.el
    (progn
      (ac-company-define-source ac-source-company-xcode company-xcode)
      (add-hook 'objc-mode-hook
                (lambda ()
                  (add-to-list 'ac-sources 'ac-source-company-xcode))))
  (message "Warning: No Objective-C auto completion."))

(ac-clear-dictionary-cache)

(provide 'init-auto-complete)
