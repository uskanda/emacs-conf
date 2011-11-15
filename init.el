;;load-path configuration
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
           (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))
(add-to-load-path "~/.emacs.d/included" "~/.emacs.d/conf" "~/.emacs.d/installed" "~/.emacs.d/")

;;設定ファイルを読み込む
;;外したい設定は該当する行をコメントアウトすればよい
(setq conf-files '(
auto-save-buffers ;ファイルに更新があった瞬間にセーブする
))

;Load Settings
(defun load-each-settings (lisp-names)
  (mapc (lambda (x)(load (concat "conf-" (symbol-name x)))) lisp-names))
(load-each-settings conf-files)
