;; -*- coding: utf-8 -*-

;;; mofaph@gmail.com
;;; 2009-7-13

;; ----------------------------------------
;; package.el
;; ----------------------------------------

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; fix a package.el bug
;; https://github.com/bbatsov/prelude/blob/master/prelude/prelude-packages.el
;; http://melpa.milkbox.net/
(setq url-http-attempt-keepalives nil)

;; 只使用 emacs-china.org 的镜像作为 elpa 仓库
(add-to-list 'package-archives '("melpa-stable" . "http://elpa.emacs-china.org/melpa-stable/") t)

;; ----------------------------------------
;; 加载使用 customize 配置系统生成的配置
;; ----------------------------------------

;; 由菜单修改配置的东西将会保存在 custom-file 里
;; 这里设置在 ~/.emacs.d/custom-file.el
(setq-default custom-file (concat user-emacs-directory "custom-file.el"))
(if (file-exists-p custom-file) (load custom-file))

;; ----------------------------------------
;; use-package
;; ----------------------------------------

(eval-when-compile
  (require 'use-package)
  (setq use-package-verbose t))

;; ----------------------------------------
;; recentf
;; ----------------------------------------

;; 保存最近打开的文件，M-l 打开最近打开的文件列表
(use-package recentf
  :bind
  (("M-l" . recentf-open-files))
  :config
  (recentf-mode 1))

;; ----------------------------------------
;; dired
;; ----------------------------------------

(use-package dired
  :init

  ;; 在 dired 模式下，标记删除时，移动到回收站。这样减少发生误操作的风险
  (setq delete-by-moving-to-trash t)

  ;; 让 dired 可以递归的拷贝和删除目录
  (setq-default dired-recursive-copies 'top
                dired-recursive-deletes 'top)

  ;; 在 tramp 中使用 dired 时，允许使用远程机器的 .dir-locals.el 文件的配置
  (setq enable-remote-dir-locals t))

;; ----------------------------------------
;; imenu
;; ----------------------------------------

;; 文件改动后，告诉 imenu 自动扫描生成新的索引
(use-package imenu
  :init
  (setq imenu-auto-rescan t)
  :bind
  ("M-1" . imenu))

;; ----------------------------------------
;; ido-mode
;; ----------------------------------------

(use-package ido
  :config
  (ido-mode 1)
  :bind
  ("M-2" . ido-switch-buffer)
  ("M-3" . ido-find-file))

;; ----------------------------------------
;; term
;; ----------------------------------------

(use-package term
  :bind (("C-c t" . visit-term-buffer)
         :map term-mode-map
         ("M-p" . previous-buffer)
         ("M-n" . next-buffer)
         ("M-k" . kill-buffer-no-comfirm)
         :map term-raw-map
         ("M-p" . previous-buffer)
         ("M-n" . next-buffer)
         ("M-k" . kill-buffer-no-comfirm)))

;; ----------------------------------------
;; avy
;;
;; 在屏幕中快速的跳转到指定的位置
;; ----------------------------------------

(use-package avy
  :bind
  (("M-g M-g" . avy-goto-word-1)
   ("M-g M-a" . avy-goto-line)
   ("M-g M-q" . avy-pop-mark)
   ("M-g M-w" . avy-copy-line)
   ("M-g M-r" . avy-copy-region)
   ("M-g M-d" . avy-move-line)))

;; 不使用 helm，因为它的 minibuffer 的使用和 Emacs 原生的不一致。
;; 例如，在 minibuffer 中，TAB 一般是补全，但是 helm 没有遵循这种习惯。

;; 使用 Emacs 自带的 ido-mode 来进行 buffer 的切换和文件的打开

;; ----------------------------------------
;; Magit
;; ----------------------------------------

(require 'magit)
(global-set-key (kbd "C-c m s") 'magit-status)

;; 使 Magit 不要覆盖自定义的快捷键
(define-key magit-mode-map (kbd "C-M-1") 'magit-section-show-level-1-all)
(define-key magit-mode-map (kbd "C-M-2") 'magit-section-show-level-2-all)
(define-key magit-mode-map (kbd "C-M-3") 'magit-section-show-level-3-all)
(define-key magit-mode-map (kbd "C-M-4") 'magit-section-show-level-4-all)
(define-key magit-mode-map (kbd "M-1") 'imenu)
(define-key magit-mode-map (kbd "M-2") 'ido-switch-buffer)
(define-key magit-mode-map (kbd "M-3") 'ido-find-file)
(define-key magit-mode-map (kbd "M-4") 'bookmark-jump)
(define-key magit-mode-map (kbd "M-n") 'next-buffer)
(define-key magit-mode-map (kbd "M-p") 'previous-buffer)
(define-key magit-mode-map (kbd "M-o") 'find-file-at-point-no-confirm)
(define-key magit-mode-map (kbd "M-k") 'kill-buffer-no-comfirm)
(define-key magit-mode-map (kbd "M-e") 'eshell)
(define-key magit-mode-map (kbd "C-.") 'set-mark-command)

;; 使用 use-package 配置 magit，不能正确显示 magit-status
;; 原因未知，暂时不用 use-package 配置

;; (use-package magit
;;   :after (magit-popup)
;;   :config
;;   (magit-status-mode 1)
;;   :bind
;;   (("C-c m s" . magit-status))
;;   ;; 使 Magit 不要覆盖自定义的快捷键
;;   :bind
;;   (:map magit-mode-map
;;         ("C-M-1" . magit-section-show-level-1-all)
;;         ("C-M-2" . magit-section-show-level-2-all)
;;         ("C-M-3" . magit-section-show-level-3-all)
;;         ("C-M-4" . magit-section-show-level-4-all)
;;         ("M-1" . imenu)
;;         ("M-2" . ido-switch-buffer)
;;         ("M-3" . ido-find-file)
;;         ("M-4" . bookmark-jump)
;;         ("M-p" . previous-buffer)
;;         ("M-n" . next-buffer)
;;         ("M-o" . find-file-at-point-no-confirm)
;;         ("M-k" . kill-buffer-no-comfirm)
;;         ("M-e" . eshell)
;;         ("C-." . set-mark-command)))

;; (use-package magit-popup :defer t)

;; ----------------------------------------
;; cmake-ide rtags
;;
;; 配置阅读 C/C++ 代码时的查看定义和查看引用
;;
;; https://syamajala.github.io/c-ide.html
;; ----------------------------------------

(use-package rtags
  :init
  (setq rtags-completions-enabled t)
  (setq rtags-autostart-diagnostics t)
  :config
  (rtags-enable-standard-keybindings))

(use-package cmake-ide
  :after (rtags)
  :config (cmake-ide-setup))

;; Using cmake-ide

;; To have cmake-ide automatically create a compilation commands file in your
;; project root create a .dir-locals.el containing the following

;; ((nil . ((cmake-ide-build-dir . "<absolute_path_to_project_build_directory>"))

;; ----------------------------------------
;; 全局变量，自定义加载 el 文件的目录
;; ----------------------------------------

(defvar c-related-mode '(c++-mode c-mode java-mode objc-mode)
  "The C related mode.")

(defvar c-related-mode-hook
  (mapcar (lambda (mode)
            (intern (concat (symbol-name mode) "-hook")))
          c-related-mode)
  "The C related mode hook.")

(defvar lisp-related-mode '(clojure-mode common-lisp-mode emacs-lisp-mode eshell-mode
                            inferior-emacs-lisp-mode lisp-interaction-mode lisp-mode
                            scheme-mode slime-repl-mode)
  "The Lisp related mode.")

(defvar lisp-related-mode-hook
  (mapcar (lambda (mode)
            (intern (concat (symbol-name mode) "-hook")))
          lisp-related-mode)
  "The Lisp related mode hook.")

;; ----------------------------------------
;; 基本设置
;; ----------------------------------------

;; 初始化设置
(setq-default inhibit-startup-screen t)
(setq-default initial-scratch-message nil)
(setq-default initial-major-mode 'text-mode)

;; 使用 text-mode 时每 70 个字符自动缩进
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 70)

;; 隐藏工具栏和滚动条
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; 选中的区域高亮
(setq-default transient-mark-mode t)

;; 设置保存光标位置为环形方式，周而复始地循环
(setq-default set-mark-command-repeat-pop t)

;; 设置保存最大的光标数目，设置一个小的数目，太大反而不好用
(setq-default mark-ring-max 8)

;; 在状态栏显示行号和列号
(setq-default line-number-mode t)
(setq-default column-number-mode t)

;; 设置制表符的长度显示为 8 个空格
(setq-default tab-width 8)

;; 不使用制表符进行缩进
(setq-default indent-tabs-mode nil)

;; 制表符的显示为一个拉长的光标
(setq x-stretch-cursor t)

;; 首先缩进，然后补全
(setq tab-always-indent 'complete)

;; 默认行为是，当光标在屏幕底部最后一行时，按下下一行时，屏幕会卷动平
;; 个屏幕；改变这个行为，每次只卷动一行。
(setq-default scroll-conservatively 100)

;; 总是以一个换行符结束文件
(setq-default require-final-newline t)

;; 在使用 isearch 搜索时，允许使用 C-v/C-l 卷动屏幕
(setq isearch-allow-scroll t)
(put 'view-lossage 'isearch-scroll t)

;; 立即保存书签
(setq-default bookmark-save-flag 1)

;; 备份设置
(setq-default make-backup-file t)
(setq-default version-control t)
(setq-default backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))
(setq-default delete-old-versions t)

;; 支持emacs和外部程序的粘贴
(setq-default x-select-enable-clipboard t)

;; 括号匹配时显示另外一边的括号，而不是跳转到另一个括号
(when (fboundp 'show-paren-mode)
  (show-paren-mode t)
  (setq-default show-paren-style 'parentheses))

;; 设置一个大的 kill-ring
(setq-default kill-ring-max 1024)

;; 光标靠近时，鼠标不动
(mouse-avoidance-mode 'none)

;; 不要在鼠标点击的那个地方插入剪贴板内容
(setq-default mouse-yank-at-point t)

;; 禁止光标和屏幕闪烁
(when (fboundp 'blink-cursor-mode)
  (blink-cursor-mode -1)
  (setq-default visible-bell nil))

;; 递归使用 minibuffer
(setq-default enable-recursive-minibuffers t)

;; 在标题栏显示 buffer 的名字
(setq-default frame-title-format '(buffer-file-name "%f" ("%b")))

;; 比较差异文件时启动 -u 模式
(setq-default diff-switches "-u")

;; 取消原本不开启的命令
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; ----------------------------------------
;; 中英文字体设置
;; ----------------------------------------

;;; http://emacser.com/torture-emacs.htm

(defvar English-font-list '("Monaco"
                            "文泉驿等宽正黑"
                            "Monospace"
                            "Consolas"
                            "DejaVu Sans Mono"))

(defvar Chinese-font-list '("DejaVu Sans YuanTi Mono"
                            "华文黑体"
                            "文泉驿等宽正黑"
                            "文泉驿等宽微米黑"))

;; 首先，判断某个字体在系统中是否安装
(defun qiang-font-existsp (font)
  (not (null (x-list-fonts font))))

;; 还要有个辅助函数，用来生产带上 font size 信息的 font 描述文本
(defun qiang-make-font-string (font-name font-size)
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

;; 有了这些函数，下面出场的就是自动设置字体函数了
(defun qiang-set-font (english-fonts
                       english-font-size
                       chinese-fonts
                       &optional chinese-font-size)
  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (require 'cl)                         ; for find-if
  (let ((en-font (qiang-make-font-string
                  (find-if #'qiang-font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (find-if #'qiang-font-existsp chinese-fonts)
                            :size chinese-font-size)))

    ;; Set the default English font
    ;;
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (message "Set English Font to %s" en-font)
    (set-face-attribute 'default nil :font en-font)

    ;; Set Chinese font
    ;; Do not use 'unicode charset, it will cause the english font setting invalid
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        zh-font))))

;; 利用这个函数，Emacs 字体设置就是小菜一碟了
(if window-system
    (let ((height (display-pixel-height))
          (width  (display-pixel-width)))
      (cond

       ((and (>= width 1920) (>= height 1080))
        (qiang-set-font English-font-list ":pixelsize=15"
                        Chinese-font-list 15))

       ((and (>= width 1366) (>= height 768))
        (qiang-set-font English-font-list ":pixelsize=14"
                        Chinese-font-list 14))

       ((and (>= width 1024) (>= height 600))
        (qiang-set-font English-font-list ":pixelsize=13"
                        Chinese-font-list 13))

       (t
        (qiang-set-font English-font-list ":pixelsize=12"
                        Chinese-font-list 12)))))

;; ----------------------------------------
;; 常用模式设置
;; ----------------------------------------

;; 启用语法高亮
(global-font-lock-mode 1)

(defun turn-off-font-lock-mode ()
  (font-lock-mode 0))

;; 在编程相关的模式中，禁用语法高亮
;; 语法高亮在代码量多的时候，会非常刺眼
(add-to-list 'prog-mode-hook 'turn-off-font-lock-mode)

;; 当 buffer 对应的文件有更新时，自动更新 buffer 的内容
(global-auto-revert-mode 1)

;; 启用保存窗口布局，窗口改变时可以使用 C-c <left> 或者 C-c <right> 来恢复窗口
(winner-mode 1)

;; 打开多个相同文件名的缓冲区，在前面加上目录名来区分不同的缓冲区名字
(require 'uniquify)
(setq-default uniquify-buffer-name-style 'forward)

;; 当输入一对的字符时，输入开始字符，自动输入结束字符
;; 例如，输入 ( 后，自动输入 )。这在编码时，非常方便，减少输入量。
(electric-pair-mode 1)

;; 在 mode-line 中显示光标所在函数的名字
(setq which-func-modes t)
(which-function-mode t)

;; 查看 unix 手册页时，显示所有符合条件的手册页
;; 例如： stat(1) stat(2)
(setq Man-switches "-a")

;; 设置类 C 模式的编码风格
(setq c-default-style '((awk-mode       . "awk")
                        (c-mode         . "linux")
                        (c++-mode       . "stroustrup")
                        (objc-mode      . "cc-mode")
                        (java-mode      . "java")
                        (other          . "gnu")))

;; Taken from the cc-mode manual
;; Make a non-standard key binding.  We can put this in
;; c-mode-base-map because c-mode-map, c++-mode-map, and so on,
;; inherit from it.
(defun setup-c-initialization-hook ()
  (define-key c-mode-base-map (kbd "RET") 'c-context-line-break))

(add-hook 'c-initialization-hook 'setup-c-initialization-hook)

(defun setup-c-mode-common-hook ()
  (c-toggle-hungry-state 1)
  (subword-mode 1))

(add-hook 'c-mode-common-hook 'setup-c-mode-common-hook)

;; ----------------------------------------
;; key binding
;;
;; 自定义快捷键，包括：
;;     1. 将一个内建的命令重新绑定到另外一个快捷键
;;     2. 定义一些小函数，封装内建函数，绑定到一个快捷键
;;
;; 快捷键绑定的原则：与原生 Emacs 的快捷键绑定风格保持一致，将自己常用
;; 的命令，尽量绑定到按键最少的快捷键。如果实在需要多个按键，那么绑定
;; 到可以连续操作的方式。
;;
;; 例如，M-2 切换缓冲区就只需要按一次，右手拇指按下 Alt，左手按下 2；
;; 而原生的切换缓冲区的快捷键时 C-x b，这样需要两次按键，C-x 一次，b
;; 一次，减慢了速度，同时影响编辑体验。
;;
;; M-g M-a 就比 M-g M-l 要好，因为 M-g M-a 可以连续操作，右按下 Alt 不
;; 动，左手可以连续地按下 g a，而 M-g M-l 的按键序列是，右手按下 Alt
;; 左手按下 g，然后左手按下 Alt，右手按下 l，操作起来能够明显感到切换。
;; ----------------------------------------

(global-unset-key (kbd "C-."))
(global-set-key (kbd "C-.") 'set-mark-command)

(global-unset-key (kbd "M-n"))
(global-set-key (kbd "M-n") 'next-buffer)

(global-unset-key (kbd "M-p"))
(global-set-key (kbd "M-p") 'previous-buffer)

(global-unset-key (kbd "M-e"))
(global-set-key (kbd "M-e") 'eshell)

;; 暂时禁用
(global-unset-key (kbd "C-\\"))
(global-set-key (kbd "C-\\") 'delete-trailing-whitespace)

(global-unset-key (kbd "M-4"))
(global-set-key (kbd "M-4") 'bookmark-jump)

(global-unset-key (kbd "M-5"))
(global-set-key (kbd "M-5") 'point-to-register)

(global-unset-key (kbd "M-6"))
(global-set-key (kbd "M-6") 'jump-to-register)

(global-unset-key (kbd "M-7"))
(global-set-key (kbd "M-7") 'rgrep)

(global-unset-key (kbd "M-8"))
(global-set-key (kbd "M-8") 'occur)

(global-unset-key (kbd "M-9"))
(global-set-key (kbd "M-9") 'recompile)

(global-unset-key (kbd "M-0"))
(global-set-key (kbd "M-0") 'compile)

;; ----------------------------------------
;; 以下是自定义的小函数的快捷键绑定
;; ----------------------------------------

;; ----------------------------------------
;; C-t: 查找光标所在符号的定义
;; ----------------------------------------

;;;###autoload
(defun find-tag-select-at-point ()
  "Find tag select at point"
  (interactive)
  (find-tag (thing-at-point 'symbol 'no-properties)))

(global-unset-key (kbd "C-t"))
(global-set-key (kbd "C-t") 'find-tag-select-at-point)

;; ----------------------------------------
;; C-j: 当光标在当前行，自动在下一行打开新行，同时缩进
;; ----------------------------------------

;;;###autoload
(defun open-newline-indent ()
  "Open new line and indent."
  (interactive)
  (move-end-of-line 1)
  (open-line 1)
  (forward-char 1)
  (indent-according-to-mode))

(global-unset-key (kbd "C-j"))
(global-set-key (kbd "C-j") 'open-newline-indent)

(dolist (hook (append c-related-mode-hook lisp-related-mode-hook
                      '(asm-mode-hook sh-mode-hook)))
  (add-hook hook (lambda () (local-set-key (kbd "C-j") 'open-newline-indent))))

;; ----------------------------------------
;; M-j: 当光标在当前行，自动在上一行打开新行，同时缩进
;; ----------------------------------------

;;;###autoload
(defun open-newline-above ()
  "open a new line above current line."
  (interactive)
  (move-beginning-of-line 1)
  (open-line 1)
  (indent-according-to-mode))

(global-unset-key (kbd "M-j"))
(global-set-key (kbd "M-j") 'open-newline-above)

(dolist (hook (append c-related-mode-hook lisp-related-mode-hook
                      '(asm-mode-hook sh-mode-hook)))
  (add-hook hook (lambda () (local-set-key (kbd "M-j") 'open-newline-above))))

;; ----------------------------------------
;; C-a: 增强默认的移动到行首
;; ----------------------------------------

;;;###autoload
(defun move-beginning-of-line-enhance ()
  "Enhance the default move-beginning-of-line.

When the cursor looks like:

'    hello w|orld'

You pressed C-a, and the cursor move to the real beginning of
line.  If you pressed C-a again, you will get the cursor at the
first non-whitespace char:

'    |hello world'"
  (interactive)
  (let ((column (- (point) (point-at-bol))))
    (cond
     ((/= column 0) (move-beginning-of-line nil))
     (t (back-to-indentation)))))

(global-unset-key (kbd "C-a"))
(global-set-key (kbd "C-a") 'move-beginning-of-line-enhance)

;; ----------------------------------------
;; C-x C-c: 取消退出的快捷键
;; ----------------------------------------

;;;###autoload
(defun give-tips-when-want-quit-emacs ()
  "Prevent ancident hit C-x C-c."
  (interactive)
  (message "Please using save-buffers-kill-terminal to quit Emacs."))

(global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "C-x C-c") 'give-tips-when-want-quit-emacs)

;; ----------------------------------------
;; C-c t: 打开模拟终端的缓冲区
;; ----------------------------------------

;;;###autoload
(defun visit-term-buffer ()
  "Create or visit a terminal buffer.

Taken from: http://emacsredux.com/blog/2013/03/29/terminal-at-your-fingertips/"
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term (getenv "SHELL")))
    (switch-to-buffer-other-window "*ansi-term*")))

(global-unset-key (kbd "C-c t"))
(global-set-key (kbd "C-c t") 'visit-term-buffer)

;; ----------------------------------------
;; C-^: 将当前行和上一行合并
;; ----------------------------------------

;;;###autoload
(defun top-join-line ()
  "Join the current line with the line beneath it.

Taken from: http://emacsredux.com/blog/2013/05/30/joining-lines/"
  (interactive)
  (delete-indentation 1))

(global-unset-key (kbd "C-^"))
(global-set-key (kbd "C-^") 'top-join-line)

;; ----------------------------------------
;; M-k: 关闭缓冲区，不用确认
;; ----------------------------------------

;;;###autoload
(defun kill-buffer-no-comfirm ()
  "Kill buffer, no comfirm."
  (interactive)
  (kill-buffer nil))

(global-unset-key (kbd "M-k"))
(global-set-key (kbd "M-k") 'kill-buffer-no-comfirm)

;; ----------------------------------------
;; M-t: 在最近选中的两个缓冲区中轮流切换
;; ----------------------------------------

;;;###autoload
(defun switch-to-last-buffer ()
  "Switch to previously open buffer.

Repeated invocations toggle between the two most recently open buffers.

taken from emacsredux.com/blog/2013/04/28/switch-to-previous-buffer/"
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(global-unset-key (kbd "M-t"))
(global-set-key (kbd "M-t") 'switch-to-last-buffer)

;; ----------------------------------------
;; M-o: 打开光标所在的文件名，默认是当前目录，不用确认
;; ----------------------------------------

;;;###autoload
(defun find-file-at-point-no-confirm ()
  "find file at point with no confirm

If put cursor at the blank line, it will just open the
default-directory in dired buffer."
  (interactive)
  (find-file (concat default-directory (thing-at-point 'filename 'no-properties))))

(global-unset-key (kbd "M-o"))
(global-set-key (kbd "M-o") 'find-file-at-point-no-confirm)

;; ----------------------------------------
;; 以下是定义的小函数没有快捷键绑定，它们只在各种钩子中运行
;; ----------------------------------------

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; 打开文件后，自动不显示 Windows 的行末符（^M）
(add-hook 'find-file-hooks 'remove-dos-eol)

;; 在 Magit 模式中，自动不显示 Windows 的行末符（^M）
(add-hook 'magit-status-sections-hook 'remove-dos-eol)

;; ----------------------------------------
;; 主题设置
;; ----------------------------------------

;; 加载主题
;; 背景色是墨绿色，这样不会感觉到刺眼
(load-theme 'sanityinc-solarized-dark)

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

;; Local Variables:
;; no-byte-compile: t
;; End:
