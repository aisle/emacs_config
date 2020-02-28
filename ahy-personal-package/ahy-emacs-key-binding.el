(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-x C-b") 'buffer-menu) ; bind C-x C-b to buffer-menu, rather than list-buffers
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "C-x j")   'ff-get-other-file)
(global-set-key (kbd "C-c C-c") 'eval-buffer)
(global-set-key (kbd "C-c f")   'find-name-dired)
(global-set-key (kbd "C-c g")   'find-usage)
(global-set-key (kbd "C-c h")   'highlight-symbol)
(global-set-key (kbd "C-c n")   'highlight-symbol-next)
(global-set-key (kbd "C-c p")   'highlight-symbol-prev)
(global-set-key (kbd "C-c l")   'cpp-helper-log)

(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "M-?") 'etags-select-find-tag-at-point)
(global-set-key (kbd "M-.") 'etags-select-find-tag)

(global-set-key (kbd "C-c <up>")    'buf-move-up)
(global-set-key (kbd "C-c <down>")  'buf-move-down)
(global-set-key (kbd "C-c <left>")  'buf-move-left)
(global-set-key (kbd "C-c <right>") 'buf-move-right)

(global-set-key [f1] '(lambda () (interactive) (dired default-directory)))

(global-set-key [f5] 'recompile)
(global-set-key [f6] 'kill-compilation)
(global-set-key [f7] 'whitespace-mode)
(global-set-key [f8] 'make-test)

(global-set-key [f9]  'eval-buffer)
(global-set-key [f10] 'shift-left-current-line-or-region-to-beginning)
(global-set-key [f11] 'shift-left-current-line-or-region)
(global-set-key [f12] 'shift-right-current-line-or-region)
