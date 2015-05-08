(setq magit-last-seen-setup-instructions "1.4.0")
(setq magit-diff-refine-hunk 'all)
(add-hook 'magit-status-mode-hook
	  (lambda ()
	    (define-key magit-status-mode-map (kbd "j") #'next-line)
	    (define-key magit-status-mode-map (kbd "k") #'previous-line)
	    (define-key magit-status-mode-map (kbd "K") #'magit-discard-item)))
(add-hook 'magit-log-mode-hook
	  (lambda ()
	    (define-key magit-log-mode-map (kbd "j") #'next-line)
	    (define-key magit-log-mode-map (kbd "k") #'previous-line)))
