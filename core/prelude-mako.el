(require 'mmm-mako)
(require 'sgml-mode)

(setq sgml-basic-offset 4)

(add-to-list 'auto-mode-alist '("\\.mako\\'" . sgml-mode))
(mmm-add-mode-ext-class 'sgml-mode "\\.mako\\'" 'mako)

;; keep the whitespace decent all the time (in this buffer)
(add-hook 'before-save-hook 'whitespace-cleanup nil t)

(provide 'prelude-mako)
