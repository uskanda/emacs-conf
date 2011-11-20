;;----------------------------------------------------------------------------;;
;; skeleton settings
;; 対応する括弧を自動挿入する。
;;----------------------------------------------------------------------------;;
(require 'skeleton)
(setq skeleton-pair-on-word t)
(setq skeleton-pair t)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)
(global-set-key "`" 'skeleton-pair-insert-maybe)
(global-set-key "\"" 'skeleton-pair-insert-maybe)

(add-hook 'c-mode-common-hook
          #'(lambda ()
(local-set-key "(" 'skeleton-pair-insert-maybe)
(local-set-key "[" 'skeleton-pair-insert-maybe)
(local-set-key "{" 'skeleton-pair-insert-maybe)
(local-set-key "`" 'skeleton-pair-insert-maybe)
(local-set-key "\"" 'skeleton-pair-insert-maybe)))
;;----------------------------------------------------------------------------;;