;;----------------------------------------------------------------------------;;
;; popwin settings
;;----------------------------------------------------------------------------;;
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(push '("*Backtrace*" :noselect t) popwin:special-display-config)
(eval-after-load "anything"
  '(progn
    (setq anything-samewindow nil)
    (push '("*anything*" :height 20) popwin:special-display-config)))
(eval-after-load "anything-project" '(push '("*project files in file cache*" :height 20) popwin:special-display-config))
(eval-after-load "js-inf"
    (push '("*javascript*" :height 10) popwin:special-display-config))
;;----------------------------------------------------------------------------;;