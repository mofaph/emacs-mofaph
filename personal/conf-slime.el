;; http://common-lisp.net/project/slime/doc/html/

(defconst slime-dir "~/opt/slime-2012-07-06/" "slime directory")

;; http://common-lisp.net/project/slime/doc/html/Autoloading.html#Autoloading
(if (file-directory-p slime-dir)

    (progn
      ;; at the end of load-path
      (add-to-list 'load-path slime-dir t)
      (add-to-list 'load-path (concat slime-dir "contrib") t)

      (setq inferior-lisp-program "sbcl")
      (require 'slime-autoloads)
      (slime-setup '(slime-fancy)))

  (message "Warning: conf-slime: slime deosn't exist!"))

(provide 'conf-slime)
