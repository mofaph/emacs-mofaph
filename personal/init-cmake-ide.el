;; https://syamajala.github.io/c-ide.html

(require 'rtags)
(require 'company-rtags)

(add-hook 'after-init-hook 'global-company-mode)
(global-unset-key (kbd "C-c /"))
(global-set-key (kbd "C-c /") 'company-complete)

;; Source code navigation using RTags

(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-rtags))
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)

(require 'rtags-helm)
(setq rtags-use-helm t)

;; Source code completion using Irony

;; NOTE: Irony requires a compilation database. To create one run the following:
;; $ cd /path/to/project/root
;; $ cmake . -DCMAKE_EXPORT_COMPILE_COMMANDS=1

;; The first time you run irony you must install the irony-server by running the command:
;; M-x irony-install-server

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point] 'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol] 'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Using Company with Irony

(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(setq company-backends (delete 'company-semantic company-backends))
(require 'company-irony-c-headers)
(eval-after-load 'company
  '(add-to-list 'company-backends '(company-irony-c-headers company-irony)))

;; Syntax checking with Flycheck

(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)

;; Integrating RTags with Flycheck
(require 'flycheck-rtags)

(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags)
  ;; RTags creates more accurate overlays
  (setq-local flycheck-highlighting-mode nil)
  (setq-local flycheck-check-syntax-automatically nil))

;; c-mode-common-hook is also called by c++-mode
(add-hook 'c-mode-common-hook #'my-flycheck-rtags-setup)

;; Integrating Irony with Flycheck
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; CMake automation with cmake-ide

(cmake-ide-setup)

;; Using cmake-ide

;; To have cmake-ide automatically create a compilation commands file in your
;; project root create a .dir-locals.el containing the following

;; ((nil . ((cmake-ide-build-dir . "<absolute_path_to_project_build_directory>"))

(provide 'init-cmake-ide)
