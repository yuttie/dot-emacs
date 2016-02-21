(require 'skk-autoloads)

(global-set-key (kbd "C-x C-j") #'skk-auto-fill-mode)
(global-set-key (kbd "C-x j") #'skk-mode)
(global-set-key (kbd "C-x t") #'skk-tutorial)

(with-eval-after-load 'skk
  (require 'skk-study)

  (setq default-input-method "japanese-skk")

  (setq skk-cdb-large-jisyo "~/.emacs.d/SKK-JISYO.LL.cdb")
  (setq skk-status-indicator 'minor-mode)
  (setq skk-hiragana-mode-string "SKK:Hira")
  (setq skk-katakana-mode-string "SKK:Kana")
  (setq skk-jisx0208-latin-mode-string "SKK:ZE")
  (setq skk-show-mode-show t)
  (setq skk-show-annotation t)
  (setq skk-show-inline 'vertical)
  (setq skk-use-act t)

  (setq skk-dcomp-activate t)
  (setq skk-dcomp-multiple-activate t)

  (setq skk-rom-kana-rule-list
        (append skk-rom-kana-rule-list
                '(("!"  nil "！")
                  ("~"  nil "〜")
                  ("z " nil "　")
                  ("z(" nil "（")
                  ("z)" nil "）"))))

  ;; 送り仮名の厳密なマッチ
  (setq skk-henkan-okuri-strictly t)
  (setq skk-process-okuri-early nil)
  (add-hook 'minibuffer-setup-hook
            (lambda ()
              (if (and (boundp 'skk-henkan-okuri-strictly)
                       skk-henkan-okuri-strictly
                       (not (eq last-command 'skk-purge-from-jisyo)))
                  (progn
                    (setq skk-henkan-okuri-strictly nil)
                    (put 'skk-henkan-okuri-strictly 'temporary-nil t)))))
  (add-hook 'minibuffer-exit-hook
            (lambda ()
              (if (and (get 'skk-henkan-okuri-strictly 'temporary-nil)
                       (<= (minibuffer-depth) 1))
                  (progn
                    (put 'skk-henkan-okuri-strictly 'temporary-nil nil)
                    (setq skk-henkan-okuri-strictly t))))))
