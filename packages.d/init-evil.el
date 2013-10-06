;;; Evil
(evil-mode 1)
(setq evil-default-cursor t)
(setq evil-search-wrap nil)
(define-key evil-insert-state-map (kbd "C-e") #'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-h") (kbd "DEL"))
(define-key evil-replace-state-map (kbd "C-h") (kbd "DEL"))
(define-key evil-ex-completion-map (kbd "C-h") (kbd "DEL"))
