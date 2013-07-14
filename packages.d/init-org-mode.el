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

;; org-capture
(setq org-default-notes-file "~/notes.org")
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("i" "idea"   entry (file+headline "" "Idea")   "* [%<%Y-%m-%dT%H:%M:%S>] %?\n%i\n%a" :prepend t)
        ("a" "agenda" entry (file+headline "" "Agenda") "* [%<%Y-%m-%dT%H:%M:%S>] %?\n%i\n%a" :prepend t)))
