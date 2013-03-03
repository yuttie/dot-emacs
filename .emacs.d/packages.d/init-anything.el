;;; Anything
(require 'anything)
(require 'anything-config)
(define-key anything-map (kbd "C-p") 'anything-previous-line)
(define-key anything-map (kbd "C-n") 'anything-next-line)
(define-key anything-map (kbd "C-M-p") 'anything-previous-source)
(define-key anything-map (kbd "C-M-n") 'anything-next-source)
(global-set-key (kbd "C-;") 'anything)
(setq anything-sources
      '(anything-c-source-buffers
        anything-c-source-elscreen
        anything-c-source-file-name-history
        anything-c-source-files-in-current-dir
        anything-c-source-locate
        anything-c-source-complex-command-history
        anything-c-source-emacs-commands
        anything-c-source-calculation-result))
