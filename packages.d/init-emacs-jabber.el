(setq jabber-account-list
      (when (file-exists-p "~/.emacs-jabber")
        (with-temp-buffer
          (insert-file-contents "~/.emacs-jabber")
          (read (buffer-string)))))
