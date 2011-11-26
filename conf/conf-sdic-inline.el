(require 'sdic-inline)
(sdic-inline-mode t)   ; sdic-inline モードの起動
;; 辞書ファイルの設定
(setq sdic-inline-eiwa-dictionary "~/.emacs.d/ext/sdic/gene.sdic")
(setq sdic-inline-waei-dictionary "~/.emacs.d/ext/sdic/jedict.sdic")

(require 'sdic-inline-pos-tip)
(setq sdic-inline-search-func 'sdic-inline-search-word-with-stem)
(setq sdic-inline-display-func 'sdic-inline-pos-tip-show)
(define-key sdic-inline-map "\C-c\C-p" 'sdic-inline-pos-tip-show)