;; Tags related stuff
(defun generate-cpp-tags ()
  "Generate tag tables under current directory(Linux)."
  (interactive)
  (shell-command "find ./ -type f -regextype posix-extended -regex \".*\.(c|h|cc|cpp|hpp)\" | xargs etags"))

(defun generate-cpp-tags-under-dir-append (path)
  "Generate tag tables under current directory(Linux)."
  (shell-command (format "find %s -type f -regextype posix-extended -regex \".*\.(c|h|cc|cpp|hpp)\" | xargs etags --append" path)))

(defun find-usage (target-string)
  "grep current dir to find a specified string"
  (interactive "sTarget string: ")
  (shell-command (format "grep -rnI \"%s\" ./ --exclude=TAGS --exclude=*.d" target-string)))

;; Comments related stuff
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(add-hook 'c-mode-hook (lambda () (setq comment-start "//"
					comment-end   "")))

;; Compilation related stuff
(defun execute-compile-like-command (command)
  "Execute commands like *compile* or *recompile*"
  (let ((temp-compile-command compile-command))
    (compile command)
    (setq compile-command temp-compile-command)))

(defun make-test ()
  "Execute make test command or other customized test command"
  (interactive)
  (execute-compile-like-command test-command))

(defun make-clean ()
  "Execute make clean command or other customized clean command"
  (interactive)
  (execute-compile-like-command clean-command))

(setq compile-command "make -j 8") ; customize the default compile command
(setq clean-command "make clean") ; customize the default clean command
(setq test-command "make test") ; customize the default test command

(setq compilation-scroll-output t) ; Compilation output

;; Helper functions to quick typo
(defun cpp-helper-sleep ()
  "Help to print the c++11 style sleep clause"
  (interactive)
  (insert "std::this_thread::sleep_for(std::chrono::milliseconds(2000));"))

(defun cpp-helper-log ()
  "Help to print a log clause with special mark"
  (interactive)
  (insert "LOG(ERROR) << \"||= \";")
  (backward-char 2))