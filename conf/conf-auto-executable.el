;;----------------------------------------------------------------------------;;
;; ファイルの先頭が"#!"のとき、 自動で chmod +x する。
;; スクリプト用。
;;----------------------------------------------------------------------------;;
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)
;;----------------------------------------------------------------------------;;