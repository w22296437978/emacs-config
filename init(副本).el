;; 自动检测下载插件
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		;;smex
		swiper
		counsel
		smartparens
		;; --- Major Mode ---
		js2-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		;; solarized-theme
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))



 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))
; 加载主题
(load-theme 'monokai t)
; 开启hngry-delete 插件
(require 'hungry-delete)
(global-hungry-delete-mode)
; 方便使用的<m-x>的插件
;(require 'smex)
;(smex-initialize)
;(global-set-key (kbd "M-x") 'smex)
;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
;;(global-set-key (kbd "C-c C-r") 'ivy-resume)
;(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function) ;查看函数
(global-set-key (kbd "<f1> v") 'counsel-describe-variable);; 查看变量
(global-set-key (kbd "<f1> l") 'counsel-find-library) ;查看库
;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;(global-set-key (kbd "<f2> u") 'counsel-unicode-char
;(global-set-key (kbd "C-c g") 'counsel-git)
;(global-set-key (kbd "C-c j") 'counsel-git-grep)
;(global-set-key (kbd "C-c k") 'counsel-ag)
;(global-set-key (kbd "C-x l") 'counsel-locate)
;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
; 自动不全括号插件
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)

; 设置js文件默认使用js2-model
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
; 设置使用nodejs运行js文件

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;插件
;;文件记录
(require 'recentf)
(recentf-mode 1) ;开启模式
(setq recentf-max-menu-items 25) ;保存最近使用的25个文件
(global-set-key "\C-x\ \C-r" 'recentf-open-files) ;; 设置快捷建打开最近的文件列表
;; <m-x eval-buffer> 执行整个buff
;;不要让上面的插件检查远程文件
(add-to-list 'recentf-keep 'file-remote-p)
;;f5 快捷键打开最近文件列表
(define-key global-map [f5] 'my-recentf-open)

(setq ido-enable-flex-matching t)

(defun my-recentf-open ()
  "open recent files.  In ido style if applicable --lgfang"
  (interactive)
  (let* ((path-table (mapcar
                      (lambda (x) (cons (file-name-nondirectory x) x))
                      recentf-list))
         (file-list (mapcar (lambda (x) (file-name-nondirectory x))
                            recentf-list))
         (complete-fun (if (require 'ido nil t)
                           'ido-completing-read
                         'completing-read))
         (fname (funcall complete-fun "File Name: " file-list)))
    (find-file (cdr (assoc fname path-table)))))
;自动补全插件 
(global-company-mode t)

;;;;;;;;;;;;;;;;;;基本设置

;;屏蔽工具栏
(tool-bar-mode -1)
;;关闭滚动条
(scroll-bar-mode -1)
;;显示行号
(global-linum-mode t)
;;关闭欢迎页面
(setq inhibit-splash-screen t)
;;设置光标样式
; setq设置的是buffer-local的变量
; setq-defailt 设置的是全局的变量
(setq-default cursor-type 'bar)

; 全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;显示当前行,当前行高亮
(global-hl-line-mode t)
;设置字体大小
(set-default-font "-bitstream-Courier 10 Pitch-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")


; 关闭自动换行的minor,注释推荐使用两个分号
;(setq-default electric-indent-mode nil)
;;设置快捷键 f2 打开配置文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )
(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;;关闭自动备份文件
(setq make-backup-files nil)

;;将备份文件全部放到一个目录中去
(setq-default backup-directory-alist (quote (("." . "~/.backups"))))

;; 全选输入后面增加改为替换选中内容
(delete-selection-mode t)


; 括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode) ;; 添加一个钩子到emacs-lisp...

(defun close-C-z()
  (interactive)
  (message "deepins使用卡死 暂时关闭"))
(global-set-key (kbd "C-z") 'close-C-z)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;加载主题
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;(load-theme 'badwolf t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;org
(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))
(require 'org)
(setq org-src-fontify-natively t) ;;插入文本高亮
(add-hook 'org-mode-hook '(lambda ()
                            ;; turn on flyspell-mode by default
                            ;;(flyspell-mode 1)
                            ;; C-TAB for expanding
                            (local-set-key (kbd "C-<tab>")
                                           'yas/expand-from-trigger-key)
                            ;; keybinding for editing source code blocks
                            (local-set-key (kbd "C-c s e")
                                           'org-edit-src-code)
                            ;; keybinding for inserting code blocks
                            (local-set-key (kbd "C-c s i")
                                           'org-insert-src-block)
                            ))


;; 该文件夹下的内容允许使用议程模式
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dim gray")))))
