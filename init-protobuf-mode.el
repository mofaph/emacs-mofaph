(require 'protobuf-mode)

(defconst protobuf-style
  '((c-basic-offset . 4)
    (indent-tabs-mode . nil)))

(defun add-protobuf-style ()
  (c-add-style "protobuf-style" protobuf-style t))

(add-hook 'protobuf-mode-hook 'add-protobuf-style)

(provide 'init-protobuf-mode)
