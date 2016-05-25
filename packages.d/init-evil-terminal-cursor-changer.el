(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer))

(setq evil-normal-state-cursor 'box)
(setq evil-visual-state-cursor 'box)
(setq evil-insert-state-cursor 'bar)
(setq evil-emacs-state-cursor  'hbar)
