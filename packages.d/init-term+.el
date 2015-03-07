;;; autoloads from https://github.com/tarao/term-plus-all/blob/master/term%2Bautoloads.el
;; commands to start terminal
(autoload 'term "term+"
  "Start a terminal-emulator in a new buffer." t)
(autoload 'ansi-term "term+"
  "Start a terminal-emulator in a new buffer." t)
(autoload 'term-mode "term+"
  "Major mode for interacting with an inferior interpreter." t)

;;; my configurations
(with-eval-after-load 'term+
  (setq term+open-in-other-window t)
  (with-eval-after-load 'elscreen
    (defun term+open-elscreen (files)
      (term+open files (lambda (filename &rest args) (elscreen-find-file filename))))
    (term+new-control-command "\033]51;open-elscreen;" "\033\\" #'term+open-elscreen)))
