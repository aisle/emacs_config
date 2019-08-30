;;;; emacs config file
;;;; author: anhongyu@jd.com

(load-file "~/.emacs.d/ahy-personal-package/ahy-emacs-utils.el")

;;; Customize the appearance
(setq inhibit-startup-screen t)
(setq column-number-mode t)
(setq default-fill-column 80)
;; Load monokai theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)
;; Disable menu bar
(menu-bar-mode -1)
;; sr-speedbar
(add-to-list 'load-path
             "~/.emacs.d/manual-packages")
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)

;;; Customize the behavior
(setq-default c-basic-offset 4) ; set 4 spaces as indent
(setq-default indent-tabs-mode nil) ; disable tabs
(c-set-offset 'innamespace 0) ; disable indent in namespace keyword
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)) ; enter c++ mode for .h file
; indent 2 times of basic offset in arglist
; (setq c-offsets-alist '((arglist-cont-nonempty . ++)
; 			(arglist-intro . ++)
; 			(arglist-close . ++)))
(add-hook 'before-save-hook 'delete-trailing-whitespace) ; clean up the whitespaces in the end of line
(setq default-major-mode 'text-mode)
(global-linum-mode 1) ; show line number
(setq backup-directory-alist `(("." . "/home/admin/anhongyu1/.saves")))
(electric-pair-mode 1) ; auto complete brackets
(setq compile-command "make -j 8") ; customize the default compile command
(setq clean-command "make clean") ; customize the default clean command
(setq test-command "make test") ; customize the default test command

;; customize the c/c++ comment style
(add-hook 'c-mode-hook (lambda () (setq comment-start "//"
					comment-end   "")))
;; enable ido mode
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-everywhere t)
(ido-mode 1)

;; enable recentf-mode
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)
;; make the next line smooth
(setq scroll-step 1)
(setq scroll-conservatively 10000)
;; Compilation output
(setq compilation-scroll-output t)

;;; Key Binding
(global-set-key (kbd "RET") 'newline-and-indent) ; auto indent
;; (global-set-key (kbd "RET") 'reindent-then-newline-and-indent) ; auto indent
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x C-b") 'buffer-menu) ; bind C-x C-b to buffer-menu, rather than list-buffers

(global-set-key [f4] 'sr-speedbar-toggle)

(global-set-key [f5] 'recompile)
(global-set-key [f6] 'kill-compilation)
(global-set-key [f7] 'make-clean)
(global-set-key [f8] 'make-test)

(global-set-key [f9] 'eval-buffer)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("837f2d1e6038d05f29bbcc0dc39dbbc51e5c9a079e8ecd3b6ef09fc0b149ceb1" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Auto complete config
(add-to-list 'load-path "~/.emacs.d/manual-packages/auto-complete-master")
(add-to-list 'load-path "~/.emacs.d/manual-packages/popup-el-master")
(add-to-list 'load-path "~/.emacs.d/manual-packages/fuzzy-el-master")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/manual-packages/auto-complete-master/dict")
(ac-config-default)

;; Enable protobuf-mode
(add-to-list 'load-path "~/.emacs.d/manual-packages")
(require 'protobuf-mode)

;; Enable highlight-parentheses-mode with elisp major mode
(add-to-list 'load-path "~/.emacs.d/manual-packages/highlight-parentheses.el-master")
(require 'highlight-parentheses)
(add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)
;; Highlight matching brackets
(show-paren-mode t)

;; Enable etags-select
(load-file "~/.emacs.d/manual-packages/etags-select.el")
;;binding the key
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)

;; Enable Undo tree mode
(require 'undo-tree)
(global-undo-tree-mode)
