(require 'undo-tree)
(global-undo-tree-mode)

(eval-after-load 'wl
  '(progn
     (add-hook 'wl-draft-mode-hook #'undo-tree-mode)))

(eval-after-load 'evil
  '(progn
     (evil-define-key 'motion undo-tree-visualizer-map (kbd "j") #'undo-tree-visualize-redo)
     (evil-define-key 'motion undo-tree-visualizer-map (kbd "k") #'undo-tree-visualize-undo)
     (evil-define-key 'motion undo-tree-visualizer-map (kbd "h") #'undo-tree-visualize-switch-branch-left)
     (evil-define-key 'motion undo-tree-visualizer-map (kbd "l") #'undo-tree-visualize-switch-branch-right)))
