
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
; 括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode) ;; 添加一个钩子到emacs-lisp...

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
(provide 'init-better-defaults)

