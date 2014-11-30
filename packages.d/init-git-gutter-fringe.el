(require 'git-gutter-fringe)
(global-git-gutter-mode)

(eval-after-load 'evil
  '(progn
     (define-key evil-normal-state-map (kbd "C-d C-n") #'git-gutter:next-hunk)
     (define-key evil-normal-state-map (kbd "C-d C-p") #'git-gutter:previous-hunk)
     (define-key evil-normal-state-map (kbd "C-d C-v") #'git-gutter:popup-hunk)
     (define-key evil-normal-state-map (kbd "C-d C-r") #'git-gutter:revert-hunk)
     (define-key evil-normal-state-map (kbd "C-d C-s") #'git-gutter:stage-hunk)
     (define-key evil-normal-state-map (kbd "C-d C-c") #'magit-commit)))
