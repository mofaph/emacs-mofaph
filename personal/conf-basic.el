;; 设置个人信息
(setq user-full-name "Mofaph Michael")
(setq user-mail-address "mofaph@gmail.com")

;; 初始化设置
(setq-default inhibit-startup-screen t)
(setq-default initial-scratch-message nil)
(setq-default initial-major-mode 'emacs-lisp-mode)

;; 隐藏工具栏和滚动条
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; 设置时间格式
(setq-default display-time-24hr-format t)
(setq-default display-time-day-and-date nil)

;; Mark
(setq-default transient-mark-mode t)
(setq-default set-mark-command-repeat-pop t)
(setq-default mark-ring-max 1024)

;; 在状态栏显示行号和列号
(setq-default line-number-mode t)
(setq-default column-number-mode t)

;; 关闭烦人的出错时的提示声
(setq-default visible-bell t)

;; 使用 "y/n" 代替 "yes/no"
(fset 'yes-or-no-p 'y-or-n-p)

;; 制表符
(setq-default tab-width 8)
(setq-default indent-tabs-mode nil)
(setq x-stretch-cursor t)

;; 每次卷动一行
(setq-default scroll-conservatively 100)

;; 行末空白
; (setq-default show-trailing-whitespace 1)
; (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; 总是以一个换行符结束文件
(setq-default require-final-newline t)

;; isearch
(setq isearch-allow-scroll t)
(put 'view-lossage 'isearch-scroll t)

;; 设置书签文件，Emacs 默认的位置是 ~/.emacs.bmk
(setq-default bookmark-default-file (concat user-emacs-directory "bookmark"))
(setq-default bookmark-save-flag 1) ; 立即保存书签

;; 设置缩略词的文件
(setq-default abbrev-file-name "~/.emacs.d/.abbrev_defs")
(setq-default abbrev-mode t)
(if (file-exists-p abbrev-file-name) (read-abbrev-file abbrev-file-name))
(setq-default save-abbrevs t)

;; 由菜单修改配置的东西将会保存在 custom-file 里
;; 这里我设置在 ~/.emacs.d/.custom-file.el
(setq-default custom-file "~/.emacs.d/.custom-file.el")
(if (file-exists-p custom-file) (load custom-file))

;; 备份设置
(setq-default make-backup-file t)
(setq-default version-control t)
(setq-default backup-directory-alist '(("." . "~/.emacs.d/backup")))
(setq-default delete-old-versions t)

;; 支持emacs和外部程序的粘贴
(setq-default x-select-enable-clipboard t)

;; 括号匹配时显示另外一边的括号，而不是跳转到另一个括号
(when (fboundp 'show-paren-mode)
  (show-paren-mode t)
  (setq-default show-paren-style 'parentheses))

;; 设置一个大的 kill-ring
(setq-default kill-ring-max 200)

;; 光标靠近时，鼠标不动
(mouse-avoidance-mode 'none)

;; 禁止光标和屏幕闪烁
(when (fboundp 'blink-cursor-mode)
  (blink-cursor-mode -1)
  (setq-default visible-bell nil))

;; 不要在鼠标点击的那个地方插入剪贴板内容
(setq-default mouse-yank-at-point t)

;; 递归使用 minibuffer
(setq-default enable-recursive-minibuffers t)

;; 在标题栏显示 buffer 的名字
(setq-default frame-title-format '(buffer-file-name "%f" ("%b")))

;; 加载默认的库，default.el
(setq-default inhibit-default-init t)

;; 并且使 text-mode 每 80 个字符自动缩进
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 80)

;; 比较差异文件时启动 -u 模式
(setq-default diff-switches "-u")

;; 提示文件结尾的空行
(setq-default indicate-empty-lines 1)

;; 取消原本不开启的命令
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'erase-buffer 'disabled nil)

(provide 'conf-basic)
