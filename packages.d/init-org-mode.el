(setq org-log-done t)
(add-hook 'org-mode-hook
          (lambda ()
            (turn-on-font-lock)
            (set (make-local-variable 'system-time-locale) "C")))
(eval-after-load 'elscreen
  '(add-hook 'org-mode-hook
             (lambda ()
               (define-key org-mode-map (kbd "C-<tab>") 'elscreen-next)
               (define-key org-mode-map (kbd "C-S-<iso-lefttab>") 'elscreen-previous))))
