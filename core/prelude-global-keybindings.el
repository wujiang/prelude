;;; prelude-global-keybindings.el --- Emacs Prelude: some useful keybindings.
;;
;; Copyright (c) 2011 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Lots of useful keybindings.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;; use anything to select buffer
(global-set-key (kbd "C-x b") 'helm-mini)

;; key modification
;; replace Alt-x
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "C-c C-m") 'smex)
;; make it as same as unix shell
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-whole-line)
(global-set-key (kbd "C-c C-r") 'replace-regexp)


;; occur
(global-set-key (kbd "C-x C-o") 'occur)
(global-set-key (kbd "C-c C-o") 'occur)

;; You know, like Readline.
;; (global-set-key (kbd "C-M-h") 'backward-kill-word)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; File finding
(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)

;; Window switching. (C-o goes to the next window)
;; C-o was for new line before.
;; (global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "C-o") 'next-multiframe-window)
(global-set-key (kbd "C-S-O") 'previous-multiframe-window)
;; Window switching. (C-x o goes to the next window)
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1))) ;; back one

;; Indentation help
(global-set-key (kbd "C-^") 'prelude-top-join-line)

;; Start proced in a similar manner to dired
(global-set-key (kbd "C-x p") 'proced)

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; Start a regular shell if you prefer that.
(global-set-key (kbd "C-x M-m") 'shell)

;; If you want to be able to M-x without meta
;; (global-set-key (kbd "C-x C-m") 'execute-extended-command)

;; A complementary binding to the apropos-command(C-h a)
(global-set-key (kbd "C-h A") 'apropos)

;; kill lines backward
(global-set-key (kbd "C-<backspace>") (lambda ()
                                        (interactive)
                                        (kill-line 0)
                                        (indent-according-to-mode)))

(global-set-key [remap kill-whole-line] 'prelude-kill-whole-line)

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp
                 isearch-string
               (regexp-quote isearch-string))))))

;; cycle through buffers
;; (global-set-key (kbd "<C-tab>") 'bury-buffer)
(global-set-key (kbd "<f1>") 'switch-to-next-buffer)
(global-set-key (kbd "<f2>") 'switch-to-prev-buffer)
(when window-system
  (global-set-key (kbd "<C-tab>") 'switch-to-next-buffer))

;; use hippie-expand instead of dabbrev
(global-set-key (kbd "M-/") 'hippie-expand)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

(unless (fboundp 'toggle-frame-fullscreen)
  (global-set-key (kbd "<f11>") 'prelude-fullscreen))

;; toggle menu-bar visibility
(global-set-key (kbd "<f12>") 'menu-bar-mode)

;; real Emacs hackers don't use the arrow keys
;; (global-unset-key [up])
;; (global-unset-key [down])
;; (global-unset-key [left])
;; (global-unset-key [right])

;; use M-f and M-b instead
;; (global-unset-key [M-left])
;; (global-unset-key [M-right])

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "C-=") 'er/expand-region)

;; make C-x C-x usable with transient-mark-mode
(define-key global-map
  [remap exchange-point-and-mark]
  'prelude-exchange-point-and-mark)

(global-set-key (kbd "C-c j") 'ace-jump-mode)
(global-set-key (kbd "s-.") 'ace-jump-mode)
(global-set-key (kbd "C-c J") 'ace-jump-buffer)
(global-set-key (kbd "s->") 'ace-jump-buffer)

(global-set-key [remap other-window] 'ace-window)

(provide 'prelude-global-keybindings)

(require 'prelude-functions)
(global-set-key (kbd "C-q") 'insert-ipdb-trace)
(global-set-key (kbd "C-c y")
                'comment-uncomment-duplicate-line)
(global-set-key (kbd "C-c v")
                (lambda ()
                  (interactive)
                  (comment-uncomment-duplicate-line t)))

;; comment-or-uncomment-region
(global-set-key (kbd "<f3>") 'comment-or-uncomment-region)
;;; prelude-global-keybindings.el ends here

;; clean buffers
(global-set-key (kbd "<f5>") 'kill-other-buffers)

;; insert delimiter
(global-set-key (kbd "<f6>")
                (lambda ()
                  (interactive)
                  (insert-delimiter "=")))

(global-set-key (kbd "C-x F") 'prelude-sudo-edit)

