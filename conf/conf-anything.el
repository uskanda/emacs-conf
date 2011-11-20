(require 'anything-config)

;;----------------------------------------------------------------------------;;
;;source変更時に先頭から表示されるようにする(デフォルトは中央)
;;----------------------------------------------------------------------------;;
(defadvice anything-move-selection (after screen-top activate)
  "Display at the top of window when moving selection to the prev/next source."
  (if (eq unit 'source)
      (save-selected-window
        (select-window (get-buffer-window anything-buffer 'visible))
        (set-window-start (selected-window)
                          (save-excursion (forward-line -1) (point))))))
;;----------------------------------------------------------------------------;

(require 'anything-kyr-config)

(load "anything-spotlight2")



(defcustom anything-c-source-mac-spotlight2-open-file-extensions
  '("pdf" "jpg" "gif" "psd" "ai" "png" "mpg" "avi" "mov")
  "List of file extensions to open by Mac OS X application."
  :type 'list
  :group 'anything-c-source-mac-spotlight2)

(defvar anything-c-source-mac-spotlight2
  '((name . "mdfind")
    (candidates
     . (lambda () (start-process "mdfind-process" nil "mdfind" anything-pattern)))
    (type . file)
    (requires-pattern . 3)
    (action . (lambda (candidate)
                (progn
		  (if (member (file-name-extension candidate) anything-c-source-mac-spotlight2-open-file-extensions)
		  (shell-command (concat "open " candidate))
                  (anything-c-find-file-or-marked candidate)))))
    (delayed))
  "Source for retrieving files via Spotlight's command line
utility mdfind.")


;TODO: OS分岐
(setq anything-sources (list anything-c-source-buffers
                             anything-c-source-files-in-current-dir
                             anything-c-source-recentf
                             anything-c-source-fixme
;                             anything-c-source-occur-by-moccur
			     anything-c-source-mac-spotlight2
                             anything-c-source-buffer-not-found
;                             anything-c-source-emacs-commands
;                             anything-c-source-refe2x
;                             anything-c-source-evernote-title
;                             anything-c-source-my-projects
;                             anything-c-source-projects-history
;                             anything-c-source-locate
;                             anything-c-source-google-suggest))
                             ))