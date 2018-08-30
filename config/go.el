;;;;;;go lang settings
(add-to-list 'load-path "~/el/plugins/go-mode")
(add-to-list 'load-path "~/go/src/github.com/nsf/gocode/emacs")
(add-to-list 'load-path "~/el/plugins/exec-path-from-shell")

;;go mode settings
(require 'go-mode-autoloads)

(add-hook 'before-save-hook 'gofmt-before-save)

(require 'go-autocomplete)


;;require
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(provide 'go)
