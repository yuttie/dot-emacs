(add-hook 'tuareg-mode-hook
          (lambda ()
            (setq tuareg-pipe-extra-unindent 0)
            (eval-after-load 'evil
              '(progn
                 (setq evil-shift-width 2)))))
