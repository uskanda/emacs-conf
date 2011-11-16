;;TODO:背景色対応
;;----------------------------------------------------------------------------;;
;; col-highlight Settings
;; 現在列も目立たせる.
;;----------------------------------------------------------------------------;;
(require 'col-highlight)
(column-highlight-mode 0)
(toggle-highlight-column-when-idle 1)
(col-highlight-set-interval 0.3)
(custom-set-faces
 '(col-highlight ((t (:background "gray14")))))
;;----------------------------------------------------------------------------;;
