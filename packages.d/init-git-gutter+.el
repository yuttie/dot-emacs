(add-hook 'find-file-hook #'git-gutter+-mode)
(add-hook 'after-revert-hook #'git-gutter+-mode)

(with-eval-after-load 'git-gutter+
  (defun git-gutter+-refresh-before-save-buffer (&rest args)
    (git-gutter+-refresh))
  (advice-add 'save-buffer :before #'git-gutter+-refresh-before-save-buffer)
  (with-eval-after-load 'evil
    (evil-define-key 'normal git-gutter+-mode-map (kbd "C-d C-n") #'git-gutter+-next-hunk)
    (evil-define-key 'normal git-gutter+-mode-map (kbd "C-d C-p") #'git-gutter+-previous-hunk)
    (evil-define-key 'normal git-gutter+-mode-map (kbd "C-d C-v") #'git-gutter+-show-hunk)
    (evil-define-key 'normal git-gutter+-mode-map (kbd "C-d C-r") #'git-gutter+-revert-hunks)
    (evil-define-key 'normal git-gutter+-mode-map (kbd "C-d C-s") #'git-gutter+-stage-hunks)
    (evil-define-key 'normal git-gutter+-mode-map (kbd "C-d C-c") #'git-gutter+-commit)))
