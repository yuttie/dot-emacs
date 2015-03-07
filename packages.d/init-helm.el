;;; Autoloads
(setq completing-read-function #'helm--completing-read-default
      read-file-name-function  #'helm--generic-read-file-name)
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
(with-eval-after-load 'helm
  (helm-mode)
  (define-key helm-map (kbd "C-h")   (kbd "DEL"))
  (define-key helm-map (kbd "C-p")   #'helm-previous-line)
  (define-key helm-map (kbd "C-n")   #'helm-next-line)
  (define-key helm-map (kbd "C-M-p") #'helm-previous-source)
  (define-key helm-map (kbd "C-M-n") #'helm-next-source))
(with-eval-after-load 'helm-files
  (define-key helm-find-files-map (kbd "C-h") #'helm-ff-delete-char-backward))

(global-set-key (kbd "M-x") #'helm-M-x)

(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-unset-key (kbd "C-x b"))
(global-set-key (kbd "C-c f f") #'helm-for-files)
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
(global-set-key (kbd "C-c C-f")   #'helm-imenu)

;;; Sorting
(defun helm-generic-sort-fn (s1 s2)
  "Sort predicate function for helm candidates.
Args S1 and S2 can be single or \(display . real\) candidates,
that is sorting is done against real value of candidate."
  (let* ((reg1  (concat "\\_<" helm-pattern "\\_>"))
         (reg2  (concat "\\_<" helm-pattern))
         (split (split-string helm-pattern))
         (str1  (if (consp s1) (cdr s1) s1))
         (str2  (if (consp s2) (cdr s2) s2))
         (score #'(lambda (str r1 r2 lst)
                    (cond ((string-match r1 str) 4)
                          ((and (string-match " " helm-pattern)
                                (string-match (concat "\\_<" (car lst)) str)
                                (cl-loop for r in (cdr lst)
                                      always (string-match r str))) 3)
                          ((and (string-match " " helm-pattern)
                                (cl-loop for r in lst always (string-match r str))) 2)
                          ((string-match r2 str) 1)
                          (t 0))))
         (sc1 (funcall score str1 reg1 reg2 split))
         (sc2 (funcall score str2 reg1 reg2 split)))
    (cond ((or (zerop (string-width helm-pattern))
               (and (zerop sc1) (zerop sc2)))
           (string-lessp str1 str2))
          ((= sc1 sc2)
           (string-lessp str1 str2))
          (t (> sc1 sc2)))))
