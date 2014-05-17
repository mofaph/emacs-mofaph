;; http://www.emacswiki.org/emacs/IbufferMode#toc3

(require 'ibuffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; 使用人类可读的格式显示 Size 一列的大小（比如 36K）
(define-ibuffer-column size-h
  (:name "Size" :inline t)
  (cond
   ((> (buffer-size) 1000000)
    (format "%7.1fM" (/ (buffer-size) 1000000.0)))
   ((> (buffer-size) 1000)
    (format "%3.1fK" (/ (buffer-size) 1000.0)))
   (t
    (format "%3d" (buffer-size)))))

;; 修改默认的 ibuffer-formats
(setq ibuffer-formats
      '((mark modified read-only " "
             (name 18 18 :left :elide)
             " "
             (size-h 9 -1 :right)
             " "
             (mode 16 16 :left :elide)
             " "
             filename-and-process)))

(provide 'conf-ibuffer)
