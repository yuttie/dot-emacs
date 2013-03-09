(add-hook 'c-mode-common-hook
          (lambda ()
            (require 'auto-complete-clang)
            (add-to-list 'ac-sources ac-source-clang)))
