;;; init-personal-lisp.el --- My custom lisp

;;; Commentary:
;; Fairly self explanitory.  Install and use the interactive functions.

;;; Code:

(defun my-random-number (number)
  "Get a random number between 0 and ARG."
  (interactive "p")
  (setq randomnum (% (random t) number)) ;; Get the modulus (number) of (random number)
  (when (< randomnum 0)                  ;; If negative, invert it.
    (setq randomnum (* randomnum -1)))
  (* randomnum 1))

(defun my-insert-random-number (number)
  "Insert a random number between 0 and ARG."
  (interactive "p")
  (setq result (my-random-number number))
  (insert (format "%s" result)))

(defun my-random-item (list)
  "Returns a random item from a list"
  (setq listlength (length list))
  (setq randomnum (my-random-number listlength))
  (nth randomnum list))

(defun my-random-line (p1 p2)
  "Returns a random line from the selected region"
  (interactive "r") ;; r - point and mark as args
  (setq lines (split-string (buffer-substring p1 p2) "\n" t))
  (setq result (my-random-item lines))
  (message (format "%s" result)))

(defun my-random-task ()
  "Inserts a random task from ~/.orgfiles/tasks.org"
  ;;(find-file-noselect "~/.orgfiles/tasks.org")
  (find-file "*my-random-task-temp-buffer*")
  (insert-file-contents "~/.orgfiles/tasks.org")
  (goto-char (point-min))
  (forward-line)
  (let ((beg (point)))
        (goto-char (point-max))
        ;;(forward-line -1)
        (setq result (my-random-line beg (point))))
;;  (kill-buffer "*my-random-task-temp-buffer*")
)

(provide 'init-personal-lisp) ;;; init-personal-lisp.el ends here
