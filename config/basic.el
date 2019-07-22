;;load plugins
(setq initial-frame-alist '((top . 1) (left . 1) (width . 162) (height . 42) (alpha 95 90)))

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

(add-to-list 'load-path "~/el/themes")
(add-to-list 'load-path "~/el/company-mode")
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


(add-to-list 'load-path "~/el/plugins/mark-multiple.el")


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


;; set switch window
(windmove-default-keybindings);;use shift + left right switch window
;;kill ring max
;(setq kill-ring-max 200)

(require 'linum)
(global-linum-mode 1)
(column-number-mode t)

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

(add-hook 'after-init-hook 'global-company-mode)
(use-package company-tabnine :ensure t)
(require 'company-tabnine)
(add-to-list 'company-backends #'company-tabnine)

;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;; Use the tab-and-go frontend.
;; Allows TAB to select and complete at the same time.
(company-tng-configure-default)
(setq company-frontends
      '(company-tng-frontend
        company-pseudo-tooltip-frontend
        company-echo-metadata-frontend))


(autoload 'helm-company "helm-company") ;; Not necessary if using ELPA package
(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "C-:") 'helm-company)))
(provide 'basic)
