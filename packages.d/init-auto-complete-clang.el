(setq ac-clang-flags '("-std=c++11"))
(add-hook 'c-mode-common-hook
          (lambda ()
            (require 'auto-complete-clang)
            (add-to-list 'ac-sources ac-source-clang)))
