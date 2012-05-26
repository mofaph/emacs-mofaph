(defun fullscreen-toggle ()
  "Toggle fullscreen status."
  (interactive)
  (display-time-mode)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         ;; if first parameter is '2', can toggle fullscreen status
                         '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

(global-set-key [f11] 'fullscreen-toggle)

(provide 'conf-fullscreen)
