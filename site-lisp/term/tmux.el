;; Treat a tmux terminal similar to an xterm.
(load "term/xterm")

(declare-function xterm-register-default-colors "xterm" ())

(defun terminal-init-tmux ()
  "Terminal initialization function for tmux."
  ;; Use the xterm color initialization code.
  (xterm-register-default-colors)
  (tty-set-up-initial-frame-faces))

;; tmux.el ends here
