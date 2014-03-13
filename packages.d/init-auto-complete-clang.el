(setq ac-clang-flags '("-std=c++11"))
(make-variable-buffer-local 'ac-clang-flags)

;; Precompiled header
(defconst ac-clang-precompiled-header "~/.precompile.h.pch")
(defun ac-clang-compile-header ()
  ""
  (interactive)
  (require 'auto-complete-clang)
  (let* ((pch (expand-file-name ac-clang-precompiled-header))
         (src (file-name-sans-extension pch)))
    (when (and ac-clang-executable
               (file-exists-p src))
      (message "Compiling the header...")
      (call-process ac-clang-executable nil nil nil
                    "-x" "c++-header" "-std=c++11" src "-o" pch)
      (message "Header compiled"))))
(eval-after-load 'auto-complete-clang
  '(progn
     (let* ((pch (expand-file-name ac-clang-precompiled-header))
            (src (file-name-sans-extension pch)))
       (when (and (file-exists-p src)
                  (or (not (file-exists-p pch))
                      (> (float-time (nth 5 (file-attributes src)))
                         (float-time (nth 5 (file-attributes pch))))))
         (ac-clang-compile-header))
       (when (file-exists-p pch)
         (setq ac-clang-prefix-header pch)))))

(add-hook 'c-mode-common-hook
          (lambda ()
            (require 'auto-complete-clang)
            (add-to-list 'ac-sources ac-source-clang)))
