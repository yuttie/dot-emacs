;;; Auto Complete Mode
(require 'auto-complete-config)
(setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
(global-auto-complete-mode t)
(ac-flyspell-workaround)

(add-to-list 'ac-modes 'text-mode)

(define-key ac-completing-map (kbd "ESC")
  (lambda ()
    (interactive)
    (ac-stop)))

(add-hook 'auto-complete-mode-hook
          (lambda ()
            (setq ac-sources
                  (append '(ac-source-files-in-current-dir
                            ac-source-filename)
                          ac-sources))))

(add-hook 'c++-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-semantic)))

(add-hook 'css-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-css-property)))

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq ac-sources
                  (append '(ac-source-features
                            ac-source-functions
                            ac-source-variables
                            ac-source-symbols)
                          ac-sources))))
