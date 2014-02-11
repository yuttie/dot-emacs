(setq ac-clang-flags '("-std=c++11"))
(make-variable-buffer-local 'ac-clang-flags)

;; Precompiled header
(defconst ac-clang-precompiled-header "~/.precompile.h.pch")
(eval-after-load 'auto-complete-clang
  '(progn
     (when (and (not (file-exists-p ac-clang-precompiled-header))
                (file-exists-p (file-name-sans-extension ac-clang-precompiled-header))
                ac-clang-executable)
       (message "Creating the precompiled header...")
       (call-process ac-clang-executable nil nil nil
                     "-x" "c++-header"
                     "-std=c++11"
                     (file-name-sans-extension (expand-file-name ac-clang-precompiled-header))
                     "-o" (expand-file-name ac-clang-precompiled-header)))
     (when (file-exists-p ac-clang-precompiled-header)
       (setq ac-clang-prefix-header ac-clang-precompiled-header))))

(add-hook 'c-mode-common-hook
          (lambda ()
            (require 'auto-complete-clang)
            (add-to-list 'ac-sources ac-source-clang)))
