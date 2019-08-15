(defun generate-cpp-tags ()
  "Generate tag tables under current directory(Linux)."
  (interactive)
  (shell-command "find ./ -type f -regextype posix-extended -regex \".*\.(c|h|cc|cpp|hpp)\" | xargs etags"))

(defun generate-cpp-tags-under-dir-append (path)
  "Generate tag tables under current directory(Linux)."
  (shell-command (format "find %s -type f -regextype posix-extended -regex \".*\.(c|h|cc|cpp|hpp)\" | xargs etags --append" path)))

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))
