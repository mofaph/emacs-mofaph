;; ----------------------------------------
;; 中英文字体对齐设置
;; ----------------------------------------

;; https://www.douban.com/group/topic/33652445/
;; http://www.sohu.com/a/143027785_647766
;; https://wiki.ubuntu.com.cn/%E5%AD%97%E4%BD%93

(eval-when-compile (require 'cl))

(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))

(ecase system-type
  (gnu/linux
   (set-face-bold-p 'bold nil)
   (set-face-underline-p 'bold nil)
   (set-font "monofur" "vera Sans YuanTi Mono" 20 20))
  (darwin
   (set-font "monofur" "STHeiti" 20 20)))

;; ----------------------------------------
;; 启动后在 mini-buffer 显示下次检视配置的时间
;; ----------------------------------------

(defun next-review-day ()
  "Next .emacs.d review day."

  (lexical-let ((year (string-to-number (format-time-string "%Y" (current-time))))
                (review-day1 101)
                (review-day2 401)
                (review-day3 701)
                (review-day4 1001)
                (max-review-day 1232)
                (review-current-day (string-to-number (format-time-string "%m%d" (current-time)))))

    (cond
     ((and (> review-current-day review-day1)
           (< review-current-day review-day2))
      (message "Next review day is %d-04-01" year))

     ((and (> review-current-day review-day2)
           (< review-current-day review-day3))
      (message "Next review day is %d-07-01" year))

     ((and (> review-current-day review-day3)
           (< review-current-day review-day4))
      (message "Next review day is %d-10-01" year))

     ((and (> review-current-day review-day4)
           (< review-current-day max-review-day))
      (message "Next review day is %d-01-01" (1+ year)))

     (t
      (message "Come on! Today is review day.")))))

(run-at-time 5 nil 'next-review-day)
