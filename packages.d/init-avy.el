(global-set-key (kbd "C-c SPC") #'avy-goto-char)

(with-eval-after-load 'evil
  (define-key evil-motion-state-map (kbd "SPC") #'avy-goto-char))
