(add-hook 'ess-mode-hook
          (lambda ()
            (require 'ess-site)
            (ess-toggle-underscore nil)))
