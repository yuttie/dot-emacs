;;; twittering-mode
(autoload 'twit "twittering-mode" "Start twittering-mode." t)
(autoload 'twittering-mode "twittering-mode" "Major mode for Twitter" t)
(eval-after-load "twittering-mode"
  '(progn
     (setq twittering-account-authorization 'authorized)
     (setq twittering-oauth-access-token-alist
           '(("oauth_token" . "86241283-NT6lU5RKPsce0tM0GjJszev4kB8Jx5594Dz3A2y98")
             ("oauth_token_secret" . "UAJWm1oLYWcQihn0PkTdJU1t90X2Ag1Suvml0gXBnU")
             ("user_id" . "86241283")
             ("screen_name" . "yuttieyuttie")))))
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
(defun twitter ()
  (interactive)
  (global-linum-mode 0)
  (twittering-mode)
  (set-frame-name "Twitter")
  (elscreen-create)
  (twittering-visit-timeline "yuttieyuttie/i")
  (elscreen-jump-0))
