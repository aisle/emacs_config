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
  (generate-cpp-tags-under-dir-append (concat PROJECT-root "/" (car PROJECT-src-dirs)))
  (setq PROJECT-src-dirs (cdr PROJECT-src-dirs)))

;; load TAGS
(visit-tags-table (concat PROJECT-root "/" "TAGS"))

(setq compile-command (format "cd %s && make -j 4" PROJECT-root))
(setq test-command (format "cd %s && make test" PROJECT-root))
(setq clean-command (format "cd %s && make clean" PROJECT-root))

(message "Initial Job for PROJECT, done.")
