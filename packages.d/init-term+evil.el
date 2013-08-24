(eval-after-load 'evil
  '(progn (require 'term+evil)
          (when (featurep 'term+mode) (require 'multi-mode+evil))))
