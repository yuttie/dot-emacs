(add-hook 'haskell-mode-hook
          (lambda ()
            (ghc-init)
            (add-to-list 'ac-sources 'ac-source-ghc-mod)))
