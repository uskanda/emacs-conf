;;----------------------------------------------------------------------------;;
;; リージョンがアクティブな時はバックスペースでリージョン削除
;;----------------------------------------------------------------------------;;
(defadvice backward-delete-char-untabify
  (around ys:backward-delete-region activate)
  (if (and transient-mark-mode mark-active)
      (delete-region (region-beginning) (region-end))
    ad-do-it))
;;----------------------------------------------------------------------------;;