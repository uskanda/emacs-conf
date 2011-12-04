;(setq yas/snippet-dirs "~/.emacs.d/repos/yasnippet/snippets")
(setq yas/snippet-dirs "~/.emacs.d/development/snippets")
(require 'yasnippet)
(yas/initialize)
;(yas/load-directory "~/.emacs.d/repos/yasnippet/snippets")
(yas/load-directory "~/.emacs.d/development/snippets")
(setq yas/fallback-behavior 'return-nil)
(setq yas/prompt-functions '(yas/dropdown-prompt))


;;-----------------------------------------------------------------------------------;;
;; To avoid a collision between dropdown-list and col-highlight.el(vline.el)
;;-----------------------------------------------------------------------------------;;
(if (featurep 'col-highlight)
       (progn (defadvice dropdown-list (around col-highlight-disable-when-execute-dropdown)
                (progn (toggle-highlight-column-when-idle 0)
                       ad-do-it
                       (toggle-highlight-column-when-idle 1)))
              (ad-activate 'dropdown-list)))
;;-----------------------------------------------------------------------------------;;