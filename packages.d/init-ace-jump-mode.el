(global-set-key (kbd "C-c SPC") #'ace-jump-mode)

(eval-after-load 'evil
  '(progn
     (define-key evil-normal-state-map (kbd "SPC") #'ace-jump-mode)))
