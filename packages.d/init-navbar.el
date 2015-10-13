(with-eval-after-load 'elscreen
  ;; The hydrangea theme needs a taller window
  (defun advise-navbar-make-taller-window (&optional frame)
    (unless frame
      (setq frame (selected-frame)))
    (with-selected-frame frame
      (let* ((buffer (navbar-buffer-create frame))
             (window (display-buffer-in-side-window
                      buffer '((side . top) (window-height . 2)))))  ; window-height was 1
        (set-window-fringes window 0 0)
        (set-window-display-table window navbar-display-table)
        (set-window-parameter window 'delete-window 'ignore)
        (set-window-parameter window 'no-other-window t)
        (set-window-parameter window 'navbar-window t)
        window)))
  (advice-add #'navbar-make-window :override #'advise-navbar-make-taller-window)

  (defun advise-navbar-hide-more (buffer)
    (with-current-buffer buffer
      (setq cursor-in-non-selected-windows nil)
      (setq show-trailing-whitespace nil))
    buffer)
  (advice-add #'navbar-buffer-create :filter-return #'advise-navbar-hide-more)

  (require 'navbarx-elscreen)
  (setq navbar-item-separator " ")
  (setq navbarx-elscreen-tab-body-format " %n ")
  (setq navbarx-elscreen-tab-truncate 18)
  (setq elscreen-display-tab nil)
  (add-to-list 'navbar-item-list #'navbarx-elscreen t)
  (navbar-mode))
