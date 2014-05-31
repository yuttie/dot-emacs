(add-hook 'ruby-mode-hook
          (lambda ()
            (setq ruby-insert-encoding-magic-comment nil)
            (defadvice ruby-mode-set-encoding
              (around disable-ruby-mode-set-encoding activate)
              nil)
            (setq ruby-deep-indent-paren nil)
            ;; auto-complete-mode
            (make-local-variable 'ac-ignores)
            (add-to-list 'ac-ignores "end")))

(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
