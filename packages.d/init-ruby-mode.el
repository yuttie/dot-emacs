(add-hook 'ruby-mode-hook
          (lambda ()
            (setq ruby-insert-encoding-magic-comment nil)
            (setq ruby-deep-indent-paren nil)
            (local-set-key (kbd "RET") #'reindent-then-newline-and-indent)
            (local-set-key (kbd "C-j") #'reindent-then-newline-and-indent)))

(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
