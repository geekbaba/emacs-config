(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;load plugins
(setq initial-frame-alist '((top . 1) (left . 1) (width . 162) (height . 42) (alpha 90 50)))
(add-to-list 'load-path "~/el/themes")
(add-to-list 'load-path "~/el/plugins")
(add-to-list 'load-path "~/el/plugins/zencoding")
(add-to-list 'load-path "~/el/plugins/mark-multiple.el")
(add-to-list 'load-path "~/el/plugins/go-mode")
(add-to-list 'load-path "~/el/plugins/popup")
(add-to-list 'load-path "~/el/plugins/auto-complete")
(add-to-list 'load-path "~/go/src/github.com/nsf/gocode/emacs")
(add-to-list 'load-path "~/el/plugins/exec-path-from-shell")

;;test commit
;;Personal information
(setq user-full-name "Jiang Hao")
(setq user-mail-address "jianghao***@gmail.com")

;;不要生成临时文件
;;(setq-default make-backup-files nil)
 
;;设置中文语言环境
(set-language-environment 'Chinese-GB)
;; 设置emacs 使用 utf-8
(setq locale-coding-system 'utf-8)
;; 设置键盘输入时的字符编码
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
;; 文件默认保存为 utf-8
(set-buffer-file-coding-system 'utf-8)
(set-default buffer-file-coding-system 'utf8)
(set-default-coding-systems 'utf-8)
;; 解决粘贴中文出现乱码的问题
(set-clipboard-coding-system 'utf-8)
;; 终端中文乱码
(set-terminal-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
;; 解决文件目录的中文名乱码
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
;; 解决 Shell Mode(cmd) 下中文乱码问题
(defun change-shell-mode-coding ()

  (progn
    (set-terminal-coding-system 'gbk)
    (set-keyboard-coding-system 'gbk)
    (set-selection-coding-system 'gbk)
    (set-buffer-file-coding-system 'gbk)
    (set-file-name-coding-system 'gbk)
    (modify-coding-system-alist 'process "*" 'gbk)
    (set-buffer-process-coding-system 'gbk 'gbk)
    (set-file-name-coding-system 'gbk)))
;; 字体设置
;;(set-default-font "-outline-新宋体-normal-r-normal-normal-12-*-96-96-c-*-gb2312")
(set-frame-font "Courier New-16")
;;打开图片显示功能
(auto-image-file-mode t)
 
;;以 y/n 替代 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;[[themes]]


(require 'wombat-theme)

;;显示列号
(setq mouse-yank-at-point t)
 
;;显示括号匹配
(show-paren-mode t)

;;高亮显示选中的区域
(transient-mark-mode t)
 
;;支持emacs和外部程序的拷贝粘贴
(setq x-select-enable-clipboard t)
 
;;禁止终端响铃
(setq visiable-bell t)
 
 ;;设置tab为4个空格的宽度
(setq default-tab-width 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mark multiple
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'inline-string-rectangle)
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(require 'mark-more-like-this)
;;(global-set-key (kbd "M-<") 'mark-previous-like-this)
;;(global-set-key (kbd "M->") 'mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mark-more-like-this) ; like the other two, but takes an argument (negative is previous)
(global-set-key (kbd "C-*") 'mark-all-like-this)
(global-set-key (kbd "C-M-n") 'mark-more-like-this-extended)

(add-hook 'sgml-mode-hook
          (lambda ()
            (require 'rename-sgml-tag)
            (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))

;; after deleting a tag, indent properly
(defadvice sgml-delete-tag (after reindent activate)
  (indent-region (point-min) (point-max)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; zencoding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
(global-set-key "\C-cx" 'zencoding-expand-line)
(global-set-key "\C-cz" 'zencoding-preview)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; reload-file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun reload-file()
  "reload-file is reload current buffer from disk"
  (interactive)
  (revert-buffer t (not (buffer-modified-p)) t))
(global-set-key (kbd "C-c r f") 'reload-file)


;;set ace jump

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


;;kill ring max
;(setq kill-ring-max 200)

(require 'linum)
(global-linum-mode 1)
(column-number-mode t)

;; set switch window
(windmove-default-keybindings);;use shift + left right switch window

;;go mode settings
(require 'go-mode-autoloads)

(add-hook 'before-save-hook 'gofmt-before-save)

(require 'go-autocomplete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/el/plugins/auto-complete/dict")
(ac-config-default)

;;require
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

;;;; eshell CL clear screen

(defun eshell-clear-screen ()
    "clear screen"
    (interactive)
    (let ((inhibit-read-only t))
        (erase-buffer)
        (eshell-send-input)))
(add-hook 'eshell-mode-hook
    '(lambda ()
        (local-set-key (kbd "C-l") 'eshell-clear-screen)))
