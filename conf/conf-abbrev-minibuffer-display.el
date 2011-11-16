;;----------------------------------------------------------------------------;;
;; マイナーモード表示の省略
;;----------------------------------------------------------------------------;;
(require 'diminish)
;(diminish 'font-lock-mode)
(diminish 'abbrev-mode)
(add-hook 'lisp-interaction-mode-hook
          '(lambda ()
             (setq mode-name "Lisp-Int")))
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (setq mode-name "Elisp")))
;;(eval-after-load "filladapt" '(diminish 'filladapt-mode))
;;----------------------------------------------------------------------------;;
