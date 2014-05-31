(add-hook 'tuareg-mode-hook
          (lambda ()
            (setq tuareg-pipe-extra-unindent 0)
            (define-key tuareg-mode-map (kbd "RET") #'newline-and-indent)
            (eval-after-load 'evil
              '(progn
                 (setq evil-shift-width 2)))))
