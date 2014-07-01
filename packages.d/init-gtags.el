(eval-after-load 'gtags
  '(progn
     (define-key gtags-mode-map (kbd "C-c C-d") #'gtags-find-tag-from-here)
     (define-key gtags-mode-map (kbd "C-c C-r") #'gtags-find-rtag)
     (define-key gtags-mode-map (kbd "C-c C-s") #'gtags-find-symbol)
     (define-key gtags-mode-map (kbd "C-c C-t") #'gtags-pop-stack)))
