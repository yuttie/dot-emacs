;;; Helm
(fmakunbound 'completing-read)
(fmakunbound 'read-file-name)
(autoload 'completing-read "helm"
  "Read a string in the minibuffer, with completion." t)
(autoload 'read-file-name "helm"
  "Read file name, prompting with PROMPT and completing in directory DIR." t)

(eval-after-load 'helm
  '(progn
     (helm-mode 1)
     (setq helm-input-idle-delay 0)
     (define-key helm-map (kbd "C-h") (kbd "DEL"))
     (define-key helm-map (kbd "C-p") #'helm-previous-line)
     (define-key helm-map (kbd "C-n") #'helm-next-line)
     (define-key helm-map (kbd "C-M-p") #'helm-previous-source)
     (define-key helm-map (kbd "C-M-n") #'helm-next-source)))

(global-set-key (kbd "M-x") #'helm-M-x)

(global-set-key (kbd "C-x C-f") #'helm-for-files)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "C-c f f") #'helm-find-files)
(global-set-key (kbd "C-c f F") #'helm-find)
(global-set-key (kbd "C-c f l") #'helm-locate)

(global-set-key (kbd "C-c i e") #'helm-info-emacs)
(global-set-key (kbd "C-c i l") #'helm-info-elisp)
(global-set-key (kbd "C-c i L") #'helm-info-emacs-lisp-intro)

(global-set-key (kbd "C-c C-h u") #'helm-ucs)
(global-set-key (kbd "C-c C-h c") #'helm-colors)
(global-set-key (kbd "C-c C-h m") #'helm-man-woman)
(global-set-key (kbd "C-c C-h t") #'helm-top)
(global-set-key (kbd "C-c M-s o") #'helm-occur)
(global-set-key (kbd "C-c p")     #'helm-show-kill-ring)

;; Disable automatic selection when only one candidate directory is matched.
(setq helm-ff-auto-update-initial-value nil)
