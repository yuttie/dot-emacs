;;; Autoloads
(setq completing-read-function 'helm--completing-read-default
      read-file-name-function  'helm--generic-read-file-name)
(autoload 'helm--completing-read-default "helm"
  "An helm replacement of `completing-read'.")
(autoload 'helm--generic-read-file-name "helm"
  "An helm replacement of `read-file-name'.")

;;; Variables
(setq helm-input-idle-delay 0)
(setq helm-delete-minibuffer-contents-from-point t)
(setq helm-ff-auto-update-initial-value nil)  ; Disable automatic selection when only one candidate directory is matched.
(setq helm-for-files-preferred-list
      '(helm-source-buffers-list
        helm-source-files-in-current-dir
        helm-source-recentf
        helm-source-bookmarks
        helm-source-file-cache
        helm-source-locate))

;;; Key bindings
(eval-after-load 'helm
  '(progn
     (helm-mode)
     (define-key helm-map (kbd "C-h")   (kbd "DEL"))
     (define-key helm-map (kbd "C-p")   #'helm-previous-line)
     (define-key helm-map (kbd "C-n")   #'helm-next-line)
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
