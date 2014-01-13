;;; Define my own "ghc-init" since the original one does define-keys
(defun my-ghc-init ()
  (require 'ghc)
  (ghc-abbrev-init)
  (ghc-type-init)
  (unless ghc-initialized
    (ghc-comp-init)
    (setq ghc-initialized t)))

(add-hook 'haskell-mode-hook #'my-ghc-init)

;;; auto-complete
(eval-after-load 'auto-complete
  '(add-hook 'haskell-mode-hook
             (lambda ()
               (add-to-list 'ac-sources 'ac-source-ghc-mod))))

;;; key bindings
(define-key haskell-mode-map (kbd "M-TAB")   #'ghc-complete)
(define-key haskell-mode-map (kbd "M-C-d")   #'ghc-browse-document)
(define-key haskell-mode-map (kbd "C-c C-t") #'ghc-show-type)
(define-key haskell-mode-map (kbd "C-c C-i") #'ghc-show-info)
(define-key haskell-mode-map (kbd "C-c C-e") #'ghc-expand-th)
(define-key haskell-mode-map (kbd "M-C-m")   #'ghc-import-module)
(define-key haskell-mode-map (kbd "M-t")     #'ghc-insert-template)
(define-key haskell-mode-map (kbd "M-s")     #'ghc-sort-lines)
(define-key haskell-mode-map (kbd "C-x C-s") #'ghc-save-buffer)
(define-key haskell-mode-map (kbd "C-c C-m") #'ghc-insert-module)
(define-key haskell-mode-map (kbd "C-c h")   #'haskell-hoogle)
(define-key haskell-mode-map (kbd "C-c <")   #'ghc-make-indent-shallower)
(define-key haskell-mode-map (kbd "C-c >")   #'ghc-make-indent-deeper)
