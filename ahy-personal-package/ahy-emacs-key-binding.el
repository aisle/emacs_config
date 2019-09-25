(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-x C-b")       'buffer-menu) ; bind C-x C-b to buffer-menu, rather than list-buffers
(global-set-key (kbd "C-x C-r")       'recentf-open-files)
(global-set-key (kbd "C-x j")         'ff-get-other-file)
(global-set-key (kbd "C-c f")         'find-usage)
(global-set-key (kbd "C-c h")         'highlight-symbol)
(global-set-key (kbd "C-c n")         'highlight-symbol-next)
(global-set-key (kbd "C-c p")         'highlight-symbol-prev)
(global-set-key (kbd "C-c l")         'cpp-helper-log)
(global-set-key (kbd "C-c <left>")    'shift-left-current-line)
(global-set-key (kbd "C-c <C-left>")  'shift-left-current-line)
(global-set-key (kbd "C-c <right>")   'shift-right-current-line)
(global-set-key (kbd "C-c <C-right>") 'shift-right-current-line)

(global-set-key (kbd "M-;")           'comment-or-uncomment-region-or-line)
(global-set-key (kbd "M-?")           'etags-select-find-tag-at-point)
(global-set-key (kbd "M-.")           'etags-select-find-tag)

(global-set-key [f1] '(lambda () (interactive) (dired default-directory)))

(global-set-key [f5] 'recompile)
(global-set-key [f6] 'kill-compilation)
(global-set-key [f7] 'make-clean)
(global-set-key [f8] 'make-test)

(global-set-key [f9] 'eval-buffer)
