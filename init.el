;;----------------------------------------------------------------------------;;
;; Load Settings
;;----------------------------------------------------------------------------;;
;;load-path configuration
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/conf")
(add-to-list 'load-path "~/.emacs.d/included")
(add-to-list 'load-path "~/.emacs.d/installed")
(add-to-list 'load-path "~/.emacs.d/development")
(load "conf.el")

;;Load
(defun load-each-settings (lisp-names)
  (mapc (lambda (x)(load (concat "conf-" (symbol-name x)))) lisp-names))
(load-each-settings conf-files)
;;----------------------------------------------------------------------------;;
