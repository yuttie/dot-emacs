(with-eval-after-load 'company
  (add-to-list 'company-backends #'company-latex-commands)
  (add-to-list 'company-backends #'company-math-symbols-latex)
  (add-to-list 'company-backends #'company-math-symbols-unicode))
