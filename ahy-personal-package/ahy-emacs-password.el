(setq ahy-special-char-set "!@#$%^&*()")

(defun ahy-find-a-char-in-string (str c)
  "Find a char in given string, return index. If not found, return -1."
  (let ((idx 0)
        (found-flag nil)
        (length (string-width str)))
    (while (and (< idx length) (not found-flag))
      (if (equal (aref str idx) c)
          (setq found-flag t)
        (setq idx (1+ idx))))
    (if (>= idx length)
        (setq idx -1))
    idx))

(defun ahy-shift-a-char (password-char)
  "Shift a char as my password rule"
  (setq ret password-char)
  (if (or (and (>= password-char ?A) (<= password-char ?Z))
          (and (>= password-char ?a) (<= password-char ?z))
          ;; 48 ~ 57 for number digit
          (and (>= password-char 48) (<= password-char 57)))
      (setq ret (+ password-char 1)))
  (let ((index -1)
        (length (string-width ahy-special-char-set))
        (index (ahy-find-a-char-in-string ahy-special-char-set password-char)))
    (if (and (> index -1) (< index length))
        (let ((i (% (1+ index) length)))
          (setq ret (aref ahy-special-char-set i)))))
  ret)

(defun ahy-generate-password (initial-password)
  "Generate one password with given initial one"
  (setq new-password (make-string (string-width initial-password) ?x))
  (let ((idx 0)
        (length (string-width initial-password)))
    (while (< idx length)
      (aset new-password idx (ahy-shift-a-char (aref initial-password idx)))
      (setq idx (1+ idx))))
  new-password)

(defun ahy-generate-passwords (initial-password num)
  "Generate a series of passwords with given initial one and number"
  (let ((new-password initial-password)
        (count 0)
        (password-list (list)))
    (while (< count num)
      (setq new-password (ahy-generate-password new-password))
      (setq password-list (cons new-password password-list))
      (setq count (1+ count)))
    password-list))
