;;----------------------------------------------------------------------------;;
;;OFFにしたい機能は、行頭に;をつけてコメントアウトしてください
;;----------------------------------------------------------------------------;;
(setq conf-files '(       ;この行はコメントアウトしないでください
;;----------------------------------------------------------------------------;;
;; 基本設定
;;----------------------------------------------------------------------------;;
env                       ;利用中のOS、利用可能な機能を確認します。コメントアウトしないでください
keybind                   ;基礎的なキー操作を追加・変更
key-chord                 ;キーの同時押しで任意のコマンドを起動する
color-theme               ;文字色・背景色などの一括設定をする
highlight-current-line    ;現在行の背景色を変更する
highlight-current-column  ;現在列の背景色を変更する
auto-save-buffers         ;ファイルに更新があった瞬間にセーブする
which-func                ;ミニバッファ中に現在のカーソル位置がどの関数に含まれるか表示する
abbrev-minibuffer-display ;ミニバッファ中のマイナーモード表示を消す
uniquify                  ;同一名のバッファをフォルダ名で区別できるようにする
))                        ;この行はコメントアウトしないでください


;;----------------------------------------------------------------------------;;
;; Load Settings
;;----------------------------------------------------------------------------;;
;;load-path configuration
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
           (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))
(add-to-load-path "~/.emacs.d/included" "~/.emacs.d/conf" "~/.emacs.d/installed" "~/.emacs.d/")

;;Load
(defun load-each-settings (lisp-names)
  (mapc (lambda (x)(load (concat "conf-" (symbol-name x)))) lisp-names))
(load-each-settings conf-files)
;;----------------------------------------------------------------------------;;