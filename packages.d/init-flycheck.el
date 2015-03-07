(add-hook 'after-init-hook #'global-flycheck-mode)
(with-eval-after-load 'flycheck
  (global-set-key (kbd "M-n") #'flycheck-next-error)
  (global-set-key (kbd "M-p") #'flycheck-previous-error))
