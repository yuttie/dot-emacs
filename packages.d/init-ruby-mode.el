(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)
            (local-set-key (kbd "C-j") 'reindent-then-newline-and-indent)))
