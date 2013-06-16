(setq-default mode-line-format
              '("%e"
                (:eval
                 (let* ((active (powerline-selected-window-active))
                        (mode-face (cond
                                    ((not active)                 'powerline-mode-inactive)
                                    ((equal evil-state 'normal)   'powerline-mode-normal)
                                    ((equal evil-state 'insert)   'powerline-mode-insert)
                                    ((equal evil-state 'visual)   'powerline-mode-visual)
                                    ((equal evil-state 'replace)  'powerline-mode-replace)
                                    ((equal evil-state 'operator) 'powerline-mode-operator)
                                    ((equal evil-state 'emacs)    'powerline-mode-emacs)))
                        (face1 (cond
                                ((not active)               'powerline-first-inactive)
                                ((equal evil-state 'insert) 'powerline-first-insert)
                                (t                          'powerline-first-normal)))
                        (face2 (cond
                                ((not active)               'powerline-second-inactive)
                                ((equal evil-state 'insert) 'powerline-second-insert)
                                (t                          'powerline-second-normal)))
                        (face3 (cond
                                ((not active)               'powerline-third-inactive)
                                ((equal evil-state 'insert) 'powerline-third-insert)
                                (t                          'powerline-third-normal)))
                        (buffer-id-face (cond
                                         ((not active)               'powerline-buffer-id-inactive)
                                         ((equal evil-state 'insert) 'powerline-buffer-id-insert)
                                         (t                          'powerline-buffer-id-normal)))
                        (separator-left
                         (intern (format "powerline-%s-%s"
                                         powerline-default-separator
                                         (car powerline-default-separator-dir))))
                        (separator-right
                         (intern (format "powerline-%s-%s"
                                         powerline-default-separator
                                         (cdr powerline-default-separator-dir))))
                        (lhs (list
                              (powerline-raw (capitalize (symbol-name evil-state)) mode-face 'l)

                              (powerline-raw " "     mode-face)
                              (funcall separator-left mode-face face2)

                              (powerline-buffer-id   buffer-id-face 'l)
                              (powerline-raw "%*"    face2 'l)
                              (powerline-buffer-size face2 'l)

                              (powerline-raw " "     face2)
                              (funcall separator-left face2 face3)

                              (powerline-major-mode  face3 'l)
                              (powerline-process     face3 'l)
                              (powerline-minor-modes face3 'l)
                              (powerline-narrow      face3 'l)

                              (powerline-vc face3)))
                        (rhs (list
                              (powerline-raw global-mode-string                      face3 'r)
                              (powerline-raw (symbol-name buffer-file-coding-system) face3 'r)

                              (funcall separator-right face3 face2)
                              (powerline-raw " "    face2)

                              (powerline-raw "%p" face2 'r)

                              (funcall separator-right face2 face1)
                              (powerline-raw " "    face1)

                              (powerline-raw "%l" face1)
                              (powerline-raw ":"  face1)
                              (powerline-raw "%c" face1)
                              (powerline-raw " "  face1 'r))))
                   (concat
                    (powerline-render lhs)
                    (powerline-fill face3 (powerline-width rhs))
                    (powerline-render rhs))))))
