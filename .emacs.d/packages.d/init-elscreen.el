;;; ElScreen
(require 'elscreen)
(setq elscreen-startup-command-line-processing nil)
(setq elscreen-prefix-key (kbd "C-z"))
(setq elscreen-display-tab t)
(setq elscreen-tab-display-control nil)
(setq elscreen-tab-display-kill-screen nil)
(elscreen-start)
(define-key elscreen-map (kbd "z") 'elscreen-toggle)
(define-key elscreen-map (kbd "C-z") 'elscreen-toggle)
(global-set-key (kbd "C-<tab>") 'elscreen-next)
(global-set-key (kbd "C-S-<iso-lefttab>") 'elscreen-previous)
