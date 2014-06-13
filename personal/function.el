
(defun s-inflection-cycle ()
  "Cycle between CamelCase and snake_case"
  (interactive)
  (insert
   (cond
    ((s-capitalized? (current-word))
     (s-snake-case (current-word)))
    ((s-contains? "_" (current-word))
     (s-upper-camel-case (current-word)))
    (t (current-word)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm
;;;;;;;
(defun project-search (targets)
  "do a recursive helm grep on directories"
  (helm-do-grep-1 targets
                  '(4)
                  nil
                  '("*")))

(defun minus-core-project-search ()
  "recursive grep under minus_core"
  (interactive)
  (project-search '("/home/wjiang/minus/minus_core")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun smart-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring.
      Ease of use features:
      - Move to start of next line.
      - Appends the copy on sequential calls.
      - Use newline as last char even on the last line of the buffer.
      - If region is active, copy its lines."
  (interactive "p")
  (let ((beg (line-beginning-position))
        (end (line-end-position arg)))
    (when mark-active
      (if (> (point) (mark))
          (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
        (setq end (save-excursion (goto-char (mark)) (line-end-position)))))
    (if (eq last-command 'copy-line)
        (kill-append (buffer-substring beg end) (< end beg))
      (kill-ring-save beg end)))
  (kill-append "\n" nil)
  (beginning-of-line (or (and arg (1+ arg)) 2))
  (if (and arg (not (= 1 arg))) (message "%d lines copied" arg)))

