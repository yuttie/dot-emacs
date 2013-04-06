(add-hook 'org-mode-hook
          (lambda ()
            (require 'calfw-org)))

(defun open-my-calendar ()
  (interactive)
  (require 'calfw-ical)
  (let ((sources (eval
                  (when (file-exists-p "~/.calfw")
                    (with-temp-buffer
                      (insert-file-contents "~/.calfw")
                      (read (buffer-string)))))))
    (cfw:open-calendar-buffer :contents-sources sources)))
