
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.




;;; dark-laptop-theme.el --- dark-laptop theme

;; Copyright (C) 2001 by Laurent Michel
;; Copyright (C) 2013 by Syohei YOSHIDA

;; Author: Syohei YOSHIDA <syohex@gmail.com>
;; URL: https://github.com/emacs-jp/replace-colorthemes
;; Version: 0.01

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Port of dark-laptop theme from `color-themes'

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(deftheme dark-laptop
  "dark-laptop theme")

(custom-theme-set-faces
 'dark-laptop

 '(default ((t (:background "black" :foreground "white"))))
 '(mouse ((t (:foreground "sienna1"))))
 '(cursor ((t (:background "yellow"))))
 '(border ((t (:foreground "black"))))

 '(gnus-mouse-face ((t (:background "darkolivegreen"))))
 '(list-matching-lines-face ((t (:bold t))))
 '(view-highlight-face ((t (:background "darkolivegreen"))))

 '(bold ((t (:bold t))))
 '(bold-italic ((t (:italic t :bold t))))
 '(custom-button-face ((t (nil))))
 '(custom-changed-face ((t (:background "blue" :foreground "white"))))
 '(custom-documentation-face ((t (nil))))
 '(custom-face-tag-face ((t (:underline t))))
 '(custom-group-tag-face ((t (:underline t :foreground "light blue"))))
 '(custom-group-tag-face-1 ((t (:underline t :foreground "pink"))))
 '(custom-invalid-face ((t (:background "red" :foreground "yellow"))))
 '(custom-modified-face ((t (:background "blue" :foreground "white"))))
 '(custom-rogue-face ((t (:background "black" :foreground "pink"))))
 '(custom-saved-face ((t (:underline t))))
 '(custom-set-face ((t (:background "white" :foreground "blue"))))
 '(custom-state-face ((t (:foreground "lime green"))))
 '(custom-variable-button-face ((t (:underline t :bold t))))
 '(custom-variable-tag-face ((t (:underline t :foreground "light blue"))))
 '(fl-comment-face ((t (:foreground "pink"))))
 '(fl-doc-string-face ((t (:foreground "purple"))))
 '(fl-function-name-face ((t (:foreground "red"))))
 '(fl-keyword-face ((t (:foreground "cyan"))))
 '(fl-string-face ((t (:foreground "green"))))
 '(fl-type-face ((t (:foreground "yellow"))))
 '(font-lock-builtin-face ((t (:foreground "LightSteelBlue"))))
 '(font-lock-comment-face ((t (:foreground "OrangeRed"))))
 '(font-lock-constant-face ((t (:foreground "Aquamarine"))))
 '(font-lock-doc-string-face ((t (:foreground "LightSalmon"))))
 '(font-lock-function-name-face ((t (:foreground "LightSkyBlue"))))
 '(font-lock-keyword-face ((t (:foreground "Cyan"))))
 '(font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
 '(font-lock-reference-face ((t (:foreground "LightSteelBlue"))))
 '(font-lock-string-face ((t (:foreground "LightSalmon"))))
 '(font-lock-type-face ((t (:foreground "PaleGreen"))))
 '(font-lock-variable-name-face ((t (:foreground "LightGoldenrod"))))
 '(font-lock-warning-face ((t (:bold t :foreground "Pink"))))
 '(gnus-cite-attribution-face ((t (:italic t))))
 '(gnus-cite-face-1 ((t (:bold t :foreground "deep sky blue"))))
 '(gnus-cite-face-10 ((t (:foreground "medium purple"))))
 '(gnus-cite-face-11 ((t (:foreground "turquoise"))))
 '(gnus-cite-face-2 ((t (:bold t :foreground "cyan"))))
 '(gnus-cite-face-3 ((t (:bold t :foreground "gold"))))
 '(gnus-cite-face-4 ((t (:foreground "light pink"))))
 '(gnus-cite-face-5 ((t (:foreground "pale green"))))
 '(gnus-cite-face-6 ((t (:bold t :foreground "chocolate"))))
 '(gnus-cite-face-7 ((t (:foreground "orange"))))
 '(gnus-cite-face-8 ((t (:foreground "magenta"))))
 '(gnus-cite-face-9 ((t (:foreground "violet"))))
 '(gnus-emphasis-bold ((t (:bold t))))
 '(gnus-emphasis-bold-italic ((t (:italic t :bold t))))
 '(gnus-emphasis-highlight-words ((t (:background "black" :foreground "yellow"))))
 '(gnus-emphasis-italic ((t (:italic t))))
 '(gnus-emphasis-underline ((t (:underline t))))
 '(gnus-emphasis-underline-bold ((t (:underline t :bold t))))
 '(gnus-emphasis-underline-bold-italic ((t (:underline t :italic t :bold t))))
 '(gnus-emphasis-underline-italic ((t (:underline t :italic t))))
 '(gnus-group-mail-1-empty-face ((t (:foreground "aquamarine1"))))
 '(gnus-group-mail-1-face ((t (:bold t :foreground "aquamarine1"))))
 '(gnus-group-mail-2-empty-face ((t (:foreground "aquamarine2"))))
 '(gnus-group-mail-2-face ((t (:bold t :foreground "aquamarine2"))))
 '(gnus-group-mail-3-empty-face ((t (:foreground "aquamarine3"))))
 '(gnus-group-mail-3-face ((t (:bold t :foreground "aquamarine3"))))
 '(gnus-group-mail-low-empty-face ((t (:foreground "aquamarine4"))))
 '(gnus-group-mail-low-face ((t (:bold t :foreground "aquamarine4"))))
 '(gnus-group-news-1-empty-face ((t (:foreground "PaleTurquoise"))))
 '(gnus-group-news-1-face ((t (:bold t :foreground "PaleTurquoise"))))
 '(gnus-group-news-2-empty-face ((t (:foreground "turquoise"))))
 '(gnus-group-news-2-face ((t (:bold t :foreground "turquoise"))))
 '(gnus-group-news-3-empty-face ((t (nil))))
 '(gnus-group-news-3-face ((t (:bold t))))
 '(gnus-group-news-4-empty-face ((t (nil))))
 '(gnus-group-news-4-face ((t (:bold t))))
 '(gnus-group-news-5-empty-face ((t (nil))))
 '(gnus-group-news-5-face ((t (:bold t))))
 '(gnus-group-news-6-empty-face ((t (nil))))
 '(gnus-group-news-6-face ((t (:bold t))))
 '(gnus-group-news-low-empty-face ((t (:foreground "DarkTurquoise"))))
 '(gnus-group-news-low-face ((t (:bold t :foreground "DarkTurquoise"))))
 '(gnus-header-content-face ((t (:italic t :foreground "forest green"))))
 '(gnus-header-from-face ((t (:bold t :foreground "spring green"))))
 '(gnus-header-name-face ((t (:foreground "deep sky blue"))))
 '(gnus-header-newsgroups-face ((t (:italic t :bold t :foreground "purple"))))
 '(gnus-header-subject-face ((t (:bold t :foreground "orange"))))
 '(gnus-signature-face ((t (:bold t :foreground "khaki"))))
 '(gnus-splash-face ((t (:foreground "Brown"))))
 '(gnus-summary-cancelled-face ((t (:background "black" :foreground "yellow"))))
 '(gnus-summary-high-ancient-face ((t (:bold t :foreground "SkyBlue"))))
 '(gnus-summary-high-read-face ((t (:bold t :foreground "PaleGreen"))))
 '(gnus-summary-high-ticked-face ((t (:bold t :foreground "pink"))))
 '(gnus-summary-high-unread-face ((t (:bold t))))
 '(gnus-summary-low-ancient-face ((t (:italic t :foreground "SkyBlue"))))
 '(gnus-summary-low-read-face ((t (:italic t :foreground "PaleGreen"))))
 '(gnus-summary-low-ticked-face ((t (:italic t :foreground "pink"))))
 '(gnus-summary-low-unread-face ((t (:italic t))))
 '(gnus-summary-normal-ancient-face ((t (:foreground "SkyBlue"))))
 '(gnus-summary-normal-read-face ((t (:foreground "PaleGreen"))))
 '(gnus-summary-normal-ticked-face ((t (:foreground "pink"))))
 '(gnus-summary-normal-unread-face ((t (nil))))
 '(gnus-summary-selected-face ((t (:underline t))))
 '(highlight ((t (:background "darkolivegreen"))))
 '(italic ((t (:italic t))))
 '(message-cited-text-face ((t (:bold t :foreground "red"))))
 '(message-header-cc-face ((t (:bold t :foreground "green4"))))
 '(message-header-name-face ((t (:bold t :foreground "orange"))))
 '(message-header-newsgroups-face ((t (:bold t :foreground "violet"))))
 '(message-header-other-face ((t (:bold t :foreground "chocolate"))))
 '(message-header-subject-face ((t (:bold t :foreground "yellow"))))
 '(message-header-to-face ((t (:bold t :foreground "cyan"))))
 '(message-header-xheader-face ((t (:bold t :foreground "light blue"))))
 '(message-mml-face ((t (:bold t :background "Green3"))))
 '(message-separator-face ((t (:foreground "blue3"))))
 '(modeline ((t (:background "white" :foreground "black"))))
 '(modeline-buffer-id ((t (:background "white" :foreground "black"))))
 '(modeline-mousable ((t (:background "white" :foreground "black"))))
 '(modeline-mousable-minor-mode ((t (:background "white" :foreground "black"))))
 '(region ((t (:background "blue"))))
 '(primary-selection ((t (:background "blue"))))
 '(isearch ((t (:background "blue"))))
 '(zmacs-region ((t (:background "blue"))))
 '(secondary-selection ((t (:background "darkslateblue"))))
 '(underline ((t (:underline t))))
 '(widget-button-face ((t (:bold t))))
 '(widget-button-pressed-face ((t (:foreground "red"))))
 '(widget-documentation-face ((t (:foreground "lime green"))))
 '(widget-field-face ((t (:background "dim gray"))))
 '(widget-inactive-face ((t (:foreground "light gray"))))
 '(widget-single-line-field-face ((t (:background "dim gray")))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'dark-laptop)







(package-initialize)

(tool-bar-mode -1)
;;取消工具栏 -1关闭 1和t开启

(scroll-bar-mode -1)
;;取消滚动条

(global-linum-mode t)
;;设置行号

(setq inhibit-splash-screen t)
;;取消首页

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )
(global-set-key (kbd "<f2>") 'open-my-init-file)
;;设置快捷键f2打开配置文件

(global-company-mode t)
;;配置company-mode子模式,自动补全

(setq-default cursor-type 'bar)
;;设置光标

(setq make-backup-files nil)
;;取消自动备份

(require 'org)
(setq org-src-fontify-natively t)
;;不晓得啥用

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;;配置打开文件列表快捷键

(delete-selection-mode t)
;;选中输入替换 系统默认不删除，在后面追加

;;(setq initial-frame-alist (quote ((fullscreen . maximized))))
;;设置全屏

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 括号自动配对

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "宋体" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))
;;下载的company自动引入的 ，设置宋体 wind下不设置会很卡

(setq load-path (cons "~/.emacs.d/site/org-9.1.13/lisp"
                    load-path))

(require 'org-install)
