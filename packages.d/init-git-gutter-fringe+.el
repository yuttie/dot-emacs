(defun load-git-gutter-fringe+ ()
  (require 'git-gutter-fringe+)
  (remove-hook 'after-make-frame-functions #'load-git-gutter-fringe+))

(if window-system
    (load-git-gutter-fringe+)
  (add-hook 'after-make-frame-functions #'load-git-gutter-fringe+))
