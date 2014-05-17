;; -*- coding: utf-8 -*-

;; 这个文件用于图形界面下的设置

(defun fullscreen-toggle ()
  "Toggle fullscreen status."
  (interactive)
  (display-time-mode)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         ;; if first parameter is '2', can toggle fullscreen status
                         '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

(when window-system
  (global-set-key [f11] 'fullscreen-toggle)
  (setq-default indicate-buffer-boundaries 'left)
  (setq default-frame-alist
        '((cursor-color . "black")
          (cursor-type . box)
          (foreground-color . "black")
          (background-color . "#CCE8CF")))
  )

(provide 'conf-gui)
