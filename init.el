;;;; emacs config file
;;;; author: anhongyu@jd.com

(setq emacs-config-root "~/.emacs.d/")
(setq emacs-backup-directory "/home/admin/anhongyu1/.saves")

(load-file (concat emacs-config-root "ahy-personal-package/ahy-emacs-cpp-coding-style.el"))
(load-file (concat emacs-config-root "ahy-personal-package/ahy-emacs-cpp-helper.el"))
(load-file (concat emacs-config-root "ahy-personal-package/ahy-emacs-key-binding.el"))
(load-file (concat emacs-config-root "ahy-personal-package/ahy-emacs-plugins-manager.el"))
(load-file (concat emacs-config-root "ahy-personal-package/ahy-emacs-misc.el"))

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
