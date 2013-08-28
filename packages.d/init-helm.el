;;; Helm
(helm-mode 1)
(setq helm-input-idle-delay 0)
(define-key helm-map (kbd "C-h") (kbd "DEL"))
(define-key helm-map (kbd "C-p") 'helm-previous-line)
(define-key helm-map (kbd "C-n") 'helm-next-line)
(define-key helm-map (kbd "C-M-p") 'helm-previous-source)
(define-key helm-map (kbd "C-M-n") 'helm-next-source)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

;; Disable automatic selection when only one candidate directory is matched.
(setq helm-ff-auto-update-initial-value nil)
