;;; autoloads from https://github.com/tarao/term-plus-all/blob/master/term%2Bautoloads.el
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
