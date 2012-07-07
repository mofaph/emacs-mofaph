(defconst slime-dir "~/opt/slime-2012-07-06/" "slime directory")

(if (file-directory-p slime-dir)

    (progn
      ;; at the end of load-path
      (add-to-list 'load-path slime-dir t)
      (add-to-list 'load-path (concat slime-dir "contrib") t)

      (setq inferior-lisp-program "sbcl")
      (require 'slime)
      (slime-setup '(slime-fancy)))

  (message "Warning: conf-slime: slime deosn't exist!"))

(provide 'conf-slime)
