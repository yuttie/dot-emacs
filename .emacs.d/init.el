;;; El-Get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-sources
             '(:name elscreen
                     :description "Screen Manager for Emacsen"
                     :type git
                     :url "https://github.com/shosti/elscreen.git"))
(add-to-list 'el-get-sources
             '(:name jaunte
                     :description "Emacs Hit a Hint"
                     :type git
                     :url "https://github.com/kawaguchi/jaunte.el.git"))

(el-get 'sync
        '("anything"
          "anything-config"
          "auto-complete"
          "c-eldoc"
          "color-theme"
          "deferred"
          "elscreen"
          "evil"
          "evil-elscreen"
          "icicles"
          "inertial-scroll"
          "jaunte"
          "multi-term"
          "popwin"
          "ruby-block"
          "timeclock-x"
          "twittering-mode"
          "yari"))

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;;; load-path
;(defun add-dir-and-subdirs-to-load-path (my-lisp-dir)
;  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;    (let ((default-directory my-lisp-dir))
;      (setq load-path (cons my-lisp-dir load-path))
;      (normal-top-level-add-subdirs-to-load-path))))
;(add-dir-and-subdirs-to-load-path "~/.emacs.d/site-lisp")

(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/vimpulse")
(add-to-list 'load-path "~/.emacs.d/site-lisp/undo-tree")
(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete")
(add-to-list 'load-path "~/.emacs.d/site-lisp/icicles")
(add-to-list 'load-path "~/.emacs.d/site-lisp/twittering-mode")
(add-to-list 'load-path "~/.emacs.d/site-lisp/anything-config")
(add-to-list 'load-path "~/.emacs.d/site-lisp/jaunte.el")
(add-to-list 'load-path "~/.emacs.d/site-lisp/popwin-el")
(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-deferred")
(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-inertial-scroll")

;;; emacs
(setq-default fill-column 80)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq default-truncate-lines t)  ;; don't wrap lines by default
(setq truncate-partial-width-windows nil)

;;; Electric Buffer Menu
(global-set-key (kbd "C-x C-b") 'electric-buffer-list)
(eval-after-load "ebuff-menu"
  '(progn
     (define-key electric-buffer-menu-mode-map (kbd "j") 'next-line)
     (define-key electric-buffer-menu-mode-map (kbd "k") 'previous-line)))

;;; language
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(setq default-input-method "japanese-skk-auto-fill")

;;; printing
;; http://aki.issp.u-tokyo.ac.jp/itoh/PukiWiki/pukiwiki.php?Emacs
(setq ps-multibyte-buffer 'non-latin-printer)

;;; Viper and Vimpulse
(setq viper-toggle-key "")
(require 'vimpulse)

(vimpulse-setq viper-inhibit-startup-message t)
(vimpulse-setq viper-expert-level 5)

(vimpulse-setq viper-auto-indent t)
(vimpulse-setq viper-electric-mode t)
(vimpulse-setq viper-case-fold-search t)
(vimpulse-setq viper-re-search t)
(vimpulse-setq viper-shift-width 4)
(vimpulse-setq viper-search-wrap-around t)
(vimpulse-setq viper-want-ctl-h-help nil)
(vimpulse-setq viper-vi-style-in-minibuffer nil)
;(vimpulse-setq viper-no-multiple-ESC nil)
(vimpulse-setq viper-keep-point-on-repeat t)

(vimpulse-define-text-object vimpulse-sexp (arg)
  "Select a S-expression."
  :keys '("ae" "ie")
  (vimpulse-inner-object-range
   arg
   'backward-sexp
   'forward-sexp))

(vimpulse-map (kbd "C-w C-c") 'delete-window)
(vimpulse-map (kbd "C-w C-s") 'split-window-vertically)
(vimpulse-map (kbd "C-w C-v") 'split-window-horizontally)
(vimpulse-map (kbd "C-w =") 'balance-windows)

;;; auto indentation
(setq-default indent-tabs-mode nil)

;;; auto indentation in lisp-mode
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'lisp-mode-hook 'set-newline-and-indent)

;;; auto indentation in cc-mode
(defun my-make-CR-do-indent ()  ; from cc-mode's manual
  (setq-default viper-auto-indent nil)
  (define-key c-mode-base-map (kbd "RET") 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-make-CR-do-indent)

;;; ispell
(setq ispell-dictionary "en")
(setq ispell-program-name "aspell")
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

;;; SKK
(require 'skk-autoloads)
(require 'skk-study)

(global-set-key (kbd "C-x C-j") 'skk-mode)
(global-set-key (kbd "C-x j") 'skk-auto-fill-mode)
(global-set-key (kbd "C-x t") 'skk-tutorial)

(setq skk-large-jisyo nil)
(setq skk-server-host "localhost")
(setq skk-use-viper t)
(setq skk-show-annotation t)
;(setq skk-use-azik t)
(setq skk-use-act t)

(add-hook 'isearch-mode-hook 'skk-isearch-mode-setup)
(add-hook 'isearch-mode-end-hook 'skk-isearch-mode-cleanup)

(setq skk-rom-kana-rule-list
      (append skk-rom-kana-rule-list
              '(("!"  nil "！")
                ("~"  nil "〜")
                ("z " nil "　")
                ("z(" nil "（")
                ("z)" nil "）"))))

(setq skk-henkan-strict-okuri-precedence t
      skk-process-okuri-early nil
      skk-henkan-okuri-strictly nil)

;;; UI
(setq inhibit-splash-screen t)
(line-number-mode 1)
(column-number-mode 1)
(global-linum-mode 1)

;;; GUI
(if window-system
  (progn
    (set-frame-font "Ricty-10")
    (add-to-list 'default-frame-alist '(font . "Ricty-10"))
    (set-fontset-font "fontset-default"
                      'japanese-jisx0208 '("Ricty" . "unicode-bmp"))
    (tool-bar-mode -1)
    (set-scroll-bar-mode 'right)
    (add-to-list 'default-frame-alist '(width . 84))))

;;; color-theme
(add-hook 'after-init-hook (lambda ()
    (require 'color-theme)
    (autoload 'color-theme-fruit "color-theme-fruit" "Fruit color theme." t)
    (autoload 'color-theme-dark-fruit "color-theme-dark-fruit" "Dark Fruit color theme." t)
    (autoload 'color-theme-tango "color-theme-tango" "A color theme based on Tango Palette." t)
    (autoload 'color-theme-tangotango "color-theme-tangotango" "A color theme based on Tango Palette colors." t)
    (eval-after-load "color-theme"
      '(progn
         (color-theme-initialize)
         (if window-system (load "color-theme-wombat"))))))

;;; inertial-scroll.el
;; http://d.hatena.ne.jp/kiwanami/20101008/1286518936
;; http://github.com/kiwanami/emacs-inertial-scroll
(require 'inertial-scroll)

(setq inertias-initial-velocity 60)
(setq inertias-initial-velocity-wheel 30)
(setq inertias-update-time (/ 1000.0 60))
(setq inertias-rest-coef 0)
(setq inertias-global-minor-mode-map
      (inertias-define-keymap
       '(("<next>"  . inertias-up)
         ("<prior>" . inertias-down)
         ("C-v"     . inertias-up)
         ("M-v"     . inertias-down)
         ("<wheel-up>"   . inertias-down-wheel)
         ("<wheel-down>" . inertias-up-wheel)
         ("<mouse-4>"    . inertias-down-wheel)
         ("<mouse-5>"    . inertias-up-wheel))
       inertias-prefix-key))
(inertias-global-minor-mode 1)  ; if comes before map, mapping doesn't work
(vimpulse-map (kbd "C-f") 'inertias-up)
(vimpulse-map (kbd "C-b") 'inertias-down)
;(global-set-key (vector mouse-wheel-down-event) 'inertias-down)
;(global-set-key (vector mouse-wheel-up-event)   'inertias-up)

;;; jaunte.el
;; http://kawaguchi.posterous.com/emacshit-a-hint
(require 'jaunte)
(global-set-key (kbd "C-c C-j") 'jaunte)

;;; popwin.el
;;; https://github.com/m2ym/popwin-el
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;;; Session
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;;; ElScreen
(setq elscreen-startup-command-line-processing nil)
(setq elscreen-prefix-key (kbd "C-z"))
(setq elscreen-display-tab t)
(setq elscreen-tab-display-control nil)
(setq elscreen-tab-display-kill-screen nil)
(add-hook 'after-init-hook (lambda ()
    (elscreen-start)
    (define-key elscreen-map (kbd "z") 'elscreen-toggle)
    (define-key elscreen-map (kbd "C-z") 'elscreen-toggle)
    (global-set-key (kbd "C-<tab>") 'elscreen-next)
    (global-set-key (kbd "C-S-<iso-lefttab>") 'elscreen-previous)
    (global-set-key (kbd "C-l") 'elscreen-next)
    (global-set-key (kbd "C-h") 'elscreen-previous)
    (vimpulse-map (kbd "C-h") 'elscreen-previous)))

;;; Tramp
(setq tramp-default-method "sshx")

;;; completion
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

;;; Icicles
(require 'icicles)
(icicle-mode 1)

(setq icicle-highlight-lighter-flag nil)
(set-face-background 'icicle-current-candidate-highlight "#c0e8ff")

;;; Anything
(require 'anything)
(require 'anything-config)
(define-key anything-map (kbd "C-p") 'anything-previous-line)
(define-key anything-map (kbd "C-n") 'anything-next-line)
(define-key viper-minibuffer-map (kbd "C-p") 'anything-previous-line)
(define-key viper-minibuffer-map (kbd "C-n") 'anything-next-line)
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

;;; Time Clock
;(require 'timeclock-x)
;(timeclock-modeline-display 1)
;(timeclock-initialize)

;;; Org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-hide-leading-stars t)
;(setq org-odd-levels-only t)
(setq org-log-done t)
(add-hook 'org-mode-hook
          (lambda ()
            (turn-on-font-lock)
            (setq viper-shift-width 2)
            (define-key org-mode-map (kbd "C-<tab>") 'elscreen-next)
            (define-key org-mode-map (kbd "C-S-<iso-lefttab>") 'elscreen-previou)
            (vimpulse-map-local (kbd "M-j") 'org-metadown)
            (vimpulse-map-local (kbd "M-k") 'org-metaup)
            (vimpulse-map-local (kbd "M-h") 'org-metaleft)
            (vimpulse-map-local (kbd "M-l") 'org-metaright)
            (vimpulse-map-local (kbd "<<") 'org-metaleft)
            (vimpulse-map-local (kbd ">>") 'org-metaright)
            (vimpulse-imap-local (kbd "M-j") 'org-metadown)
            (vimpulse-imap-local (kbd "M-k") 'org-metaup)
            (vimpulse-imap-local (kbd "M-h") 'org-metaleft)
            (vimpulse-imap-local (kbd "M-l") 'org-metaright)))

;;; Wanderlust
;(autoload 'wl "wl" "Wanderlust" t)
;(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
;(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

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
            (twittering-scroll-mode 1)
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


;;; browse-url
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")

;;; Multi Term
(autoload 'multi-term "multi-term" "Create new term buffer." t)
(eval-after-load "multi-term"
  '(progn
     (setq multi-term-program "/bin/zsh")
     (setq-default term-scroll-to-bottom-on-output 'this)
     (setq term-bind-key-alist (delq (assoc "C-s" term-bind-key-alist) term-bind-key-alist))
     (setq term-bind-key-alist (delq (assoc "C-r" term-bind-key-alist) term-bind-key-alist))
     (add-to-list 'term-bind-key-alist '("C-p" . 'term-send-raw-meta))
     (add-to-list 'term-bind-key-alist '("C-n" . 'term-send-raw-meta))
     (add-to-list 'term-bind-key-alist '("M-q" . 'term-send-raw-meta))

     (add-to-list 'term-unbind-key-list "C-w")
     (add-to-list 'term-bind-key-alist '("C-w c"   . 'delete-window))
     (add-to-list 'term-bind-key-alist '("C-w C-c" . 'delete-window))
     (add-to-list 'term-bind-key-alist '("C-w o"   . 'delete-other-windows))
     (add-to-list 'term-bind-key-alist '("C-w C-o" . 'delete-other-windows))
     (add-to-list 'term-bind-key-alist '("C-w s"   . 'split-window-vertically))
     (add-to-list 'term-bind-key-alist '("C-w C-s" . 'split-window-vertically))
     (add-to-list 'term-bind-key-alist '("C-w v"   . 'split-window-horizontally))
     (add-to-list 'term-bind-key-alist '("C-w C-v" . 'split-window-horizontally))
     (add-to-list 'term-bind-key-alist '("C-w w"   . 'vimpulse-cycle-windows))
     (add-to-list 'term-bind-key-alist '("C-w C-w" . 'vimpulse-cycle-windows))
     (add-to-list 'term-bind-key-alist '("C-w j"   . 'windmove-down))
     (add-to-list 'term-bind-key-alist '("C-w k"   . 'windmove-up))
     (add-to-list 'term-bind-key-alist '("C-w h"   . 'windmove-left))
     (add-to-list 'term-bind-key-alist '("C-w l"   . 'windmove-right))))

;;; diff-mode
(add-hook 'diff-mode-hook
          (lambda ()
            (set-face-foreground 'diff-added "#4a9400")
            (set-face-foreground 'diff-context "black")
            (set-face-foreground 'diff-file-header "#0070e6")
            (set-face-background 'diff-file-header "white")
            (set-face-foreground 'diff-function "#e06800")
            (set-face-background 'diff-function "white")
            (set-face-background 'diff-header "white")
            (set-face-foreground 'diff-hunk-header "#f030d0")
            (set-face-foreground 'diff-index "#0070e6")
            (set-face-foreground 'diff-removed "red")))

;;; Auto Complete Mode
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/dict")
(ac-config-default)

(define-key ac-completing-map (kbd "ESC")
  (lambda ()
    (interactive)
    (ac-stop)
    (viper-intercept-ESC-key)))

(add-hook 'c++-mode-hook
          '(lambda ()
             (add-to-list 'ac-sources 'ac-source-semantic)))

;;; CEDET
;(require 'cedet)

;;; eldoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;;; c-eldoc
(setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` -I./ -I../ ")
(autoload 'c-turn-on-eldoc-mode "c-eldoc" "Enable c-eldoc-mode" t)
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

;;; VC
(setq vc-handled-backends nil)  ;; disabling VC at all

;;; git
(add-hook 'git-status-mode-hook
          (lambda ()
            (define-key git-status-mode-map (kbd "j") 'git-next-file)
            (define-key git-status-mode-map (kbd "k") 'git-prev-file)
            (define-key git-status-mode-map (kbd "J") 'scroll-other-window)
            (define-key git-status-mode-map (kbd "K") 'scroll-other-window-down)))

;;; CC Mode
(add-hook 'c-mode-common-hook (lambda ()
    (setq-default c-basic-offset 4)
    (add-to-list 'c-default-style '(other . "linux"))))

;;; C++ Mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;; Python Mode
(autoload 'python-mode "python-mode.el" "Python mode." t)
(add-to-list 'auto-mode-alist '("/*.\.py$" . python-mode))
(add-to-list 'auto-mode-alist '("/wscript\\'" . python-mode))

;;; Haskell Mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;;; PKGBUILD Mode
(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(add-to-list 'auto-mode-alist '("/PKGBUILD$" . pkgbuild-mode))

;;; Auto Insert Mode
(require 'autoinsert)
(auto-insert-mode)
(define-auto-insert
  (cons "\\.\\([Hh]\\|hh\\|hpp\\)\\'" "My C / C++ header")
  '(nil
    (let* ((noext (substring buffer-file-name 0 (match-beginning 0)))
           (nopath (file-name-nondirectory noext))
           (ident (concat (upcase nopath) "_H")))
      (concat "#ifndef " ident "\n"
              "#define " ident  "\n"
              "\n"
              "\n"
              "namespace yuta {\n"
              "}  // namespace yuta\n"
              "\n"
              "\n"
              "#endif  /* " ident " */\n"))
    ))

;;; Ruby mode
(autoload 'ruby-block-mode "ruby-block" "Displays the line having keyword corresponding to END keyword." t)
(add-hook 'ruby-mode-hook
          (lambda ()
            (inf-ruby-keys)
            (setq viper-shift-width 2)
            (ruby-block-mode t)
            (setq ruby-block-highlight-toggle 'overlay)))

;;; ESS
(autoload 'R-mode "ess-site" "Major mode for editing R source." t)
(add-hook 'ess-mode-hook
          (lambda ()
            (setq ess-indent-level 2)))

(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq viper-shift-width 2)))

(setq TeX-newline-function 'reindent-then-newline-and-indent)
(setq LaTeX-item-indent 2)
(setq TeX-brace-indent-level 2)

(setq TeX-source-correlate-mode t
      TeX-source-correlate-method 'source-specials
      TeX-source-correlate-start-server t)

(setq TeX-default-mode 'japanese-latex-mode)
(setq japanese-TeX-command-default "pTeX")
(setq japanese-LaTeX-command-default "pLaTeX")
(setq japanese-LaTeX-default-style "jsarticle")
(add-hook 'LaTeX-mode-hook
          (lambda ()
            ;(add-to-list 'LaTeX-style-list '("jsresearchnote"))
            ;(setq LaTeX-command-style
            ;      (append '(("^jsresearchnote$" "%(PDF)platex %S%(PDFout)"))
            ;              LaTeX-command-style))
            (setcar (cdr (assoc "jBibTeX" japanese-TeX-command-list)) "pbibtex %s")))

(eval-after-load "tex"
  '(progn
     (add-to-list 'TeX-format-list
                  '("JLATEX" japanese-latex-mode
                    "\\\\\\(documentstyle\\|documentclass\\)[^%\n]*{\\(jsresearchnote\\)"))
     (setq TeX-view-program-list
           (list (assoc "xdvi" TeX-view-program-list-builtin)))
     (setcar (cadr (assoc "xdvi"  TeX-view-program-list)) "%(o?)pxdvi")
     (add-to-list 'TeX-command-list
                  '("PDF" "dvipdfmx %s" TeX-run-command nil t)
                  t)
     (add-to-list 'TeX-command-list
                  '("PDF B4" "dvipdfmx -p 257mm,364mm %s" TeX-run-command nil t)
                  t)
     (add-to-list 'TeX-command-list
                  '("View PDF" "evince %s.pdf" TeX-run-discard-or-function nil t)
                  t)
     ))
