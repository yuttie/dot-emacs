;;; Auto Complete Mode
(require 'auto-complete-config)
(setq-default ac-sources
              '(ac-source-yasnippet
                ac-source-words-in-buffer
                ac-source-files-in-current-dir))
(global-auto-complete-mode t)
(ac-flyspell-workaround)

(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'latex-mode)

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
     (define-key ac-completing-map (kbd "C-n") #'ac-next)
     (define-key ac-completing-map (kbd "C-p") #'ac-previous)))

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

;;; Redefine functions to adjust the order of candidates
;; ac-comphist-score doesn't take account of the lengths of candidates
(defun ac-comphist-score (db string prefix)
  (setq prefix (min prefix (1- (length string))))
  (if (<= 0 prefix)
      (let ((cache (gethash string (ac-comphist-cache db))))
        (or (and cache (aref cache prefix))
            (let ((stat (ac-comphist-get db string))
                  (score 0.0))
              (when stat
                (loop for p from 0 below (length string)
                      ;; sigmoid function
                      with a = 5
                      with b = (/ 700.0 a) ; bounds for avoiding range error in `exp'
                      with d = (/ 6.0 a)
                      for x = (max (- b) (min b (- d (abs (- prefix p)))))
                      for r = (/ 1.0 (1+ (exp (* (- a) x))))
                      do
                      (incf score (* (aref stat p) r))))
              (unless cache
                (setq cache (make-vector (length string) nil))
                (puthash string cache (ac-comphist-cache db)))
              (aset cache prefix score)
              score)))
    0.0))

;; ac-comphist-sort orders candidates with the same score in lexicographic order
(defun ac-comphist-sort (db collection prefix &optional threshold)
  (let (result
        (n 0)
        (total 0)
        (cur 0))
    (setq result (mapcar (lambda (a)
                           (when (and cur threshold)
                             (if (>= cur (* total threshold))
                                 (setq cur nil)
                               (incf n)
                               (incf cur (cdr a))))
                           (car a))
                         (sort (mapcar (lambda (string)
                                         (let ((score (ac-comphist-score db string prefix)))
                                           (incf total score)
                                           (cons string score)))
                                       collection)
                               (lambda (a b)
                                 (or (> (cdr a) (cdr b))
                                     (and (= (cdr a) (cdr b)) (string< (car a) (car b))))))))
    (if threshold
        (cons n result)
      result)))
