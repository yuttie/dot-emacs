(add-hook 'after-init-hook #'global-company-mode)

(setq company-idle-delay 0)
(setq company-frontends '(company-pseudo-tooltip-unless-just-one-frontend company-preview-frontend company-echo-metadata-frontend))

(add-hook 'company-mode-hook
          (lambda ()
            (define-key company-active-map (kbd "C-n") #'company-select-next)
            (define-key company-active-map (kbd "C-p") #'company-select-previous)
            (define-key company-active-map (kbd "C-d") #'company-show-doc-buffer)))
