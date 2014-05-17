(if (require 'cmake-mode nil t)
    (progn
      (setq auto-mode-alist
            (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                      ("CMakeCache\\.txt\\'" . cmake-mode)
                      ("\\.cmake\\'" . cmake-mode))
                    auto-mode-alist)))
  (message "conf-cmake-mode: No cmake-mode.el loaded!"))

(provide 'conf-cmake-mode)
