(require 'ido)

(recentf-mode t)
(setq recentf-save-file "~/.emacs.d/.recentf")
(global-set-key (kbd "C-c r") 'recentf-open-files)

;;; http://www.masteringemacs.org/articles/2011/01/27/find-files-faster-recent-files-package/
(defun ido-recentf-open ()
  "Use `ido-completing-read' to open a recentf file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

(provide 'conf-recentf)
