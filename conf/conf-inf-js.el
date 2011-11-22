(autoload 'run-js "inf-js" nil t)
(autoload 'inf-js-keys "inf-js" nil)
(add-hook 'js2-mode-hook '(lambda () (inf-js-keys)))