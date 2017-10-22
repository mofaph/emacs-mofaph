;; -*- coding: utf-8; -*-

(setq dired-isearch-filenames                   'dwim
      delete-by-moving-to-trash                 t)

;; 让 dired 可以递归的拷贝和删除目录
(setq-default dired-recursive-copies            'top
              dired-recursive-deletes           'top)

(setq enable-remote-dir-locals t)

;; 打开目录时，隐藏文件信息（权限，日期等），可以使用“(”显示详细信息
;(add-to-list 'dired-mode-hook #'dired-hide-details-mode)

(provide 'conf-dired)
