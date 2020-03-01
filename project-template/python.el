;; Usage:
;; Step1: Replace "P-R-O-J-E-C-T" with the specified name
;; Step2: Specify root path
;; Step3: Specify src dirs needs to generate tags
;; Step4: Specify compile, test & clean commands

;; Customize some variables
(setq PROJECT-root "<PROJECT-root-path>")
(setq PROJECT-src-dirs
      '("src dir1"
        "src dir2"))

(cd PROJECT-root)
(shell-command (format "/bin/rm -f %s/TAGS && touch %s/TAGS" PROJECT-root PROJECT-root))

;; generate TAGS
(while PROJECT-src-dirs
  (generate-python-tags-under-dir-append (concat PROJECT-root "/" (car PROJECT-src-dirs)))
  (setq PROJECT-src-dirs (cdr PROJECT-src-dirs)))

;; load TAGS
(visit-tags-table (concat PROJECT-root "/" "TAGS"))

(message "Initial Job for PROJECT, done.")
