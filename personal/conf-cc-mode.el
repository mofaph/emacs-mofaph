;; -*- coding: utf-8; -*-

(setq c-default-style '((awk-mode       . "awk")
                        (c-mode         . "linux")
                        (c++-mode       . "stroustrup")
                        (objc-mode      . "cc-mode")
                        (java-mode      . "java")
                        (other          . "gnu")))

;; 在不同的目录下使用不同的编程风格，默认使用 Linux 风格
(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              (if filename
                  (cond

                   ((or (string-match (expand-file-name "~/hack/git") filename)
                        (string-match (expand-file-name "~/hack/linux") filename))

                    (setq tab-width 8)
                    (setq indent-tabs-mode t)
                    (c-set-style "linux"))

                   ((or (string-match (expand-file-name "~/work") filename))

                    (setq tab-width 4)
                    (setq indent-tabs-mode nil)
                    (c-set-style "cc-mode"))

                   ((or (string-match (expand-file-name "~/hack/emacs") filename)
                        (string-match (expand-file-name "~/github/apue.2e") filename))

                        (setq tab-width 8)
                        (setq indent-tabs-mode nil)
                        (c-set-style "gnu")))))))

;; Taken from the cc-mode manual
;; Make a non-standard key binding.  We can put this in
;; c-mode-base-map because c-mode-map, c++-mode-map, and so on,
;; inherit from it.
(defun setup-c-initialization-hook ()
  (define-key c-mode-base-map (kbd "RET") 'c-context-line-break))

(add-hook 'c-initialization-hook 'setup-c-initialization-hook)

(defun setup-c-mode-common-hook ()
  (c-toggle-hungry-state 1)
  (subword-mode 1))

(add-hook 'c-mode-common-hook 'setup-c-mode-common-hook)

(provide 'conf-cc-mode)
