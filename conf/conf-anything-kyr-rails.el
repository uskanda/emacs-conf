(eval-after-load "anything-kyr-config"
'(add-to-list 'anything-kyr-commands-by-condition
             '((and (boundp 'rinari-minor-mode) rinari-minor-mode)
               rinari-find-by-context rinari-rgrep rinari-rake rinari-console rinari-web-server rinari-extract-partial rinari-goto-partial rinari-find-model rinari-find-controller rinari-find-view rinari-find-rspec rinari-find-migration rinari-find-application rinari-find-fixture rinari-find-helper rinari-find-sass )))