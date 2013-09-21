(eval-after-load 'helm
  '(progn
     (require 'helm-ls-git)
     (global-set-key (kbd "C-x C-g") #'helm-ls-git-ls)))
