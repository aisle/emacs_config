;; Add plugin paths
(add-to-list 'load-path
             (concat emacs-config-root "manual-packages"))
(add-to-list 'load-path
             (concat emacs-config-root "manual-packages/auto-complete-master"))
(add-to-list 'load-path
             (concat emacs-config-root "manual-packages/fuzzy-el-master"))
(add-to-list 'load-path
             (concat emacs-config-root "manual-packages/highlight-parentheses.el-master"))
(add-to-list 'load-path
             (concat emacs-config-root "manual-packages/popup-el-master"))

;; Auto complete config
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             (concat emacs-config-root "manual-packages/auto-complete-master/dict"))
(ac-config-default)

;; Enable unbound plugin, to check available key combinations
;; Usage: M-x describe-unbound-keys
(require 'unbound)

;; Enable protobuf-mode
(require 'protobuf-mode)

;; Enable highlight-symbol
(require 'highlight-symbol)
(add-hook 'prog-mode-hook 'highlight-symbol-mode)

;; Enable highlight-parentheses-mode with elisp major mode
(require 'highlight-parentheses)
(add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)

;; Enable etags-select
(require 'etags-select)

;; Enable Undo tree mode
(require 'undo-tree)
(global-undo-tree-mode)

;; Enable buffer-move
(require 'buffer-move)

;; sr-speedbar
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)

;; Load monokai theme
(add-to-list 'custom-theme-load-path (concat emacs-config-root "themes/"))
(load-theme 'monokai t)

;; Customize dired mode
(put 'dired-find-alternate-file 'disabled nil)
(require 'dired )
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file "..")))

;; Enable fci mode
(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq fci-rule-color "red")
(setq-default fci-rule-column 120)
(setq fci-handle-truncate-lines nil)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)
(defun auto-fci-mode (&optional unused)
  (if (> (window-width) fci-rule-column)
      (fci-mode 1)
    (fci-mode 0))
  )
(add-hook 'prog-mode-hook 'auto-fci-mode)
(add-hook 'after-change-major-mode-hook 'auto-fci-mode)
(add-hook 'window-configuration-change-hook 'auto-fci-mode)

;; Solve the conflicts between fci and auto-complete
(defun sanityinc/fci-enabled-p () (symbol-value 'fci-mode))
(defvar sanityinc/fci-mode-suppressed nil)
(make-variable-buffer-local 'sanityinc/fci-mode-suppressed)
(defadvice popup-create (before suppress-fci-mode activate)
  "Suspend fci-mode while popups are visible"
  (let ((fci-enabled (sanityinc/fci-enabled-p)))
    (when fci-enabled
      (setq sanityinc/fci-mode-suppressed fci-enabled)
      (turn-off-fci-mode))))
(defadvice popup-delete (after restore-fci-mode activate)
  "Restore fci-mode when all popups have closed"
  (when (and sanityinc/fci-mode-suppressed
             (null popup-instances))
    (setq sanityinc/fci-mode-suppressed nil)
    (turn-on-fci-mode)))
