(defun use-google-coding-style ()
  "Switch google c/c++ coding style"
  (interactive)
  (add-to-list 'load-path
               "~/.emacs.d/coding-style")
  (require 'google-c-style)
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent))

(setq-default c-basic-offset 4) ; set 4 spaces as indent
(setq-default indent-tabs-mode nil) ; disable tabs
(c-set-offset 'innamespace 0) ; disable indent in namespace keyword
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)) ; enter c++ mode for .h file
; indent 2 times of basic offset in arglist
;; (setq c-offsets-alist '((arglist-cont-nonempty . ++)
;;                         (arglist-intro . ++)
;;                         (arglist-close . ++)))
(setq c-offsets-alist '((arglist-intro . ++)))
(add-hook 'before-save-hook 'delete-trailing-whitespace) ; clean up the whitespaces in the end of line
