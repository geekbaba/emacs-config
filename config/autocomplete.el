;; auto complete configure settings
(add-to-list 'load-path "~/el/plugins/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/el/plugins/auto-complete/dict")
(ac-config-default)


(provide 'autocomplete)
