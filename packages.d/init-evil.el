;;; Evil
(evil-mode 1)
(setq evil-default-cursor t)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(eval-after-load 'auto-complete
                 '(progn
                    (define-key evil-insert-state-map (kbd "C-n") 'ac-next)
                    (define-key evil-insert-state-map (kbd "C-p") 'ac-previous)))
(eval-after-load 'inertial-scroll
                 '(progn
                    (define-key evil-normal-state-map (kbd "C-f") 'inertias-up)
                    (define-key evil-normal-state-map (kbd "C-b") 'inertias-down)))
