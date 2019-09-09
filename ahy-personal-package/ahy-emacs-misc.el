;;; Customize the appearance
(setq inhibit-startup-screen t)
(setq column-number-mode t)
(setq default-fill-column 80)
(menu-bar-mode -1)
(global-linum-mode 1) ; show line number

;;; Customize the behavior
(setq default-major-mode 'text-mode)
(setq backup-directory-alist `(("." . ,emacs-backup-directory)))
(electric-pair-mode 1) ; auto complete brackets
(show-paren-mode t) ; Highlight matching brackets

;; enable ido mode
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-everywhere t)
(ido-mode 1)

;; enable recentf-mode
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)

;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)

;; make the next line smooth
(setq scroll-step 1)
(setq scroll-conservatively 10000)
