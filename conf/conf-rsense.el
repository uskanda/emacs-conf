(setenv "RSENSE_HOME" (concat (getenv "HOME") "/" ".emacs.d/repos/rsense"))
(setq rsense-home (getenv "RSENSE_HOME"))
;(setq rsense-home (expand-file-name "~/.emacs.d/repos/rsense"))
(require 'rsense)

(setq rsense-rurema-home "~/.emacs.d/repos/rsense/refm")

(setq rsense-rurema-refe "refe-1_9_2 -e UTF-8")


;; (ac-define-source rsense
;;   '((candidates . ac-rsense-candidates)
;;    (prefix . "\\(?:\\.\\|::\\)\\(.*\\)")
;;    (requires . 0)
;;    (document . ac-rsense-documentation)
;;    (cache)))

(add-hook 'ruby-mode-hook
         (lambda ()
           (setq ac-sources (append '(ac-source-rsense) ac-sources))))