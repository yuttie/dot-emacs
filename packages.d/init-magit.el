(setq magit-diff-refine-hunk 'all)
(add-hook 'magit-status-mode-hook
	  (lambda ()
	    (define-key magit-status-mode-map (kbd "j") #'next-line)
	    (define-key magit-status-mode-map (kbd "k") #'previous-line)
	    (define-key magit-status-mode-map (kbd "K") #'magit-discard-item)))
