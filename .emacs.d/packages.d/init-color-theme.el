;;; color-theme
(add-hook 'after-init-hook (lambda ()
    (require 'color-theme)
    (autoload 'color-theme-fruit "color-theme-fruit" "Fruit color theme." t)
    (autoload 'color-theme-dark-fruit "color-theme-dark-fruit" "Dark Fruit color theme." t)
    (autoload 'color-theme-tango "color-theme-tango" "A color theme based on Tango Palette." t)
    (autoload 'color-theme-tangotango "color-theme-tangotango" "A color theme based on Tango Palette colors." t)
    (eval-after-load "color-theme"
      '(progn
         (color-theme-initialize)
         (if window-system (load "color-theme-wombat"))))))
