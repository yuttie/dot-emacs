(add-to-list 'auto-mode-alist '("\\.eliom" . tuareg-mode))
(add-hook 'tuareg-mode-hook
          (lambda ()
            (setq tuareg-pipe-extra-unindent 0)
            (with-eval-after-load 'evil
              (setq evil-shift-width 2))))
