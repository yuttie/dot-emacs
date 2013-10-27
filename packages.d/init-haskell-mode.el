;;; Haskell Mode
(add-hook 'haskell-mode-hook #'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook #'turn-on-haskell-indentation)

(setq haskell-indentation-left-offset 4)
