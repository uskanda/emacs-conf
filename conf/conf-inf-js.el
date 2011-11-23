(if (executable-find "rhino")
    (progn
      (autoload 'run-js "inf-js" nil t)
      (autoload 'inf-js-keys "inf-js" nil)
      (add-hook 'js2-mode-hook '(lambda () (inf-js-keys))))
    (message "inf-js requires external program Rhino. Emacs could not find rhino, inf-js will turn off"))
