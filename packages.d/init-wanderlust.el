(setq elmo-message-fetch-threshold nil)  ; no threshold
(setq wl-prefetch-threshold nil)  ; no threshold
(setq wl-draft-reply-buffer-style 'keep)
(setq mime-edit-split-message nil)
(setq elmo-imap4-use-modified-utf7 t)
(setq wl-summary-incorporate-marks '("N" "U" "!" "A" "F" "$"))
(setq wl-fcc-force-as-read t)
(setq wl-interactive-send t)  ; Confirm before sending a draft
(setq wl-message-id-use-message-from t)
(setq wl-auto-save-drafts-interval nil)
(setq wl-folder-move-cur-folder t)
(setq elmo-network-session-idle-timeout 60)
(setq wl-summary-buffer-prev-folder-function 'ignore)
(setq wl-summary-buffer-next-folder-function 'ignore)
(add-hook 'wl-summary-mode-hook 'hl-line-mode)
(add-hook 'wl-summary-prepared-hook
          (lambda ()
            (wl-summary-sort-by-date t)
            (wl-summary-display-top)))
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
