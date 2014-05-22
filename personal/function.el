
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
