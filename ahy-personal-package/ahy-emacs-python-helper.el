;; Tags related stuff
(defun generate-python-tags-under-dir-append (path)
  "Generate tag tables under current directory(Linux)."
  (shell-command
   (format "find %s -type f -regextype posix-extended -regex \".*\.(py)\" | xargs etags --append" path)))
