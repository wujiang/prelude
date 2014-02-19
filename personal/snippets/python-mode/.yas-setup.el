(defun python-split-args (arg-string)
  "Split a python argument string into ((name, default)..) tuples"
  (mapcar '(lambda (x)
             (split-string x "[[:blank:]]*=[[:blank:]]*" t))
          (split-string arg-string "[[:blank:]]*,[[:blank:]]*" t)))

(defun python-args-to-docstring ()
  "Return docstring format for the python arguments in yas-text"
  (let* ((indent (concat "\n" (make-string (current-column) 32)))
         (args (python-split-args yas-text))
         (formatted-args (mapconcat
                          '(lambda (x)
                             (concat ":param " (nth 0 x) ":"
                                     (if (nth 1 x) (concat " \(default " (nth 1 x) "\)"))))
                          args
                          indent)))
    (unless (string= formatted-args "")
      (mapconcat 'identity (list formatted-args) indent))))

(defun python-args-self ()
  "Add args to self"
  (let* ((indent (concat "\n" (make-string (current-column) 32)))
         (args (python-split-args yas-text))
         (formatted-args (mapconcat
                          '(lambda (x)
                             (concat "self." (nth 0 x) " = " (nth 0 x)))
                          args
                          indent)))
    (unless (string= formatted-args "")
      (mapconcat 'identity (list formatted-args) indent))))
