;;----------------------------------------------------------------------------;;
;; which-func Setting
;; 現在どの関数/メソッドにカーソルがあるのか表示する。
;;----------------------------------------------------------------------------;;
(require 'which-func)
; java-mode と javascript-mode でも which-func を使う
(setq which-func-modes (append which-func-modes '(java-mode javascript-mode)))
(which-func-mode t)
;;----------------------------------------------------------------------------;;
