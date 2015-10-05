(global-undo-tree-mode)

(with-eval-after-load 'wl
  (add-hook 'wl-draft-mode-hook #'undo-tree-mode))
