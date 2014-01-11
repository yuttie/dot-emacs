;;; autoloads from https://github.com/tarao/term-plus-all/blob/master/term%2Bautoloads.el
;; commands to start terminal
(autoload 'term "term+"
  "Start a terminal-emulator in a new buffer." t)
(autoload 'ansi-term "term+"
  "Start a terminal-emulator in a new buffer." t)
(autoload 'term-mode "term+"
  "Major mode for interacting with an inferior interpreter." t)

;; commands to setup terminal multiplexer
(autoload 'term+mux-noselect "term+mux"
  "Open a new terminal as a new tab without selecting the tab." t)
(autoload 'term+mux-new "term+mux"
  "Open a new terminal as a new tab." t)
(autoload 'term+mux-new-other-window "term+mux"
  "Open a new terminal as a new tab in the other window." t)
(autoload 'term+mux-other-window "term+mux"
  "Open a terminal in an other window.")
(autoload 'term+mux-new-command "term+mux"
  "Open a new terminal as a new tab with specifying a command to run." t)
(autoload 'term+mux-new-session "term+mux"
  "Make a new session." t)
(autoload 'term+mux-remote-session "term+mux"
  "Make a new remote session." t)

;; control commands
(autoload 'term+mux-set-title "term+mux"
  "Set the title of the tab of the current terminal.")
(autoload 'term+mux-cdd "term+mux"
  "List default directories of terminals in the current session.")

;;; my configurations
(eval-after-load 'term+
  '(progn
     (setq term+open-in-other-window t)
     (eval-after-load 'elscreen
       '(progn
          (defun term+open-elscreen (files)
            (term+open files (lambda (filename &rest args) (elscreen-find-file filename))))
          (term+new-control-command "\033]51;open-elscreen;" "\033\\" #'term+open-elscreen)))))
