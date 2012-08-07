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

(dolist (mode '(c-mode-hook
                c++-mode-hook))
  (add-hook mode (lambda () (c-toggle-hungry-state 1))))

(provide 'conf-cc-mode)
