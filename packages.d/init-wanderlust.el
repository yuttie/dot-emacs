(setq elmo-message-fetch-threshold nil)  ; no threshold
(setq wl-prefetch-threshold nil)  ; no threshold
(setq wl-message-id-domain "yuta.taniguchi.y.t@gmail.com")
(setq wl-draft-reply-buffer-style 'keep)
(setq mime-edit-split-message nil)
(setq elmo-imap4-use-modified-utf7 t)
(setq wl-summary-incorporate-marks '("N" "U" "!" "A" "F" "$"))
(setq wl-fcc-force-as-read t)
(setq wl-interactive-send t)  ; Confirm before sending a draft
(add-hook 'wl-mail-setup-hook 'wl-draft-config-exec)  ; Automatically configure SMTP when we start writing a draft

;; Key Bindings
(eval-after-load 'wl
  '(progn
     (define-key wl-folder-mode-map (kbd "j") 'wl-folder-next-entity)
     (define-key wl-folder-mode-map (kbd "k") 'wl-folder-prev-entity)

     (define-key wl-summary-mode-map (kbd "j") 'wl-summary-next)
     (define-key wl-summary-mode-map (kbd "k") 'wl-summary-prev)
     (define-key wl-summary-mode-map (kbd "n") 'wl-summary-down)
     (define-key wl-summary-mode-map (kbd "p") 'wl-summary-up)
     (define-key wl-summary-mode-map (kbd "J") 'wl-summary-next-line-content)
     (define-key wl-summary-mode-map (kbd "K") 'wl-summary-prev-line-content)
     (define-key wl-summary-mode-map (kbd "C-j") 'wl-summary-jump-to-current-message)))
