;;; Evil
(require 'evil)
(evil-mode 1)
(eval-after-load 'inertial-scroll
                 '(progn
                    (define-key evil-normal-state-map (kbd "C-f") 'inertias-up)
                    (define-key evil-normal-state-map (kbd "C-b") 'inertias-down)))
