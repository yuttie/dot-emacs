(global-set-key (kbd "C-c SPC") #'ace-jump-char-mode)

(with-eval-after-load 'evil
  (define-key evil-motion-state-map (kbd "SPC") #'ace-jump-char-mode))
