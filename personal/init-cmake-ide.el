;; https://syamajala.github.io/c-ide.html

(require 'rtags)

;; Source code navigation using RTags

(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)

;; CMake automation with cmake-ide

(cmake-ide-setup)

;; Using cmake-ide

;; To have cmake-ide automatically create a compilation commands file in your
;; project root create a .dir-locals.el containing the following

;; ((nil . ((cmake-ide-build-dir . "<absolute_path_to_project_build_directory>"))

(provide 'init-cmake-ide)
