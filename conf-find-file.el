;; -*- coding: utf-8; -*-

(require 'find-file)

(setq skybility-ha "~/SkybilityHA")

(let ((path1 (getenv "SKYBILITY_HA"))
      (path2 "/work/SkybilityHA")
      (path3 "~/work/SkybilityHA"))
  (cond
   (path1
    (setq skybility-ha path1))
   ((file-exists-p path2)
    (setq skybility-ha path2))
   ((file-exists-p path3)
    (setq skybility-ha path3))
   (t
    (message "conf-find-file: skybility-ha leave to default."))))


(when skybility-ha
  (add-to-list 'cc-search-directories (concat skybility-ha "/include/*") 'end)
  (add-to-list 'cc-search-directories (concat skybility-ha "/src/*") 'end))

(global-set-key (kbd "C-c o") 'ff-find-other-file)

(provide 'conf-find-file)
