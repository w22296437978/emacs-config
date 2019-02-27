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


(provide 'init-ui)
