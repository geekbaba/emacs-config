(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;(require 'package)

(package-initialize)

(add-to-list 'load-path "~/el/config")

(add-to-list 'load-path "~/el/plugins")
(add-to-list 'load-path "~/el/plugins/popup")

(require 'melpa);;with python
(require 'basic)
(require 'autocomplete)

(require 'go)
(require 'web)

(require 'html)

