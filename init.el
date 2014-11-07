;;; Startup
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;;; Frame
(set-scroll-bar-mode 'right)
(tool-bar-mode 0)
(add-to-list 'initial-frame-alist '(tool-bar-lines . 0))

;;; load-path
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp"))

;;; Measure the execution time of those functions
(require 'initchart)
(initchart-record-execution-time-of load file)
(initchart-record-execution-time-of require feature)
(initchart-record-execution-time-of el-get-load-package-user-init-file package)

;;; El-Get
(add-to-list 'load-path (expand-file-name "~/.emacs.d/el-get/el-get"))
(setq el-get-user-package-directory "~/.emacs.d/packages.d/")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(add-to-list 'el-get-sources
             '(:name ace-jump-mode
                     :features nil))
(add-to-list 'el-get-sources
             '(:name auto-complete
                     :submodule nil))
(add-to-list 'el-get-sources
             '(:name auto-complete-clang
                     :pkgname "yuttie/auto-complete-clang"
                     :branch "fix-missing-standard-include-files"))
(add-to-list 'el-get-sources
             '(:name auto-complete-auctex
                     :description "auto-completion for auctex"
                     :website "https://github.com/monsanto/auto-complete-auctex"
                     :type github
                     :pkgname "monsanto/auto-complete-auctex"
                     :depends (auctex auto-complete yasnippet)))
(add-to-list 'el-get-sources
             '(:name d-mode
                     :description "An Emacs mode for D code."
                     :website "https://github.com/Emacs-D-Mode-Maintainers/Emacs-D-Mode"
                     :type github
                     :pkgname "Emacs-D-Mode-Maintainers/Emacs-D-Mode"))
(add-to-list 'el-get-sources
             '(:name elscreen
                     :description "Screen Manager for Emacsen"
                     :type github
                     :pkgname "shosti/elscreen"))
(add-to-list 'el-get-sources
             '(:name ess
                     :features nil))
(add-to-list 'el-get-sources
             '(:name evil
                     :before (setq evil-search-module 'evil-search)))
(add-to-list 'el-get-sources
             '(:name evil-elscreen
                     :features evil-elscreen
                     :depends (evil elscreen)))
(add-to-list 'el-get-sources
             '(:name evil-matchit
                     :description "Vim matchit ported into Emacs"
                     :website "https://github.com/redguardtoo/evil-matchit"
                     :type github
                     :pkgname "redguardtoo/evil-matchit"
                     :depends (evil)))
(add-to-list 'el-get-sources
             '(:name expand-region
                     :features nil))
(add-to-list 'el-get-sources
             '(:name f
                     :depends (s dash)))
(add-to-list 'el-get-sources
             '(:name flycheck-d-unittest
                     :description "This library adds D unittest support to flycheck."
                     :website "https://github.com/flycheck/flycheck-d-unittest"
                     :type github
                     :pkgname "flycheck/flycheck-d-unittest"
                     :depends (flycheck dash)))
(add-to-list 'el-get-sources
             '(:name flycheck-haskell
                     :description "Improved Haskell support for Flycheck"
                     :website "https://github.com/flycheck/flycheck-haskell"
                     :type github
                     :pkgname "flycheck/flycheck-haskell"
                     :depends (flycheck haskell-mode dash f)
                     :post-init (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))))
(add-to-list 'el-get-sources
             '(:name ghc-mod
                     :depends (haskell-mode)))
(add-to-list 'el-get-sources
             '(:name git-gutter+
                     :description "Manage Git hunks straight from the buffer"
                     :website "https://github.com/nonsequitur/git-gutter-plus"
                     :type github
                     :pkgname "nonsequitur/git-gutter-plus"
                     :depends (git-modes)))
(add-to-list 'el-get-sources
             '(:name git-gutter-fringe+
                     :description "Fringe version of git-gutter+.el"
                     :website "https://github.com/nonsequitur/git-gutter-fringe-plus"
                     :type github
                     :pkgname "nonsequitur/git-gutter-fringe-plus"
                     :depends (git-gutter+ fringe-helper)))
(add-to-list 'el-get-sources
             '(:name haskell-mode
                     :post-init (require 'haskell-mode-autoloads)))
(add-to-list 'el-get-sources
             '(:name html5
                     :features nil))
(add-to-list 'el-get-sources
             '(:name inertial-scroll
                     :description "Inertial scrolling for emacs"
                     :website "https://github.com/kiwanami/emacs-inertial-scroll"
                     :type github
                     :pkgname "yuttie/emacs-inertial-scroll"
                     :features inertial-scroll
                     :depends (deferred)))
