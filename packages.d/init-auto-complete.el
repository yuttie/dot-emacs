;;; Auto Complete Mode
(require 'auto-complete-config)
(setq-default ac-sources
              '(ac-source-yasnippet
                ac-source-words-in-buffer
                ac-source-abbrev
                ac-source-dictionary
                ac-source-words-in-all-buffer
                ac-source-files-in-current-dir))
(global-auto-complete-mode t)
(ac-flyspell-workaround)

(add-to-list 'ac-modes 'text-mode)

(define-key ac-completing-map (kbd "ESC")
  (lambda ()
    (interactive)
    (ac-stop)))

(add-hook 'auto-complete-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-filename)))

(add-hook 'c-mode-common-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-gtags)))

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
