(setq ac-clang-flags '("-std=c++11"))
(make-variable-buffer-local 'ac-clang-flags)

;; Precompiled header
;; Use the following command line to generate it:
;;   clang -x c++-header -std=c++11 ~/.precompile.h -o ~/.precompile.h.pch
(setq ac-clang-prefix-header "~/.precompile.h.pch")

(add-hook 'c-mode-common-hook
          (lambda ()
            (require 'auto-complete-clang)
            (add-to-list 'ac-sources ac-source-clang)))
