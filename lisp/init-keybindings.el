
;; swiper
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

(global-set-key "\C-x\ \C-r" 'recentf-open-files) ;; 设置快捷建打开最近的文件列表



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

;;设置快捷键 f2 打开配置文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )
(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


(defun close-C-z()
  (interactive)
  (message "deepins使用卡死 暂时关闭"))
(global-set-key (kbd "C-z") 'close-C-z)

;; 补全快捷建
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
(global-set-key (kbd "s-/") 'hippie-expand)


;; 查找当前处于git版本控制的文件
(global-set-key (kbd "C-c p f") 'counsel-git)

;; 格式化 <c-m \>
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion;; 保存当前鼠标,缓冲区的位置,函数执行完毕之后还原
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "格式化选定代码"))
      (progn
	(indent-buffer)
	(message "格式缓冲区代码")))))
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; 缩进切换
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

(global-set-key (kbd "M-s o") 'occur-dwim)
(global-set-key (kbd "M-s i") 'counsel-imenu)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "M-s e") 'iedit-mode)

;; js重构
(js2r-add-keybindings-with-prefix "C-c C-m")

;; 全局搜素
(global-set-key (kbd "C-c p s") 'helm-ag-project-root)


(provide 'init-keybindings)
