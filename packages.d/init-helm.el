;;; Helm
(setq helm-input-idle-delay 0)
(define-key helm-map (kbd "C-p") 'helm-previous-line)
(define-key helm-map (kbd "C-n") 'helm-next-line)
(define-key helm-map (kbd "C-M-p") 'helm-previous-source)
(define-key helm-map (kbd "C-M-n") 'helm-next-source)
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)
