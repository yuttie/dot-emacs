(fmakunbound 'describe-bindings)
(autoload 'describe-bindings "helm-descbinds"
  "Show a list of all defined keys, and their definitions." t)
(with-eval-after-load 'helm-descbinds
  (helm-descbinds-mode))
