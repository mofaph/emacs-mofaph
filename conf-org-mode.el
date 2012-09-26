;; -*- coding: utf-8; -*-

;; http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html

(require 'org-install)

(setq org-log-done t)
(setq org-agenda-files '("~/org/work.org" "~/org/home.org"))

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)

(provide 'conf-org-mode)
