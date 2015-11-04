(require 'smartparens-config)
(smartparens-global-mode)

(add-hook 'lisp-mode-hook             #'smartparens-strict-mode)
(add-hook 'emacs-lisp-mode-hook       #'smartparens-strict-mode)
(add-hook 'lisp-interaction-mode-hook #'smartparens-strict-mode)
(add-hook 'ielm-mode-hook             #'smartparens-strict-mode)
