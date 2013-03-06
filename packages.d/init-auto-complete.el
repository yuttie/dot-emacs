;;; Auto Complete Mode
(require 'auto-complete-config)
(ac-config-default)

(define-key ac-completing-map (kbd "ESC")
  (lambda ()
    (interactive)
    (ac-stop)))

(add-hook 'c++-mode-hook
          '(lambda ()
             (add-to-list 'ac-sources 'ac-source-semantic)))
