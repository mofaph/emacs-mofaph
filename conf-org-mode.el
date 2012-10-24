;; -*- coding: utf-8; -*-

;; http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html

(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq org-log-done t)
(setq org-agenda-files '("~/org/"))

;; Token from Org-mode manual
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)

(provide 'conf-org-mode)
