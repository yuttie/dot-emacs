(require 'company-simple-complete)
(add-hook 'company-mode-hook
          (lambda ()
            ;; Reset to the default values
            (setq company-auto-complete nil)
            (setq company-auto-complete-chars '(?\  ?\) ?.))
            ;; Don't use previewer because this elisp does it!
            (setq company-frontends
                  '(company-pseudo-tooltip-unless-just-one-frontend
                    company-echo-metadata-frontend))
            ;; Rebind keys
            (define-key company-active-map (kbd "C-n") #'company-simple-complete-next)
            (define-key company-active-map (kbd "C-p") #'company-simple-complete-previous)))
