;; �Զ�������ز��
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; ע�� elpa.emacs-china.org �� Emacs China ���������ڹ��ڴ��һ�� ELPA ����

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
; ��������
(load-theme 'monokai t)
; ����hngry-delete ���
(require 'hungry-delete)
(global-hungry-delete-mode)
; ����ʹ�õ�<m-x>�Ĳ��
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
(global-set-key (kbd "<f1> f") 'counsel-describe-function) ;�鿴����
(global-set-key (kbd "<f1> v") 'counsel-describe-variable);; �鿴����
(global-set-key (kbd "<f1> l") 'counsel-find-library) ;�鿴��
;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;(global-set-key (kbd "<f2> u") 'counsel-unicode-char
;(global-set-key (kbd "C-c g") 'counsel-git)
;(global-set-key (kbd "C-c j") 'counsel-git-grep)
;(global-set-key (kbd "C-c k") 'counsel-ag)
;(global-set-key (kbd "C-x l") 'counsel-locate)
;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
; �Զ���ȫ���Ų��
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)

; ����js�ļ�Ĭ��ʹ��js2-model
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
; ����ʹ��nodejs����js�ļ�

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;���
;;�ļ���¼
(require 'recentf)
(recentf-mode 1) ;����ģʽ
(setq recentf-max-menu-items 25) ;�������ʹ�õ�25���ļ�
(global-set-key "\C-x\ \C-r" 'recentf-open-files) ;; ���ÿ�ݽ���������ļ��б�
;; <m-x eval-buffer> ִ������buff
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
;�Զ���ȫ��� 
(global-company-mode t)

;;;;;;;;;;;;;;;;;;��������

;;���ι�����
(tool-bar-mode -1)
;;�رչ�����
(scroll-bar-mode -1)
;;��ʾ�к�
(global-linum-mode t)
;;�رջ�ӭҳ��
(setq inhibit-splash-screen t)
;;���ù����ʽ
; setq���õ���buffer-local�ı���
; setq-defailt ���õ���ȫ�ֵı���
(setq-default cursor-type 'bar)

; ȫ��
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;��ʾ��ǰ��,��ǰ�и���
(global-hl-line-mode t)
;���������С
(set-default-font "-bitstream-Courier 10 Pitch-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")


; �ر��Զ����е�minor,ע���Ƽ�ʹ�������ֺ�
;(setq-default electric-indent-mode nil)
;;���ÿ�ݼ� f2 �������ļ�
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )
(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;;�ر��Զ������ļ�
(setq make-backup-files nil)

;;�������ļ�ȫ���ŵ�һ��Ŀ¼��ȥ
(setq-default backup-directory-alist (quote (("." . "~/.backups"))))

;; ȫѡ����������Ӹ�Ϊ�滻ѡ������
(delete-selection-mode t)


; ����ƥ��
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode) ;; ���һ�����ӵ�emacs-lisp...

(defun close-C-z()
  (interactive)
  (message "deepinsʹ�ÿ��� ��ʱ�ر�"))
(global-set-key (kbd "C-z") 'close-C-z)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;��������
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
(setq org-src-fontify-natively t) ;;�����ı�����
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


;; ���ļ����µ���������ʹ�����ģʽ
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
