(global-set-key (kbd "C-c SPC") #'ace-jump-char-mode)

(eval-after-load 'evil
  '(progn
     (define-key evil-motion-state-map (kbd "SPC") #'ace-jump-char-mode)))
