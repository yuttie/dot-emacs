(add-hook 'ruby-mode-hook
          (lambda ()
            (require 'ruby-block)
            (ruby-block-mode t)
            (setq ruby-block-highlight-toggle 'overlay)))
