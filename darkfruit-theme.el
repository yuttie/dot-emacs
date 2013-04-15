(deftheme darkfruit
  "Created 2013-03-06.")

;; Set attributes of the default face for existing frames and new frames.
(set-face-attribute 'default nil :background "#272727" :foreground "#FFFFFF")
(set-face-attribute 'cursor nil :background "#a0a0a0")

(custom-theme-set-faces
 'darkfruit
 ;; Standard
 '(default ((t (:background "#272727" :foreground "#FFFFFF"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 ;; Frame
 '(cursor ((t (:background "#a0a0a0"))))
 '(fringe ((t (:background "gray30" :foreground "gray60"))))
 '(linum ((t (:inherit (fringe)))))
 '(mode-line ((t (:background "OliveDrab3" :foreground "dark green" :box nil :weight bold))))
 '(mode-line-inactive ((t (:background "gray20" :foreground "gray50" :box nil))))
 '(powerline-active1 ((t (:background "gray34" :foreground "white"))))
 '(powerline-active2 ((t (:background "gray19" :foreground "white"))))
 '(powerline-inactive1 ((t (:background "gray15" :foreground "gray54"))))
 '(powerline-inactive2 ((t (:background "gray7" :foreground "gray35"))))
 '(minibuffer-prompt ((t (:foreground "white"))))
 ;; Highlight
 '(highlight ((t (:background "light gray"))))
 '(isearch ((t (:background "#55ddff" :foreground "black"))))
 '(query-replace ((t (:inherit (isearch)))))
 '(lazy-highlight ((t (:background "#ffaa33" :foreground "black"))))
 '(region ((t (:background "#444444"))))
 '(secondary-selection ((t (:background "#272822"))))
 '(trailing-whitespace ((((class color)) (:background "red")) (t (:inverse-video t))))
 '(escape-glyph ((t (:foreground "#5599ff"))))
 ;; Main
 '(font-lock-builtin-face ((t (:foreground "#ff1975"))))
 '(font-lock-comment-delimiter-face ((t (:inherit (font-lock-comment-face)))))
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
 '(font-lock-type-face ((t (:foreground "#55ddff"))))
 '(font-lock-variable-name-face ((t (:foreground "#d9ff41"))))
 '(font-lock-warning-face ((t (:background "#ffff00" :foreground "#000000"))))
 ;; show-paren-mode
 '(show-paren-match-face ((t (:background "white" :foreground "red"))))
 ;; auto-complete
 '(ac-completion-face ((t (:foreground "gray" :underline nil))))
 '(ac-candidate-face ((t (:background "gray20" :foreground "white"))))
 '(ac-selection-face ((t (:background "gray25" :foreground "#ff9999"))))
 ;; diff-mode
 '(diff-header ((t (:background "gray25" :foreground "#55ddff"))))
 '(diff-file-header ((t (:background "gray25" :weight bold :inherit (diff-header)))))
 '(diff-index ((t (:inherit (diff-file-header)))))
 '(diff-hunk-header ((t (:foreground "#9955ff" :inherit (diff-header)))))
 '(diff-removed ((t (:background "#553333"))))
 '(diff-added ((t (:background "#335533"))))
 '(diff-changed ((t)))
 '(diff-function ((t (:foreground "#e06800" :background "white" :inherit (diff-header)))))
 '(diff-context ((t (:foreground "gray70"))))
 '(diff-nonexistent ((t (:inherit (diff-file-header)))))
 '(diff-refine-removed ((t (:background "#aa2222"))))
 '(diff-refine-added ((t (:background "#22aa22"))))
 '(diff-refine-change ((t (:background "#aaaa22"))))
 ;; Magit
 '(magit-item-highlight ((t (:inherit nil))))
 ;; Minimap
 '(minimap-active-region-background ((t (:background "gray30"))))
 ;; Ediff
 '(ediff-current-diff-A ((t (:background "#4f3030" :foreground "white"))))
 '(ediff-current-diff-B ((t (:background "#4f3030" :foreground "white"))))
 '(ediff-current-diff-C ((t (:background "#4f3030" :foreground "white"))))
 '(ediff-fine-diff-A ((t (:background "#6f1010" :foreground "red"))))
 '(ediff-fine-diff-B ((t (:background "#6f1010" :foreground "red"))))
 '(ediff-fine-diff-C ((t (:background "#6f1010" :foreground "red"))))
 '(ediff-odd-diff-A ((t (:background "gray20" :foreground "white"))))
 '(ediff-odd-diff-B ((t (:background "gray20" :foreground "white"))))
 '(ediff-odd-diff-C ((t (:background "gray20" :foreground "white"))))
 '(ediff-even-diff-A ((t (:background "gray20" :foreground "white"))))
 '(ediff-even-diff-B ((t (:background "gray20" :foreground "white"))))
 '(ediff-even-diff-C ((t (:background "gray20" :foreground "white"))))
 ;; Helm
 '(helm-source-header ((t (:background "#272727" :foreground "#55ddff" :height 1.0))))
 '(helm-header ((t (:background "#00aad4" :foreground "#004455"))))
 '(helm-candidate-number ((t (:background "#55ddff" :foreground "#004455"))))
 '(helm-selection ((t (:background "gray25" :foreground "#ff9999" :underline nil)))))

;; highlight-parentheses
(setq hl-paren-colors '("#ff0000" "#bf4040" "#9f6060" "#8f7070" "#808080"))

(provide-theme 'darkfruit)
