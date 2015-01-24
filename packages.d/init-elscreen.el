;;; ElScreen
(require 'elscreen)
(setq elscreen-prefix-key (kbd "C-s"))
(setq elscreen-startup-command-line-processing nil)
(setq elscreen-display-tab t)
(setq elscreen-tab-display-control nil)
(setq elscreen-tab-display-kill-screen nil)
(elscreen-start)
(define-key elscreen-map (kbd "s") #'elscreen-toggle)
(define-key elscreen-map (kbd "C-s") #'elscreen-toggle)
(global-set-key (kbd "C-<tab>") #'elscreen-next)
(global-set-key (kbd "C-S-<iso-lefttab>") #'elscreen-previous)

(eval-after-load 'evil
  '(progn
     (define-key evil-normal-state-map (kbd "C-w T") #'elscreen-split)))
