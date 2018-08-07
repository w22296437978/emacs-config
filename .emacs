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
 '(default ((t (:family "����" :foundry "outline" :slant normal :weight normal :height 102 :width normal)))))

;;�ļ���¼ emacs22�Ժ��Դ�
(require 'recentf)
(setq recentf-max-saved-items 100)
(recentf-mode)
;;��Ҫ������Ĳ�����Զ���ļ�
(add-to-list 'recentf-keep 'file-remote-p)

;;f5 ��ݼ�������ļ��б�
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
;;���ι�����

(scroll-bar-mode -1)
;;�رչ�����

(global-linum-mode t)
;;��ʾ�к�

(setq inhibit-splash-screen t)
;;�رջ�ӭҳ��

(setq cursor-type 'bar)
;;���ù����ʽ

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs")
  )
(global-set-key (kbd "<f2>") 'open-my-init-file)
;;���ÿ�ݼ� f2 �������ļ�

;;(global-company-mode t)
;;��ʾģʽ
