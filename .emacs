
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (org2blog))))
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

;;�ر��Զ������ļ�
(setq make-backup-files nil)
;;�������ļ�ȫ���ŵ�һ��Ŀ¼��ȥ
(setq backup-directory-alist (quote (("." . "~/.backups"))))

;; �������������ĵ�ַ
(require 'package)
(add-to-list 'package-archives 
            '("melpa" . "http://melpa.org/packages/"))
(package-initialize)


;;��������
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'badwolf t)

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
(setq org-src-fontify-natively t)
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
