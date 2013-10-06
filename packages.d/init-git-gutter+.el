(global-git-gutter+-mode)

(eval-after-load 'evil
  '(progn
     (evil-define-key 'normal git-gutter+-mode-map (kbd "C-d C-n") #'git-gutter+-next-hunk)
     (evil-define-key 'normal git-gutter+-mode-map (kbd "C-d C-p") #'git-gutter+-previous-hunk)
     (evil-define-key 'normal git-gutter+-mode-map (kbd "C-d C-v") #'git-gutter+-show-hunk)
     (evil-define-key 'normal git-gutter+-mode-map (kbd "C-d C-r") #'git-gutter+-revert-hunks)
     (evil-define-key 'normal git-gutter+-mode-map (kbd "C-d C-s") #'git-gutter+-stage-hunks)
     (evil-define-key 'normal git-gutter+-mode-map (kbd "C-d C-c") #'git-gutter+-commit)))
