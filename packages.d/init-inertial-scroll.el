;;; inertial-scroll.el
;; http://d.hatena.ne.jp/kiwanami/20101008/1286518936
;; http://github.com/kiwanami/emacs-inertial-scroll
(require 'inertial-scroll)

(setq inertias-initial-velocity 60)
(setq inertias-initial-velocity-wheel 30)
(setq inertias-update-time (/ 1000.0 60))
(setq inertias-rest-coef 0)
(setq inertias-rebound-flash nil)
(setq inertias-global-minor-mode-map
      (inertias-define-keymap
       '(("<next>"  . inertias-up)
         ("<prior>" . inertias-down)
         ("C-v"     . inertias-up)
         ("M-v"     . inertias-down)
         ("<wheel-up>"   . inertias-down-wheel)
         ("<wheel-down>" . inertias-up-wheel)
         ("<mouse-4>"    . inertias-down-wheel)
         ("<mouse-5>"    . inertias-up-wheel))
       inertias-prefix-key))
(inertias-global-minor-mode 1)  ; if comes before map, mapping doesn't work
;(global-set-key (vector mouse-wheel-down-event) 'inertias-down)
;(global-set-key (vector mouse-wheel-up-event)   'inertias-up)
