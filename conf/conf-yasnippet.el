(setq yas/snippet-dirs "~/.emacs.d/repos/yasnippet/snippets")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/repos/yasnippet/snippets")
(setq yas/fallback-behavior 'return-nil)
(setq yas/prompt-functions '(yas/dropdown-prompt))

;;-----------------------------------------------------------------------------------;;
;;override dropdown-list to replace keybind
;;-----------------------------------------------------------------------------------;;
(defun dropdown-list (candidates)
  (let ((selection)
        (temp-buffer))
    (save-window-excursion
      (unwind-protect
          (let ((candidate-count (length candidates))
                done key (selidx 0))
            (while (not done)
              (unless (dropdown-list-at-point candidates selidx)
                (switch-to-buffer (setq temp-buffer (get-buffer-create "*selection*"))
                                  'norecord)
                (delete-other-windows)
                (delete-region (point-min) (point-max))
                (insert (make-string (length candidates) ?\n))
                (goto-char (point-min))
                (dropdown-list-at-point candidates selidx))
              (setq key (read-key-sequence-vector ""))
              (cond ((and (>= (aref key 0) ?1)
                          (<= (aref key 0) (+ ?0 (min 9 candidate-count))))
                     (setq selection (- (aref key 0) ?1)
                           done      t))
                    ((member key `(,[?n] [?\M-n] [?\C-i]))
                     (setq selidx (mod (+ candidate-count (1- (or selidx 0)))
                                       candidate-count)))
                    ((member key `(,[?p] [?\M-p]))
                     (setq selidx (mod (1+ (or selidx -1)) candidate-count)))
                    ((member key `(,[?\C-m]))
                     (setq selection selidx
                           done      t))
                    (t (setq done t)))))
        (dropdown-list-hide)
        (and temp-buffer (kill-buffer temp-buffer)))
      selection)))
;;-----------------------------------------------------------------------------------;;


;;-----------------------------------------------------------------------------------;;
;; To avoid a collision between dropdown-list and col-highlight.el(vline.el)
;;-----------------------------------------------------------------------------------;;
(if (featurep 'col-highlight)
       (progn (defadvice dropdown-list (around col-highlight-disable-when-execute-dropdown)
                (progn (toggle-highlight-column-when-idle 0)
                       ad-do-it
                       (toggle-highlight-column-when-idle 1))))
         (ad-activate 'dropdown-list))
;;-----------------------------------------------------------------------------------;;