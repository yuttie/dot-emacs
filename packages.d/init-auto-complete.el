;;; Auto Complete Mode
(require 'auto-complete-config)
(setq-default ac-sources
              '(ac-source-yasnippet
                ac-source-words-in-buffer
                ac-source-files-in-current-dir))
(global-auto-complete-mode t)
(ac-flyspell-workaround)

(add-to-list 'ac-modes 'text-mode)

(setq ac-auto-start t)
(setq ac-auto-show-menu t)
(setq ac-quick-help-delay 0.5)

(define-key ac-completing-map (kbd "ESC")
  (lambda ()
    (interactive)
    (ac-stop)))
(define-key ac-completing-map (kbd "<return>") nil)
(define-key ac-completing-map (kbd "RET") nil)

(eval-after-load 'evil
  '(progn
     (define-key evil-insert-state-map (kbd "C-n") #'ac-next)
     (define-key evil-insert-state-map (kbd "C-p") #'ac-previous)))

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

(add-hook 'text-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-abbrev)
            (add-to-list 'ac-sources 'ac-source-dictionary)))
