(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(progn
     (global-set-key (kbd "M-n") #'flycheck-next-error)
     (global-set-key (kbd "M-p") #'flycheck-previous-error)))
