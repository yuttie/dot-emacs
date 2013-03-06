;;; twittering-mode
(autoload 'twit "twittering-mode" "Start twittering-mode." t)
(autoload 'twittering-mode "twittering-mode" "Major mode for Twitter" t)
(setq twittering-use-master-password t)
(add-hook 'twittering-mode-hook
          (lambda ()
            (string-match "%s" twittering-status-format)
            (setq twittering-status-format
                  (replace-match "%S" nil nil twittering-status-format))
            (setq twittering-retweet-format "QT @%s: %t")
            (twittering-icon-mode 1)
            (define-key twittering-mode-map (kbd "j") 'next-line)
            (define-key twittering-mode-map (kbd "k") 'previous-line)
            (define-key twittering-mode-map (kbd "J") 'twittering-goto-next-status)
            (define-key twittering-mode-map (kbd "K") 'twittering-goto-previous-status)
            (define-key twittering-mode-map (kbd "C-f") 'inertias-up)
            (define-key twittering-mode-map (kbd "C-b") 'inertias-down)))
