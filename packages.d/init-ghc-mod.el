(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook
          (lambda ()
            (ghc-init)
            (flymake-mode)
            (define-key haskell-mode-map (kbd "M-n") #'flymake-goto-next-error)
            (define-key haskell-mode-map (kbd "M-p") #'flymake-goto-prev-error)
            (add-to-list 'ac-sources 'ac-source-ghc-mod)))
