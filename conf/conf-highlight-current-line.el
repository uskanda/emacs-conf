;;TODO:背景色対応
;;----------------------------------------------------------------------------;;
;; hl-line Settings
;; 現在行を目立たせる．
;;----------------------------------------------------------------------------;;
(require 'hl-line)
(global-hl-line-mode)
(hl-line-mode 1)
(defface my-hl-line-face 
  '((((class color) (background dark))  ; カラーかつ, 背景が dark ならば,
     (:background "gray14" t))   ; 背景を黒に.
    ;(((class color) (background light)) ; カラーかつ, 背景が light ならば,
    ; (:background "Medium Aquamarine" t))     ; 背景を ForestGreen に.
    (t (:bold t)))
  "hl-line's my face" :group 'my-faces)
(setq hl-line-face 'my-hl-line-face)
;;----------------------------------------------------------------------------;;

