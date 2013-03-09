(deftheme darkfruit
  "Created 2013-03-06.")

(custom-theme-set-faces
 'darkfruit
 ;; Standard
 '(default ((t (:background "#272727" :foreground "#FFFFFF"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 ;; Frame
 '(cursor ((t (:background "#a0a0a0"))))
 '(fringe ((t (:background "#232526"))))
 '(mode-line ((t (:background "OliveDrab3" :foreground "dark green" :box nil :weight bold))))
 '(mode-line-inactive ((t (:background "gray20" :foreground "gray50" :box nil))))
 '(powerline-active1 ((t (:background "gray34" :foreground "white"))))
 '(powerline-active2 ((t (:background "gray19" :foreground "white"))))
 '(powerline-inactive1 ((t (:background "gray15" :foreground "gray54"))))
 '(powerline-inactive2 ((t (:background "gray7" :foreground "gray35"))))
 '(minibuffer-prompt ((t (:foreground "white"))))
 ;; Highlight
 '(highlight ((t (:background "light gray"))))
 '(isearch ((t (:background "#55ffff" :foreground "black"))))
 '(query-replace ((t (:inherit (isearch)))))
 '(lazy-highlight ((t (:background "#ffaa33" :foreground "black"))))
 '(region ((t (:background "#444444"))))
 '(secondary-selection ((t (:background "#272822"))))
 '(trailing-whitespace ((((class color)) (:background "red")) (t (:inverse-video t))))
 '(escape-glyph ((t (:foreground "#5599ff"))))
 ;; Main
 '(font-lock-builtin-face ((t (:foreground "#ff1975"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#465457"))))
 '(font-lock-comment-face ((t (:foreground "#7f7f7f"))))
 '(font-lock-constant-face ((t (:foreground "#9955ff"))))
 '(font-lock-doc-face ((t (:foreground "#7f7f7f" :slant italic))))
 '(font-lock-function-name-face ((t (:foreground "#d9ff41" :slant italic))))
 '(font-lock-keyword-face ((t (:foreground "#ff1975"))))
 '(font-lock-negation-char-face ((t (:weight bold :foreground "#e7f6da"))))
 '(font-lock-preprocessor-face ((t (:foreground "#ffdd55"))))
 '(font-lock-regexp-grouping-backslash ((t (:weight bold))))
 '(font-lock-regexp-grouping-construct ((t (:weight bold))))
 '(font-lock-string-face ((t (:foreground "#9955ff"))))
 '(font-lock-type-face ((t (:foreground "#55ffff"))))
 '(font-lock-variable-name-face ((t (:foreground "#d9ff41"))))
 '(font-lock-warning-face ((t (:background "#ffff00" :foreground "#000000")))))

(provide-theme 'darkfruit)