(require 'uniquify)

;; 当寻找一个同名的文件，改变两个 buffer 的名字，前面加上目录名
(setq-default uniquify-buffer-name-style 'forward)

(provide 'conf-uniquify)
