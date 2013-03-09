;;; Evil
(require 'evil)
(evil-mode 1)
(setq evil-default-cursor t)
(define-key evil-insert-state-map (kbd "C-h") 'backward-delete-char-untabify)
(define-key evil-ex-completion-map (kbd "C-h") 'evil-ex-delete-backward-char)
(eval-after-load 'auto-complete
                 '(progn
                    (define-key evil-insert-state-map (kbd "C-n") 'ac-next)
                    (define-key evil-insert-state-map (kbd "C-p") 'ac-previous)))
(eval-after-load 'inertial-scroll
                 '(progn
                    (define-key evil-normal-state-map (kbd "C-f") 'inertias-up)
                    (define-key evil-normal-state-map (kbd "C-b") 'inertias-down)))
