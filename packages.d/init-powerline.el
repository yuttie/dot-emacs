(setq-default mode-line-format
              '("%e"
                (:eval
                 (let* ((active (powerline-selected-window-active))
                        (mode-line (if active 'mode-line 'mode-line-inactive))
                        (face1 (if active 'powerline-active1
                                 'powerline-inactive1))
                        (face2 (if active 'powerline-active2
                                 'powerline-inactive2))
                        (lhs (list
                              (powerline-raw (capitalize (symbol-name evil-state)) mode-line 'l)

                              (powerline-raw " "     mode-line)
                              (powerline-arrow-right mode-line face1)

                              (powerline-buffer-id   face1 'l)
                              (powerline-raw "%*"    face1 'l)
                              (powerline-buffer-size face1 'l)

                              (powerline-raw " "     face1)
                              (powerline-arrow-right face1 face2)

                              (powerline-major-mode  face2 'l)
                              (powerline-process     face2 'l)
                              (powerline-minor-modes face2 'l)
                              (powerline-narrow      face2 'l)

                              (powerline-vc face2)))
                        (rhs (list
                              (powerline-raw global-mode-string                      face2 'r)
                              (powerline-raw (symbol-name buffer-file-coding-system) face2 'r)

                              (powerline-arrow-left face2 face1)
                              (powerline-raw " "    face1)

                              (powerline-raw "%p" face1 'r)

                              (powerline-arrow-left face1 mode-line)
                              (powerline-raw " "    mode-line)

                              (powerline-raw "%l" mode-line)
                              (powerline-raw ":"  mode-line)
                              (powerline-raw "%c" mode-line)
                              (powerline-raw " "  mode-line 'r))))
                   (concat
                    (powerline-render lhs)
                    (powerline-fill face2 (powerline-width rhs))
                    (powerline-render rhs))))))
