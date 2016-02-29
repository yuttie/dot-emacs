;;; -*- lexical-binding: t; -*-

;;; Decrease the number of GCs during startup
(let ((gc-cons-threshold-original gc-cons-threshold))
  (setq gc-cons-threshold (* 64 1024 1024))  ; 64 MiB
  (add-hook 'after-init-hook
            (lambda ()
              (setq gc-cons-threshold gc-cons-threshold-original))))

;;; Startup
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;;; Frame
(set-scroll-bar-mode 'right)
(tool-bar-mode 0)
(add-to-list 'initial-frame-alist '(tool-bar-lines . 0))
(add-to-list 'initial-frame-alist '(right-divider-width . 1))
(add-to-list 'initial-frame-alist '(bottom-divider-width . 0))

;;; load-path
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp"))

;;; Measure the execution time of those functions
(require 'initchart)
(initchart-record-execution-time-of load file)
(initchart-record-execution-time-of require feature)
(initchart-record-execution-time-of load-theme theme)
(initchart-record-execution-time-of el-get-do-init package)
(initchart-record-execution-time-of el-get-load-package-user-init-file package)
(add-hook 'after-init-hook
          (lambda ()
            (let* ((filename (format-time-string "initchart_%Y-%m-%d-%H%M%S.svg"))
                   (filepath (concat user-emacs-directory "/" filename)))
              (initchart-visualize-init-sequence filepath)))
          t)

;;; Space-prefixed map
(define-prefix-command 'space-prefixed-map)
(with-eval-after-load 'evil
  (define-key evil-motion-state-map (kbd "SPC") #'space-prefixed-map))

;;; El-Get
(add-to-list 'load-path (expand-file-name "~/.emacs.d/el-get/el-get"))
(setq el-get-user-package-directory "~/.emacs.d/packages.d/")
(setq el-get-git-shallow-clone t)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(setq recipe-fixes
      '((:name company-auctex
               :depends (yasnippet company-mode auctex))
        (:name company-quickhelp
               :depends (company-mode pos-tip))
        (:name company-statistics
               :depends (company-mode))
        (:name company-web
               :depends (company-mode dash web-completion-data))
        (:name ddskk
               :features nil)
        (:name evil
               :before (setq evil-search-module 'evil-search))
        (:name evil-elscreen
               :features evil-elscreen
               :depends (evil elscreen))
        (:name flycheck-pos-tip
               :shallow nil
               :checkout "472fa870")
        (:name ghc-mod
               :depends (haskell-mode))
        (:name haskell-mode
               :post-init (require 'haskell-mode-autoloads))
        (:name multi-mode-util
               :pkgname "tarao/multi-mode-util")
        (:name session
               :load-path (".")
               :url  "http://downloads.sourceforge.net/project/emacs-session/session-2.4a.tar.gz")
        (:name twittering-mode
               :features nil)))
(setq el-get-sources (append recipe-fixes el-get-sources))

(el-get-bundle use-package)  ; Initialize 'use-package' prior to other packages

(defconst my-packages
  '(;; Evil must be initialized earlier than packages that use the evil-define-key macro
    evil
    ;;
    ace-window
    ag
    aggressive-indent-mode
    avy
    calfw
    ddskk
    deferred
    delight
    dired+
    edit-server
    elscreen
    elscreen-persist
    ;;emacs-jabber  ; this package fails to install
    company-mode
    company-quickhelp
    esup
    evil-elscreen
    evil-matchit
    evil-mc
    evil-nerd-commenter
    evil-numbers
    evil-org-mode
    evil-smartparens
    evil-surround
    expand-region
    flycheck
    flycheck-pos-tip
    gtags
    helm
    helm-ag
    helm-descbinds
    helm-ls-git
    highlight-numbers
    highlight-quoted
    highlight-symbol
    hlinum
    htmlize
    indent-guide
    inertial-scroll
    popwin
    powerline
    projectile
    rainbow-mode
    search-web
    session
    smartparens
    smooth-scrolling
    speed-type
    term+
    term+evil
    term+mode
    term+mux
    twittering-mode
    use-package
    vimish-fold
    wanderlust
    wgrep
    which-key
    yasnippet
    zsh-history
    ;; Theme
    hydrangea-theme
    ;; Git
    git-gutter+
    git-gutter-fringe+
    git-modes
    magit
    ;; C/C++
    c-eldoc
    company-c-headers
    ;; D
    d-mode
    flycheck-d-unittest
    ;; Elisp
    macrostep
    ;; Haskell
    company-cabal
    company-ghc
    flycheck-haskell
    ghc-mod
    haskell-mode
    ;; LaTeX
    auctex
    company-auctex
    ;; Lightweight Markup Languages
    adoc-mode
    markdown-mode
    org-mode
    ;; Nim
    nim-mode
    ;; OCaml
    caml-mode
    tuareg-mode
    ;; R
    company-statistics
    ess
    ;; Ruby
    company-inf-ruby
    inf-ruby
    robe-mode
    ruby-mode
    yari
    ;; Rust
    racer
    rust-mode
    ;; Web
    company-web
    emmet-mode
    json-mode
    less-css-mode
    mmm-mode
    php-eldoc
    php-mode
    web-mode
    ))

(el-get-cleanup my-packages)
(el-get 'sync my-packages)

;;; package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

;;; Open configuration files quickly
(defmacro with-default-directory (directory &rest body)
  (declare (indent 2) (debug t))
  `(let ((default-directory (or (and ,directory
                                     (file-name-as-directory ,directory))
                                default-directory)))
     ,@body))
(defun find-user-emacs-file ()
  (interactive)
  (if (require 'helm-files nil t)
      (helm-find-files-1 (concat user-emacs-directory "/"))
    (with-default-directory user-emacs-directory
        (call-interactively #'find-file))))
(defun find-package-config-file ()
  (interactive)
  (if (require 'helm-files nil t)
      (helm-find-files-1 (concat el-get-user-package-directory "/"))
    (with-default-directory el-get-user-package-directory
        (call-interactively #'find-file))))
(define-prefix-command 'dot-files-map)
(global-set-key (kbd "C-x .") #'dot-files-map)
(define-key dot-files-map (kbd "e") #'find-user-emacs-file)
(define-key dot-files-map (kbd "p") #'find-package-config-file)

;;; emacs
(blink-cursor-mode)
(show-paren-mode t)
(setq show-paren-delay 0)
(setq-default fill-column 80)
(setq-default truncate-lines t)  ;; don't wrap lines by default
(setq-default bidi-display-reordering nil)  ; http://emacs.stackexchange.com/questions/598/how-do-i-handle-files-with-extremely-long-lines/603#603
(setq truncate-partial-width-windows nil)
(setq x-select-enable-clipboard nil)
(define-key key-translation-map (kbd "C-h") (kbd "DEL"))

;;; UI
(menu-bar-mode -1)
(scroll-bar-mode -1)
(line-number-mode)    ;; for the mode line
(column-number-mode)  ;; for the mode line
(setq linum-format " %3d ")
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq-default indicate-empty-lines t)
(load-theme 'hydrangea t)
(defun swap-C-x-and-C-t (frame)
  (with-selected-frame frame
    (keyboard-translate ?\C-t ?\C-x)
    (keyboard-translate ?\C-x ?\C-t)))
(swap-C-x-and-C-t (selected-frame))
(add-hook 'after-make-frame-functions #'swap-C-x-and-C-t)
(setq revert-without-query '(".*"))

;;; GUI (except for appearance)
(setq scroll-conservatively 101)  ;; Don't let redisplay recenter point.
(setq scroll-margin 2)
(add-to-list 'default-frame-alist '(width . 84))
(global-set-key (kbd "<C-mouse-4>") #'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") #'text-scale-decrease)

;;; Font
;; https://github.com/tarao/dotfiles/blob/master/.emacs.d/init/window-system.el
;; ABCDEabcde1234567890ABCDEabcde1234567890ABCDEabcde1234567890ABCDEabcde1234567890
;; あいうえおあいうえおかきくけこかきくけこあいうえおあいうえおかきくけこかきくけこ
(defconst default-fontset-name "myfonts")
(defconst default-base-font-name "Midway")
(defconst default-ja-font-name "M+ 1m regular")
(defconst default-ja-font-xlfd-pattern (format ".*%s.*" (rx "M+ 1m")))
(cond
 ((string= system-type "darwin")
  (defconst default-base-font-size 12)
  (defconst default-ja-font-scale 1.605))
 (t
  (defconst default-base-font-size 8.5)
  (defconst default-ja-font-scale 1.200)))

(defun setup-window-system-configuration (&optional frame)
  "Initialize configurations for window system.
Configurations, which require X (there exists a frame), are
placed in this function.

When Emacs is started as a GUI application, just running this
function initializes the configurations.

When Emacs is started as a daemon, this function should be called
just after the first frame is created by a client. For this,
this function is added to `after-make-frame-functions' and
removed from them after the first call."
  (with-selected-frame (or frame (selected-frame))
    (when window-system
      (let* ((fontset-name default-fontset-name)
             (base         default-base-font-name)
             (size         default-base-font-size)
             (ja           default-ja-font-name)
             (ja-pat       default-ja-font-xlfd-pattern)
             (scale        default-ja-font-scale)
             (base-font    (format "%s-%f:weight=normal:slant=normal" base size))
             (ja-font      (font-spec :family ja))
             (fsn          (concat "fontset-" fontset-name))
             (elt          `(font . ,fsn)))
        ;; create font
        (create-fontset-from-ascii-font base-font nil fontset-name)
        (set-fontset-font fsn 'unicode ja-font nil 'append)
        (add-to-list 'face-font-rescale-alist (cons ja-pat scale))
        ;; default
        (set-frame-font fsn nil t)
        (add-to-list 'initial-frame-alist elt)
        (add-to-list 'default-frame-alist elt)
        ;; current frame
        (set-frame-parameter (selected-frame) 'font fsn)
        ;; call once
        (remove-hook 'window-setup-hook #'setup-window-system-configuration)
        (remove-hook 'after-make-frame-functions
                     #'setup-window-system-configuration)))))

(when window-system
  (add-hook 'window-setup-hook #'setup-window-system-configuration t))
(add-hook 'after-make-frame-functions #'setup-window-system-configuration)

;;; language
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;;; programming
(add-hook 'prog-mode-hook #'linum-mode)
(add-hook 'prog-mode-hook #'flyspell-prog-mode)
(add-hook 'prog-mode-hook (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'prog-mode-hook (lambda () (setq show-trailing-whitespace t)))
(with-eval-after-load 'whitespace
  (setq whitespace-style '(face lines-tail))
  (setq whitespace-line-column 80))

;;; printing
;; http://aki.issp.u-tokyo.ac.jp/itoh/PukiWiki/pukiwiki.php?Emacs
(setq ps-multibyte-buffer 'non-latin-printer)

;;; history
(setq history-length 10000)
(setq recentf-max-saved-items 10000)

;;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;; auto indentation
(electric-indent-mode)
(setq-default indent-tabs-mode nil)

;;; completion
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

;;; spell check
(setq ispell-dictionary "en")
(setq ispell-program-name "aspell")
(with-eval-after-load "ispell"
  (add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
(setq flyspell-delay 0)

;;; desktop
(setq desktop-path '("."))

;;; Tramp
(setq tramp-default-method "sshx")

;;; Text mode
(add-hook 'text-mode-hook
          (lambda ()
            (flyspell-mode)))

;;; align
(define-key space-prefixed-map (kbd "a") #'align-regexp)

;;; browse-url
(setq browse-url-browser-function #'browse-url-firefox)

;;; diff-mode
(add-hook 'diff-mode-hook
          (lambda ()
            (diff-auto-refine-mode)))

;;; dired
(add-hook 'dired-mode-hook
          (lambda ()
            (hl-line-mode)))

;;; Ediff
(setq ediff-window-setup-function #'ediff-setup-windows-plain)
(setq ediff-split-window-function #'split-window-horizontally)

;;; generic-x
(require 'generic-x)

;;; Lisp
(add-hook 'lisp-mode-hook             #'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook       #'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook #'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook             #'turn-on-eldoc-mode)
(add-hook 'lisp-mode-hook             (lambda () (modify-syntax-entry ?- "w")))
(add-hook 'emacs-lisp-mode-hook       (lambda () (modify-syntax-entry ?- "w")))
(add-hook 'lisp-interaction-mode-hook (lambda () (modify-syntax-entry ?- "w")))
(add-hook 'ielm-mode-hook             (lambda () (modify-syntax-entry ?- "w")))

;;; VC
(setq vc-handled-backends nil)  ;; disabling VC at all

;;; sh-mode
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.xprofile\\'" . sh-mode))

;;; CC Mode
(setq-default c-basic-offset 4)
(setq c-default-style '((java-mode . "java") (awk-mode . "awk") (other . "linux")))

;;; C++ Mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;; Python Mode
(add-to-list 'auto-mode-alist '("/wscript\\'" . python-mode))

;;; nXML Mode
(defun nxml-prettify-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n"))
    (indent-region begin end)))

;;; Merlin for OCaml
;; ocamlmerlin must be available in a directory in PATH
(let ((opam-share-dir (shell-command-to-string "opam config var share 2> /dev/null")))
  (if (string= opam-share-dir "")
      (message "You may need to run `opam init` first.")
    (add-to-list 'load-path (concat (substring opam-share-dir 0 -1) "/emacs/site-lisp"))))
(autoload 'merlin-mode "merlin" "Merlin mode" t)
(add-hook 'tuareg-mode-hook #'merlin-mode t)
(add-hook 'caml-mode-hook #'merlin-mode t)
(with-eval-after-load 'merlin
  (with-eval-after-load 'company
    (add-to-list 'company-backends #'merlin-company-backend)))
(setq merlin-command 'opam)
(add-hook 'merlin-mode-hook
          (lambda ()
            (flycheck-mode -1)
            (global-unset-key (kbd "M-p"))
            (global-set-key (kbd "M-n") #'merlin-error-next)))
