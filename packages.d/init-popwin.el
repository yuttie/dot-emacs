;;; popwin.el
;;; https://github.com/m2ym/popwin-el
(autoload 'popwin:display-buffer "popwin")
(setq display-buffer-function 'popwin:display-buffer)
