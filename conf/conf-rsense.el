(setenv "RSENSE_HOME" (concat (getenv "HOME") "/" ".emacs.d/ext/rsense"))
(setq rsense-home (getenv "RSENSE_HOME"))
;(setq rsense-home (expand-file-name "~/.emacs.d/repos/rsense"))
(require 'rsense)

(setq rsense-rurema-home "~/.emacs.d/ext/rsense/refm")
(setq rsense-rurema-refe "refe-1_9_2 -e UTF-8")

(require 'ac-rsense-yas-expand)
(add-hook 'ruby-mode-hook
         (lambda ()
           (setq ac-sources (append '(ac-source-rsense-yas) ac-sources))))