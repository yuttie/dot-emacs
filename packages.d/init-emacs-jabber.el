(setq jabber-account-list
      (with-temp-buffer
        (insert-file-contents "~/.emacs-jabber")
        (read (buffer-string))))