(add-to-list 'el-get-sources
             '(:name multi-mode-util
                    :pkgname "tarao/multi-mode-util"))
(add-to-list 'el-get-sources
             '(:name multiple-cursors
                     :features nil))
(add-to-list 'el-get-sources
             '(:name popup
                     :submodule nil))
(add-to-list 'el-get-sources
             '(:name search-web
                     :description "Post web search queries using `browse-url'"
                     :website "https://github.com/tomoya/search-web.el"
                     :type github
                     :pkgname "tomoya/search-web.el"
                     :features search-web))
(add-to-list 'el-get-sources
             '(:name steady-theme-emacs
                     :description "A steady theme for Emacs"
                     :website "https://github.com/yuttie/steady-theme-emacs"
                     :type github
                     :pkgname "yuttie/steady-theme-emacs"
                     :post-init (add-to-list 'custom-theme-load-path default-directory)))
(add-to-list 'el-get-sources
             '(:name structured-haskell-mode
                     :description "Structured editing minor mode for Haskell in Emacs"
                     :website "https://github.com/chrisdone/structured-haskell-mode"
                     :type github
                     :pkgname "chrisdone/structured-haskell-mode"))
(add-to-list 'el-get-sources
             '(:name tuareg-mode
                     :description "A  GOOD Emacs mode to edit Objective Caml code."
                     :website "https://github.com/ocaml/tuareg"
                     :type github
                     :pkgname "ocaml/tuareg"
                     :load-path (".")))
(add-to-list 'el-get-sources
             '(:name twittering-mode
                     :features nil))

(defconst my-packages
  '(ace-jump-mode
    ac-math
    ag
    auctex
    auto-complete
    auto-complete-auctex
    auto-complete-clang
    calfw
    caml-mode
    c-eldoc
    deferred
    d-mode
    edit-server
    elscreen
    ;;emacs-jabber  ; this package fails to install
    emmet-mode
    ess
    evil
    evil-elscreen
    evil-matchit
    evil-numbers
    evil-surround
    expand-region
    flycheck
    flycheck-d-unittest
    flycheck-haskell
    ghc-mod
    git-gutter+
    git-gutter-fringe+
    gtags
    haskell-mode
    helm
    helm-descbinds
    helm-ls-git
    hlinum
    html5
    inertial-scroll
    inf-ruby
    magit
    markdown-mode
    mmm-mode
    multiple-cursors
    org-mode
    popwin
    powerline
    rainbow-mode
    ruby-mode
    search-web
    session
    steady-theme-emacs
    term+
    term+evil
    term+mode
    term+mux
    tuareg-mode
    twittering-mode
    wanderlust
    wgrep
    yari
    yasnippet))

