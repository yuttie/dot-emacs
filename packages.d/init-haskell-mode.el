;;; Haskell Mode
(add-hook 'haskell-mode-hook #'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook #'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook #'turn-on-haskell-decl-scan)

(setq haskell-indentation-left-offset 4)

;;; use the haskell-interactive-mode instead of the inferior-haskell-mode
(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-x C-d") nil)
     (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
     (define-key haskell-mode-map (kbd "C-c C-b") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c M-.") nil)
     (define-key haskell-mode-map (kbd "C-c C-d") nil)))

(eval-after-load 'evil
  '(progn
     (evil-define-key 'normal haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
     (evil-define-key 'normal haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)))
