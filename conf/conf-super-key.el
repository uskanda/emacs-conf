
;; for rinari
(if (featurep 'rinari)
    (add-hook 'rinari-minor-mode-hook
          '(lambda ()
             (define-key rinari-minor-mode-map [(super c) ] 'rinari-find-controller)
             (define-key rinari-minor-mode-map [(super v) ] 'rinari-find-view)
             (define-key rinari-minor-mode-map [(super m) ] 'rinari-find-model)
             (define-key rinari-minor-mode-map [(super r) ] 'rinari-find-rspec)
             (define-key rinari-minor-mode-map [(super d) ] 'rinari-find-migration)
             (define-key rinari-minor-mode-map [(super h) ] 'rinari-find-helper)
             (define-key rinari-minor-mode-map [(super a) ] 'rinari-find-application)
             (define-key rinari-minor-mode-map [(super p) ] 'rinari-goto-partial)
             )))