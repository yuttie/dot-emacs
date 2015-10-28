;;; ElScreen
(setq elscreen-prefix-key (kbd "C-s"))
(setq elscreen-startup-command-line-processing nil)
(setq elscreen-tab-display-control nil)
(setq elscreen-tab-display-kill-screen nil)

(when (el-get-package-installed-p 'navbar)
  (setq elscreen-display-tab nil))

(elscreen-start)

(with-eval-after-load 'elscreen
  (define-key elscreen-map (kbd "s")              #'elscreen-toggle)
  (define-key elscreen-map (kbd "C-s")            #'elscreen-toggle)
  (global-set-key (kbd "C-<tab>")                 #'elscreen-next)
  (global-set-key (kbd "C-S-<iso-lefttab>")       #'elscreen-previous)
  (global-set-key (kbd "<header-line> <mouse-4>") #'elscreen-previous)
  (global-set-key (kbd "<header-line> <mouse-5>") #'elscreen-next)
  (with-eval-after-load 'evil
    (define-key evil-normal-state-map (kbd "C-w T") #'elscreen-split)))
