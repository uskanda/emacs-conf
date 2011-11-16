;TODO:名称変更?
;;----------------------------------------------------------------------------;;
;; develock Settings : タブ、全角スペース、行末のスペースに色を付ける
;;; http://www.bookshelf.jp/soft/meadow_26.html#SEC313
;;; http://homepage1.nifty.com/blankspace/emacs/color.html
;;----------------------------------------------------------------------------;;
(require 'develock)
(if (featurep 'develock)  
    (progn
      (setq develock-max-column-plist
            (list 'java-mode  120
                  'jde-mode   120
                  'emacs-lisp-mode 120
                  'lisp-interaction-mode 120
                  'c++-mode 120
                  'html-mode  nil
                  'html-helper-mode nil
                  'cperl-mode 120
                  'perl-mode  120
                  'c-mode 120))
      (let ((elem (copy-sequence (assq 'message-mode develock-keywords-alist))))
        (setcar elem 'html-helper-mode)
        (setq develock-keywords-alist
              (cons elem (delq (assq 'html-helper-mode develock-keywords-alist)
                               develock-keywords-alist))))))

(defface my-face-r-1 '((t (:background "gray15"))) nil :group 'my-faces)
(defface my-face-b-1 '((t (:background "gray26"))) nil :group 'my-faces)
(defface my-face-b-2 '((t (:background "gray70"))) nil :group 'my-faces)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil :group 'my-faces)
(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     ;;("[\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

(defun toggle-colorful-space()
  "toggle while space font-lock"
  (interactive)
  (if my-face-b-1
      (progn
        (setq my-face-b-1 nil)
        (setq my-face-b-2 nil)
        (setq my-face-u-1 nil)
        (if (featurep 'develock)
            (develock-mode 0)))
    (progn
      (setq my-face-b-1 'my-face-b-1)
      (setq my-face-b-2 'my-face-b-2)
      (setq my-face-u-1 'my-face-u-1))))
;;----------------------------------------------------------------------------;;

