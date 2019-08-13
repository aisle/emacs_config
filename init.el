;;;; emacs config file
;;;; author: anhongyu@jd.com

;;; Customize the appearance
(setq inhibit-startup-screen t)
(setq column-number-mode t)
(setq default-fill-column 80)
;; Makes *scratch* empty.
;; (setq initial-scratch-message "")
;; Load monokai theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)

;;; Customize the behavior
(setq-default c-basic-offset 4) ; set 4 spaces as indent
(setq-default indent-tabs-mode nil) ; disable tabs
(c-set-offset 'innamespace 0) ; disable indent in namespace keyword
; indent 2 times of basic offset in arglist
; (setq c-offsets-alist '((arglist-cont-nonempty . ++)
; 			(arglist-intro . ++)
; 			(arglist-close . ++)))
(add-hook 'before-save-hook 'delete-trailing-whitespace) ; clean up the whitespaces in the end of line
(setq default-major-mode 'text-mode)
(global-linum-mode 1) ; show line number
(setq backup-directory-alist `(("." . "/home/admin/anhongyu1/.saves")))
(electric-pair-mode 1) ; auto complete brackets
(setq compile-command "make -j 16") ; customize the default compile command
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

;;; Private Functions
(defun generate-tags ()
  "Generate tag tables under current directory(Linux)."
  (interactive)
  (shell-command "find ./ -type f -regextype posix-extended -regex \".*\.(c|h|cc|cpp|hpp)\" | xargs etags"))

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))
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
