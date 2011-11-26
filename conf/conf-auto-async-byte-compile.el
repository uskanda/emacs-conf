(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/conf/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)