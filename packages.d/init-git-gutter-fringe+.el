(defun load-git-gutter-fringe+ (&optional frame)
  (require 'git-gutter-fringe+)
  (remove-hook 'after-make-frame-functions #'load-git-gutter-fringe+))

(with-eval-after-load 'git-gutter+
  (if window-system
      (load-git-gutter-fringe+)
    (add-hook 'after-make-frame-functions #'load-git-gutter-fringe+)))