(el-get-cleanup my-packages)
(el-get 'sync my-packages)

;;; package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

;;; emacs
(blink-cursor-mode)
(show-paren-mode t)
(setq show-paren-delay 0)
(setq-default fill-column 80)
(setq-default show-trailing-whitespace t)
(setq-default truncate-lines t)  ;; don't wrap lines by default
(setq truncate-partial-width-windows nil)

;;; UI
(line-number-mode)    ;; for the mode line
(column-number-mode)  ;; for the mode line
(setq linum-format " %3d ")
(setq-default indicate-empty-lines t)
(load-theme 'steady-dark t)
(define-key minibuffer-local-map (kbd "C-h") (kbd "DEL"))
(defun swap-C-x-and-C-t (frame)
  (with-selected-frame frame
    (keyboard-translate ?\C-t ?\C-x)
    (keyboard-translate ?\C-x ?\C-t)))
(swap-C-x-and-C-t (selected-frame))
(add-hook 'after-make-frame-functions #'swap-C-x-and-C-t)
(setq revert-without-query '(".*"))

;;; GUI (except for appearance)
(setq scroll-conservatively 101)  ;; Don't let redisplay recenter point.
(add-to-list 'default-frame-alist '(width . 84))
(global-set-key (kbd "<C-mouse-4>") #'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") #'text-scale-decrease)

;;; Font
;; https://github.com/tarao/dotfiles/blob/master/.emacs.d/init/window-system.el
(defconst default-fontset-name "myfonts")
(defconst default-base-font-name "Anonymous Pro")
(defconst default-ja-font-name "M+ 1m regular")
(defconst default-ja-font-xlfd-pattern (format ".*%s.*" (rx "M+ 1m")))
(cond
 ((string= system-type "darwin")
  (defconst default-base-font-size 12)
  (defconst default-ja-font-scale 1.605))
 (t
  (defconst default-base-font-size 8)
  (defconst default-ja-font-scale 1.104)))

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
             (base-font    (format "%s-%d:weight=normal:slant=normal" base size))
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
        (remove-hook 'after-init-hook #'setup-window-system-configuration)
        (remove-hook 'after-make-frame-functions
                     #'setup-window-system-configuration)))))

(when window-system
  (if after-init-time
      ;; already initialized
      (setup-window-system-configuration)
    (add-hook 'after-init-hook #'setup-window-system-configuration)))
(add-hook 'after-make-frame-functions #'setup-window-system-configuration)

;;; language
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;;; programming
(add-hook 'prog-mode-hook #'linum-mode)
(add-hook 'prog-mode-hook #'flyspell-prog-mode)
(eval-after-load 'whitespace
  '(progn
     (setq whitespace-style '(face lines-tail))
     (setq whitespace-line-column 80)))

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
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

;;; desktop
(setq desktop-path '("."))

;;; SKK
(load "skk-autoloads" t)
(eval-after-load 'skk-autoloads
  '(progn
     (require 'skk-study)

     (setq default-input-method "japanese-skk")

     (setq skk-cdb-large-jisyo "~/.emacs.d/SKK-JISYO.L.cdb")
     (setq skk-show-annotation t)
     (setq skk-show-inline 'vertical)
     (setq skk-use-act t)

     (setq skk-rom-kana-rule-list
           (append skk-rom-kana-rule-list
                   '(("!"  nil "！")
                     ("~"  nil "〜")
                     ("z " nil "　")
                     ("z(" nil "（")
                     ("z)" nil "）"))))

     ;; 送り仮名の厳密なマッチ
     (setq skk-henkan-okuri-strictly t)
     (setq skk-process-okuri-early nil)
     (add-hook 'minibuffer-setup-hook
               (lambda ()
                 (if (and (boundp 'skk-henkan-okuri-strictly)
                          skk-henkan-okuri-strictly
                          (not (eq last-command 'skk-purge-from-jisyo)))
                     (progn
                       (setq skk-henkan-okuri-strictly nil)
                       (put 'skk-henkan-okuri-strictly 'temporary-nil t)))))
     (add-hook 'minibuffer-exit-hook
               (lambda ()
                 (if (and (get 'skk-henkan-okuri-strictly 'temporary-nil)
                          (<= (minibuffer-depth) 1))
                     (progn
                       (put 'skk-henkan-okuri-strictly 'temporary-nil nil)
                       (setq skk-henkan-okuri-strictly t)))))

     (global-set-key (kbd "C-x C-j") #'skk-auto-fill-mode)
     (global-set-key (kbd "C-x j") #'skk-mode)
     (global-set-key (kbd "C-x t") #'skk-tutorial)))

;;; Tramp
(setq tramp-default-method "sshx")

;;; Text mode
(add-hook 'text-mode-hook
          (lambda ()
            (flyspell-mode)))

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

;;; eldoc
(add-hook 'emacs-lisp-mode-hook #'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook #'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook #'turn-on-eldoc-mode)

;;; VC
(setq vc-handled-backends nil)  ;; disabling VC at all

;;; CC Mode
(setq-default c-basic-offset 4)
(setq c-default-style '((java-mode . "java") (awk-mode . "awk") (other . "linux")))

;;; C++ Mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;; Python Mode
(add-to-list 'auto-mode-alist '("/wscript\\'" . python-mode))

;;; nXML Mode
(add-to-list 'auto-mode-alist '("\\.[sx]?html?\\'" . nxml-mode))
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
(setq opam-share (substring (shell-command-to-string "opam config var share") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(autoload 'merlin-mode "merlin" "Merlin mode" t)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode t)
(add-hook 'merlin-mode-hook
          (lambda ()
            (flycheck-mode -1)
            (global-unset-key (kbd "M-p"))
            (global-set-key (kbd "M-n") #'merlin-error-next)))
