;;; popwin.el
;;; https://github.com/m2ym/popwin-el
(require 'popwin)
(popwin-mode 1)

(push '("^\\*helm.*\\*$" :regexp t) popwin:special-display-config)
(push '("^\\*magit.*\\*$" :regexp t :height 0.5) popwin:special-display-config)
