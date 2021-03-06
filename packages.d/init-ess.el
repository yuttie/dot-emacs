(setq auto-mode-alist
      (append
       '(("/R/.*\\.q\\'"      . R-mode) ;; R/*.q is R code (e.g., in package)
         ("\\.[rR]\\'"        . R-mode)
         ("\\.[rR]nw\\'"      . Rnw-mode)
         ("\\.[rR]profile\\'" . R-mode)
         ("\\.[Rr]t\\'"       . R-transcript-mode)
         ("\\.[Rr]out"        . R-transcript-mode)
         ("\\.Rd\\'"          . Rd-mode)
         ("\\.jl\\'"          . ess-julia-mode))
       auto-mode-alist))
(autoload 'R                 "ess-site" "" t)
(autoload 'R-mode            "ess-site" "" t)
(autoload 'Rnw-mode          "ess-site" "" t)
(autoload 'R-transcript-mode "ess-site" "" t)
(autoload 'Rd-mode           "ess-site" "" t)
(autoload 'ess-julia-mode    "ess-site" "" t)

(with-eval-after-load 'ess-s-l
  (ess-toggle-underscore nil))

(with-eval-after-load 'ess-julia
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-ess-julia-objects)))
