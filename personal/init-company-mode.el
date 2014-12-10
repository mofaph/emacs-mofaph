;; -*- coding: utf-8; -*-

(require 'company)

(global-unset-key (kbd "M-7"))
(global-set-key (kbd "M-7") 'company-complete)

(global-unset-key (kbd "C-M-/"))
(global-set-key (kbd "C-M-/") 'company-complete)

;;; never complete automatically
(setq company-idle-delay nil)

;;; not using (global-company-mode 1), follow the manual
(add-hook 'after-init-hook 'global-company-mode)

(provide 'init-company-mode)
