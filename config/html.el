;;html editor configure settings

(add-to-list 'load-path "~/el/plugins/zencoding")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; zencoding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
(global-set-key "\C-cx" 'zencoding-expand-line)
(global-set-key "\C-cz" 'zencoding-preview)


(provide 'html)
