(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "楷体" :foundry "outline" :slant normal :weight normal :height 102 :width normal)))))

;;文件记录 emacs22以后自带
(require 'recentf)
(setq recentf-max-saved-items 100)
(recentf-mode)
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

(tool-bar-mode -1)
;;屏蔽工具栏

(scroll-bar-mode -1)
;;关闭滚动条

(global-linum-mode t)
;;显示行号

(setq inhibit-splash-screen t)
;;关闭欢迎页面

(setq cursor-type 'bar)
;;设置光标样式

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs")
  )
(global-set-key (kbd "<f2>") 'open-my-init-file)
;;设置快捷键 f2 打开配置文件

;;(global-company-mode t)
;;提示模式
