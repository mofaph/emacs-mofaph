;; -*- coding: utf-8; -*-

(require 'move-text)

(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

;;; 有些模式占用了 M-up 和 M-down，在这里覆盖这些配置

(defun move-text-setting-key-binding ()
  "Key binding that move-text should set."
  (local-set-key [M-up]         'move-text-up)
  (local-set-key [M-down]       'move-text-down))

(dolist  (hook '(
                 org-mode-hook
                 ))
  (add-hook hook 'move-text-setting-key-binding))

(provide 'init-move-text)
