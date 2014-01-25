;;; popwin.el
;;; https://github.com/m2ym/popwin-el
(require 'popwin)
(popwin-mode 1)

(add-to-list 'popwin:special-display-config '(dired-mode :position top))
(add-to-list 'popwin:special-display-config '("^\\*helm.*\\*$" :regexp t))
