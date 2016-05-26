(add-hook 'after-init-hook #'global-company-mode)

(setq company-tooltip-align-annotations t)
(setq company-minimum-prefix-length 2)
(setq company-require-match nil)
(setq company-auto-complete 'company-explicit-action-p)
(setq company-auto-complete-chars (lambda (input) t))
(setq company-idle-delay 0.1)
(setq company-frontends
      '(company-pseudo-tooltip-unless-just-one-frontend
        company-preview-frontend
        company-echo-metadata-frontend))
(setq company-backends
      '(company-elisp
        company-bbdb
        company-nxml
        company-css
        company-eclim
        company-semantic
        company-clang
        company-xcode
        company-cmake
        (company-files company-dabbrev-code company-gtags company-etags company-keywords company-yasnippet)
        company-oddmuse
        company-dabbrev
        company-capf))

(with-eval-after-load 'company
  (define-key company-active-map [return]    nil)
  (define-key company-active-map (kbd "RET") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "C-d") #'company-show-doc-buffer))
