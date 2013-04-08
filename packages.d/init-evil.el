;;; Evil
(evil-mode 1)
(setq evil-default-cursor t)
(setq evil-search-wrap nil)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-h") (kbd "DEL"))
(define-key evil-replace-state-map (kbd "C-h") (kbd "DEL"))
(define-key evil-ex-completion-map (kbd "C-h") (kbd "DEL"))
(eval-after-load 'ace-jump-mode
  '(progn
     (define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)))
(eval-after-load 'auto-complete
  '(progn
     (define-key evil-insert-state-map (kbd "C-n") 'ac-next)
     (define-key evil-insert-state-map (kbd "C-p") 'ac-previous)))
(eval-after-load 'inertial-scroll
  '(progn
     (define-key evil-normal-state-map (kbd "C-f") 'inertias-up)
     (define-key evil-normal-state-map (kbd "C-b") 'inertias-down)))
(evil-define-key 'normal org-mode-map (kbd "M-h") 'org-metaleft)
(evil-define-key 'normal org-mode-map (kbd "M-l") 'org-metaright)
(evil-define-key 'normal org-mode-map (kbd "M-j") 'org-metadown)
(evil-define-key 'normal org-mode-map (kbd "M-k") 'org-metaup)
(eval-after-load 'wl
  '(progn
     (add-to-list 'evil-emacs-state-modes 'wl-folder-mode)
     (add-to-list 'evil-emacs-state-modes 'wl-summary-mode)
     (add-hook 'wl-folder-mode-hook 'evil-emacs-state)))
