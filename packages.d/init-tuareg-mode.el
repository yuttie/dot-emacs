(add-hook 'tuareg-mode-hook
          (lambda ()
            (define-key tuareg-mode-map (kbd "RET") #'newline-and-indent)
            (eval-after-load 'evil
              '(progn
                 (setq evil-shift-width 2)))))
