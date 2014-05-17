;; -*- coding: utf-8; -*-

(setq dired-isearch-filenames                   'dwim
      delete-by-moving-to-trash                 t)

;; 让 dired 可以递归的拷贝和删除目录
(setq-default dired-recursive-copies            'top
              dired-recursive-deletes           'top)

(provide 'conf-dired)
