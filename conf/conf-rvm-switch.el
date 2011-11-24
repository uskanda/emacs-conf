(if (featurep 'rinari)
    (progn
      (defadvice rinari-web-server (before rvm-switch-rinari-web-server)
        (rvm-activate-corresponding-ruby))
      (ad-activate 'rinari-web-server)
      (defadvice rinari-console (before rvm-switch-rinari-console)
        (rvm-activate-corresponding-ruby))
      (ad-activate 'rinari-console)))

(if (featurep 'inf-ruby)
    (progn
      (defadvice run-ruby (before rvm-switch-run-ruby)
        (rvm-activate-corresponding-ruby))
      (ad-activate 'run-ruby)))