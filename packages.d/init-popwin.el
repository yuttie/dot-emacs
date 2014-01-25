;;; popwin.el
;;; https://github.com/m2ym/popwin-el
(require 'popwin)
(popwin-mode 1)

(push '(dired-mode :position top) popwin:special-display-config)
(push '("^\\*helm.*\\*$" :regexp t) popwin:special-display-config)
