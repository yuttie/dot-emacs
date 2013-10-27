;;; Haskell Mode
(add-hook 'haskell-mode-hook #'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook #'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook #'turn-on-haskell-decl-scan)
(eval-after-load 'evil
  '(progn
     (evil-define-key 'normal haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
     (evil-define-key 'normal haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)))

(setq haskell-indentation-left-offset 4)
