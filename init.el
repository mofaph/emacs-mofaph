;; -*- coding: utf-8 -*-

;;; mofaph@gmail.com
;;; 2009-7-13

(add-to-list 'load-path "~/.emacs.d")

(require 'conf-basic)
(require 'conf-ido)
(require 'conf-ibuffer)
(require 'conf-uniquify)
(require 'conf-fullscreen)
(require 'conf-theme)
(require 'conf-which-function-mode)
(require 'conf-session)
(require 'conf-icomplete)
(require 'conf-auto-revert)
(require 'conf-hl-line)
(require 'conf-winner)
(require 'conf-key-binding)
(require 'conf-font)
(require 'conf-defun)
(require 'conf-misc)
(require 'conf-gui)

;; 暂时不能使用 package.el 管理的插件
(require 'conf-slime)

;; 使用 package.el 管理第三方插件
(require 'conf-package)

;; 配置 package.el 管理的插件
(require 'init-nav)
(require 'init-smex)
(require 'switch-window)
(require 'init-auto-complete)
(require 'init-magit)

;; Local Variables:
;; no-byte-compile: t
;; End:
