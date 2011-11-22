

;;----------------------------------------------------------------------------;;
;; Ruby Mode Settings
;;----------------------------------------------------------------------------;;
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)
;;----------------------------------------------------------------------------;;


;;rdoc-mode, ruby-style, rubydb3xは未使用