(setq org-log-done t)
(add-hook 'org-mode-hook
          (lambda ()
            (turn-on-font-lock)
            (set (make-local-variable 'system-time-locale) "C")))
(eval-after-load 'elscreen
  '(add-hook 'org-mode-hook
             (lambda ()
               (define-key org-mode-map (kbd "C-<tab>") #'elscreen-next)
               (define-key org-mode-map (kbd "C-S-<iso-lefttab>") #'elscreen-previous))))

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c b") #'org-iswitchb)

(eval-after-load 'evil
  '(progn
     (evil-define-key 'normal org-mode-map (kbd "M-h") #'org-metaleft)
     (evil-define-key 'normal org-mode-map (kbd "M-l") #'org-metaright)
     (evil-define-key 'normal org-mode-map (kbd "M-j") #'org-metadown)
     (evil-define-key 'normal org-mode-map (kbd "M-k") #'org-metaup)))

;; org-capture
(setq org-default-notes-file "~/notes.org")
(setq org-capture-templates
      '(("i" "idea"   entry (file+headline "" "Idea")   "* [%<%Y-%m-%dT%H:%M:%S>] %?\n%i\n%a" :prepend t)
        ("a" "agenda" entry (file+headline "" "Agenda") "* [%<%Y-%m-%dT%H:%M:%S>] %?\n%i\n%a" :prepend t)))

;; org-agenda
(setq org-agenda-files '("~/notes.org"))
