(require 'undo-tree)
(global-undo-tree-mode)
(eval-after-load 'wl
  '(progn
     (add-hook 'wl-draft-mode-hook 'undo-tree-mode)))
