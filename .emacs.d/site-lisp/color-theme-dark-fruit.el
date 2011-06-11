(defun color-theme-dark-fruit ()
  "Fruit color theme based on color-theme-standard.
  "
  (interactive)
  (color-theme-standard)
  (let ((color-theme-is-cumulative t))
    (color-theme-install
     '(color-theme-dark-fruit
       ((foreground-color . "white")
        (background-color . "black")
        (cursor-color . "#00e0ff")
        (background-mode . dark))
       (fringe ((t (:background "black"))))
       (region ((t (:background "gray30"))))
       (font-lock-builtin-face ((t (:foreground "#ff871f"))))
       (font-lock-comment-face ((t (:foreground "#ff69a9"))))
       (font-lock-constant-face ((t (:foreground "#9f55ff"))))
       (font-lock-function-name-face ((t (:foreground "white"))))
       (font-lock-keyword-face ((t (:foreground "#e930ce"))))
       (font-lock-string-face ((t (:foreground "#b4ff69"))))
       (font-lock-type-face ((t (:foreground "#69b2ff"))))
       (font-lock-variable-name-face ((t (:foreground "white"))))
       (font-lock-warning-face ((t (:foreground "Red" :background "#ffe4e4" :bold t))))
       (modeline ((t (:foreground "white" :background "gray25"))))
       (modeline-buffer-id ((t (:foreground "white" :background "gray25"))))
       (viper-minibuffer-insert-face ((t (:foreground "black" :background "#ff4080"))))
       (elscreen-tab-background-face ((t (:background "gray40"))))
       (elscreen-tab-other-screen-face ((t (:foreground "gray60" :background "gray25"))))
       (elscreen-tab-current-screen-face ((t (:foreground "white" :background "black" :bold t))))))))
