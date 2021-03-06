
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
		      popwin
		      ;; solarized-theme
		      ;;reveal-in-osx-finder ;; 使用命令打开文件系统,貌似自能在mac上用
		      web-mode
		      ;; js重构
		      js2-refactor
		      ;; 选择器
		      expand-region

		      ;; 多区域边际
		      iedit

		      ;; org
		      org-pomodoro

                      ;; 多文件搜索 需要安装helm-ag
                      helm-ag

                      ;;语法检查 eslint
                      flycheck

                      ;;
                      auto-yasnippet

                      ;;evil
                      evil
                      ;; 窗口选择器
                      window-numbering
                      ;; 操作日志
                      ;;mwe-log-commands 
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


;;自动补全插件 
(global-company-mode t)
;; 加载主题
(load-theme 'monokai t)
;; 开启hngry-delete 插件
(require 'hungry-delete)
(global-hungry-delete-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; 自动不全括号插件
;;(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
;; 取消'自动补全

(defun disable-signle-quote()
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
  (sp-local-pair 'emacs-lisp-mode "`" nil :actions nil))
(add-hook 'emacs-lisp-mode-hook #'disable-signle-quote)







;; 设置js文件默认使用js2-model
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))
;; 配置缩进
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)


;; config for js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)

;; config flycheck
(add-hook 'js2-mode-hook 'flycheck-mode)
;; (add-hook 'after-init-hook 'global-flycheck-mode)

;;
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; 开启vim快捷键 
;; (evil-mode 1)

;; 使用 m-1 可以跳转窗口
(window-numbering-mode 1)
(require 'org-pomodoro)
(provide 'init-packages)
