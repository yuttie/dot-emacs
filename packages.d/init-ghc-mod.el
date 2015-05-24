;;; Prevent "ghc-init" from defining key bindings
(add-hook 'haskell-mode-hook #'ghc-init)
(defadvice ghc-init (around ghc-init-without-key-bindings activate)
  (let ((orig-define-key (symbol-function 'define-key)))
    (defalias 'define-key 'ignore)
    ad-do-it
    (fset 'define-key orig-define-key)))

;;; key bindings
(add-hook 'haskell-mode-hook
          (lambda ()
            (define-key haskell-mode-map (kbd "M-d")     #'ghc-browse-document)
            (define-key haskell-mode-map (kbd "M-t")     #'ghc-show-type)
            (define-key haskell-mode-map (kbd "M-i")     #'ghc-show-info)
            (define-key haskell-mode-map (kbd "C-c t")   #'ghc-insert-template)
            (define-key haskell-mode-map (kbd "C-c m")   #'ghc-insert-module)
            (define-key haskell-mode-map (kbd "C-c h")   #'haskell-hoogle)
            (define-key haskell-mode-map (kbd "C-c <")   #'ghc-make-indent-shallower)
            (define-key haskell-mode-map (kbd "C-c >")   #'ghc-make-indent-deeper)))
