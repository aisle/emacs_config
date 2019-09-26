(defun use-google-coding-style ()
  "Switch google c/c++ coding style"
  (interactive)
  (add-to-list 'load-path (concat emacs-config-root "coding-style"))
  (require 'google-c-style)
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent))

(setq-default c-basic-offset 4) ; set 4 spaces as indent
(setq-default indent-tabs-mode nil) ; disable tabs
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)) ; enter c++ mode for .h file
; indent 2 times of basic offset in arglist
;; (setq c-offsets-alist '((arglist-cont-nonempty . ++)
;;                         (arglist-intro . ++)
;;                         (arglist-close . ++)))
(setq c-offsets-alist '((innamespace . 0)
                        (arglist-intro . ++)))
(add-hook 'before-save-hook 'delete-trailing-whitespace) ; clean up the whitespaces in the end of line

(defun indent-rigidly-n (n)
  "Indent the region, or otherwise the current line, by N spaces."
  (let* ((use-region (and transient-mark-mode mark-active))
         (rstart (if use-region (region-beginning) (point-at-bol)))
         (rend   (if use-region (region-end)       (point-at-eol)))
         (deactivate-mark "irrelevant")) ; avoid deactivating mark
    (indent-rigidly rstart rend n)))

(defun shift-right-current-line-or-region ()
  "Shift right current line or region, by basic offset"
  (interactive)
  (indent-rigidly-n c-basic-offset))

(defun shift-left-current-line-or-region ()
  "Shift left current line or region, by basic offset"
  (interactive)
  (indent-rigidly-n (- c-basic-offset)))

(defun shift-left-current-line-or-region-to-beginning ()
  "Shift left current line or region, to the beginning"
  (interactive)
  (indent-rigidly-n -120))

(defadvice c-lineup-arglist (around my activate)
  "Improve indentation of continued C++11 lambda function opened as argument."
  (setq ad-return-value
        (if (and (equal major-mode 'c++-mode)
                 (ignore-errors
                   (save-excursion
                     (goto-char (c-langelem-pos langelem))
                     ;; Detect "[...](" or "[...]{". preceded by "," or "(",
                     ;;   and with unclosed brace.
                     (looking-at ".*[(,][ \t]*\\[[^]]*\\][ \t]*[({][^}]*$"))))
            0                           ; no additional indent
          ad-do-it)))                   ; default behavior
