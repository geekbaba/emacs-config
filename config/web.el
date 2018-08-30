;;web-mode with php-mode setting
(add-to-list "~/el/plugins/web-mode")
(add-to-list "~/el/plugins/ac-php")


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-engines-alist
      '(("php"    . "\\.php\\'")
        ("blade"  . "\\.blade\\."))
)

(defun bs-web-mode-hook ()
  (local-set-key '[backtab] 'indent-relative)
  (setq indent-tabs-mode nil)
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook 'bs-web-mode-hook)


(defun bs-php-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 2)
  (setq php-template-compatibility nil)
  (subword-mode 1))

(add-hook 'php-mode-hook 'bs-php-mode-hook)



(defun toggle-php-flavor-mode ()
  (interactive)
  "Toggle mode between PHP & Web-Mode Helper modes"
  (cond ((string= mode-name "PHP")
         (web-mode))
        ((string= mode-name "Web")
         (php-mode))))

(global-set-key [f11] 'toggle-php-flavor-mode)


(defun bs-php-mode-hook ()
  (auto-complete-mode t)                 ;; «
  (require 'ac-php)                      ;; «
  (setq ac-sources  '(ac-source-php ))   ;; «
  (yas-global-mode 1)                    ;; «
  (setq indent-tabs-mode nil)
  (setq php-template-compatibility nil)
  (setq c-basic-offset 2))



(provide 'web)
