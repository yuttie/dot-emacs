(eval-after-load 'evil
  '(eval-after-load 'term+
     '(progn
        (require 'term+evil)
        (eval-after-load 'term+mode
          '(require 'multi-mode+evil)))))
