(require 'smtpmail)

(setq send-mail-function 'smtpmail-send-it)

(setq smtpmail-auth-credentials "~/.authinfo.gpg")
(setq smtpmail-smtp-server "smtp.exmail.qq.com")
(setq smtpmail-smtp-service 465)
(setq smtpmail-stream-type 'ssl)

(provide 'conf-email)
