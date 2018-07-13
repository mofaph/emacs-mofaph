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
