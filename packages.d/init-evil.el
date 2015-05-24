(evil-mode)

;;; variables
(setq evil-default-cursor t)
(setq evil-search-wrap nil)
(setq evil-want-fine-undo nil)

;;; key bindings
(defun evil-escape-or-quit (&optional prompt)
  (interactive)
  (cond
   ((and (boundp 'skk-henkan-mode) skk-henkan-mode) (kbd "C-g"))
   ((or (evil-insert-state-p) (evil-visual-state-p) (evil-replace-state-p)) [escape])
   (t (kbd "C-g"))))
(define-key key-translation-map (kbd "C-g") #'evil-escape-or-quit)

(define-key evil-insert-state-map (kbd "C-e") #'move-end-of-line)

(define-key evil-normal-state-map (kbd "g w") #'browse-url-at-point)

;;; fold
(define-key evil-normal-state-map "zo" #'evil-open-fold)
(define-key evil-normal-state-map "zO" #'evil-open-folds-at-point)
(define-key evil-normal-state-map "zc" #'evil-close-fold)
(define-key evil-normal-state-map "zC" #'evil-close-folds-at-point)
(define-key evil-normal-state-map "za" nil)
(define-key evil-normal-state-map "zA" nil)
(define-key evil-normal-state-map "zm" #'evil-fold-more)
(define-key evil-normal-state-map "zM" #'evil-close-all-folds)
(define-key evil-normal-state-map "zr" #'evil-fold-less)
(define-key evil-normal-state-map "zR" #'evil-open-all-folds)

(evil-define-command evil-open-fold ()
  "Open one fold under the cursor."
  (outline-minor-mode)
  (show-children))
(evil-define-command evil-close-fold ()
  "Close one fold under the cursor."
  (outline-minor-mode)
  (hide-subtree))
(evil-define-command evil-open-folds-at-point ()
  "Open all folds under the cursor recursively."
  (outline-minor-mode)
  (show-subtree))
(evil-define-command evil-close-folds-at-point ()
  "Close all folds under the cursor recursively."
  (outline-minor-mode)
  (hide-subtree))
(evil-define-command evil-close-all-folds ()
  "Close all folds."
  (outline-minor-mode)
  (hide-sublevels 1))
(evil-define-command evil-open-all-folds ()
  "Open all folds."
  (outline-minor-mode)
  (show-all))
(evil-define-command evil-fold-more ()
  "Fold more."
  (outline-minor-mode)
  (when (> evil-fold-level 0)
    (decf evil-fold-level)
    (hide-sublevels (+ evil-fold-level 1))))
(evil-define-command evil-fold-less ()
  "Reduce folding."
  (outline-minor-mode)
  (incf evil-fold-level)
  (hide-sublevels (+ evil-fold-level 1)))

;;; DDSKK
;; http://d.hatena.ne.jp/tarao/20130304/evil_config
(defadvice update-buffer-local-cursor-color
  (around evil-update-buffer-local-cursor-color-in-insert-state activate)
  ;; SKKによるカーソル色変更を, 挿入ステートかつ日本語モードの場合に限定
  "Allow ccc to update cursor color only when we are in insert
state and in `skk-j-mode'."
  (when (and (eq evil-state 'insert) (boundp 'skk-j-mode) skk-j-mode)
    ad-do-it))
(defadvice evil-ex-search-update-pattern
  (around evil-inhibit-ex-search-update-pattern-in-skk-henkan activate)
  ;; SKKの未確定状態(skk-henkan-mode)ではない場合だけ, 検索パターンをアップデート
  "Inhibit search pattern update during `skk-henkan-mode'.
This is reasonable since inserted text during `skk-henkan-mode'
is a kind of temporary one which is not confirmed yet."
  (unless (and (boundp 'skk-henkan-mode) skk-henkan-mode)
    ad-do-it))
