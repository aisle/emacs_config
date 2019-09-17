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
(add-hook 'prog-mode-hook 'fci-mode)
