(add-hook 'tuareg-mode-hook
          (lambda ()
            (setq tuareg-pipe-extra-unindent 0)
            (eval-after-load 'merlin
              '(progn
                 (add-to-list 'ac-sources 'ac-source-merlin)))
            (eval-after-load 'evil
              '(progn
                 (setq evil-shift-width 2)))))
