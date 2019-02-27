;; 修改utf-8默认保存格式
(set-language-environment  "UTF-8")

;;文件记录
(require 'recentf)
(recentf-mode 1) ;开启模式
(setq recentf-max-menu-items 25) ;保存最近使用的25个文件
;;不要让上面的插件检查远程文件
(add-to-list 'recentf-keep 'file-r/emote-p)

;;关闭自动备份文件
(setq make-backup-files nil)
;; 关闭自动保存文件
(setq auto-save-default nil)

;; 全选输入后面增加改为替换选中内容
(delete-selection-mode t)
;; 括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode) ;; 添加一个钩子到emacs-lisp...
;; 扩展括号匹配 光标在内部高亮外部括号
(define-advice show-paren-function (:around (fun) fix-show-parent-function)
  (cond ((looking-at-p "\\s(") (funcall fun))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fun)))))

;; 自动加载外部修改过来的文件
(global-auto-revert-mode 1)


;; 将光标移动到新建的窗口
(require 'popwin)
(popwin-mode 1)

;;关闭错误声音
(setq ring-bell-function 'ignore)

;; y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; 自定义提示快捷建
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("try" "try{\n\n}catch(error){\n\n}")
					    ))

;; 递归拷贝/删除目录禁止询问
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

;;重用目录buffer
(put 'dired-find-alternate-file 'disabled nil)
;;(require 'dired)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 支持使用 <c-x c-j> 打开当前文件所在目录的dired
(require 'dired-x)
;; 跨目录复制
(setq dired-dwim-target t)

;; 删除dos换行符
(defun remove-dos-eol ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
;;隐藏dos换行符
(defun hidden-dos-eol ()
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; 优化occur
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))


;; 优化imenu 当前函数的列表
(defun js2-imenu-make-index ()
      (interactive)
      (save-excursion
	;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
	(imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
				   ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
				   ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
	      (lambda ()
		(setq imenu-create-index-function 'js2-imenu-make-index)))


(provide 'init-better-defaults)

