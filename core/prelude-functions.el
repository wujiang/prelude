;; Function definitions
;;
;; Author: Wu Jiang <wujiang27@gmail.com>
;; Date: 03/24/2012
;;

;; Insert ipdb
(defun insert-ipdb-trace ()
  "Insert pdb trace at cursor point."
  (interactive)
  (end-of-line)
  (newline-and-indent)
  (insert "# DEBUG ONLY")
  (newline-and-indent)
  (insert "import ipdb; ipdb.set_trace()")
  (forward-line -1))

;; get the current line
(defun current-line ()
  "Get the current line"
  (buffer-substring-no-properties
   (line-beginning-position) (line-end-position)))

(defun select-current-line ()
  "Select the current line"
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position)))

 (defun comment-uncomment-duplicate-line (&optional comment)
   "comment/uncomment the line at point;
   if COMMENT is non-nil, comment/uncomment the original"
   (interactive)
   (select-current-line)
   (let ((str (buffer-substring (region-beginning) (region-end))))
     (when comment
     (comment-or-uncomment-region (region-beginning) (region-end)))
     (insert-string
       (concat (if (= 0 (forward-line 1)) "" "\n") str "\n"))
     (forward-line -1)))


;; Kill all buffers
(defun kill-other-buffers ()
  "kill all the other buffers"
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer)
                           (remove-if-not 'buffer-file-name (buffer-list)))))


(defun figlet-region (&optional b e)
  (interactive "r")
  (shell-command-on-region b e "figlet")
  (comment-region b e))


(provide 'prelude-functions)
