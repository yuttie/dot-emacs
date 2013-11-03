(add-hook 'ruby-mode-hook
          (lambda ()
            (setq ruby-insert-encoding-magic-comment nil)
            (local-set-key (kbd "RET") #'reindent-then-newline-and-indent)
            (local-set-key (kbd "C-j") #'reindent-then-newline-and-indent)))
