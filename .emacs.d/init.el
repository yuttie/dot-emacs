(add-to-list 'load-path "~/.emacs.d/site-lisp")

;;; El-Get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(setq el-get-user-package-directory "~/.emacs.d/packages.d/")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-sources
             '(:name auto-complete
                     :pkgname "auto-complete/auto-complete"
                     :submodule nil
                     :depends (ert fuzzy popup)))
(add-to-list 'el-get-sources
             '(:name elscreen
                     :description "Screen Manager for Emacsen"
                     :type git
                     :url "https://github.com/shosti/elscreen.git"))
(add-to-list 'el-get-sources
             '(:name ert
                     :description "Emacs Lisp Regression Testing"
                     :type git
                     :url "https://github.com/ohler/ert.git"))
(add-to-list 'el-get-sources
             '(:name evil-elscreen
                     :features evil-elscreen
                     :depends (evil elscreen)))
(add-to-list 'el-get-sources
             '(:name fuzzy
                     :pkgname "auto-complete/fuzzy-el"))
(add-to-list 'el-get-sources
             '(:name icicles
                     :description "Minibuffer input completion and cycling"
                     :type git
                     :url "https://github.com/emacsmirror/icicles.git"))
(add-to-list 'el-get-sources
             '(:name jaunte
                     :description "Emacs Hit a Hint"
                     :type git
                     :url "https://github.com/kawaguchi/jaunte.el.git"))
(add-to-list 'el-get-sources
             '(:name popup
                     :pkgname "auto-complete/popup-el"))

(setq my-packages
      '(auto-complete
        c-eldoc
        deferred
        elscreen
        evil
        evil-elscreen
        evil-numbers
        evil-surround
        haskell-mode
        helm
        inertial-scroll
        jaunte
        magit
        multi-term
        popwin
        powerline
        ruby-block
        timeclock-x
        twittering-mode
        yari))

(el-get 'sync my-packages)

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

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

;;; auto indentation
(setq-default indent-tabs-mode nil)

;;; auto indentation in lisp-mode
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'lisp-mode-hook 'set-newline-and-indent)

;;; auto indentation in cc-mode
(defun my-make-CR-do-indent ()  ; from cc-mode's manual
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
(load-theme 'darkfruit t)

;;; GUI
(if window-system
  (progn
    (set-face-attribute 'default nil :family "Ricty" :height 100 :weight 'bold)
    (tool-bar-mode -1)
    (set-scroll-bar-mode 'right)
    (add-to-list 'default-frame-alist '(width . 84))))

;;; Session
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;;; Tramp
(setq tramp-default-method "sshx")

;;; completion
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

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
            (define-key org-mode-map (kbd "C-<tab>") 'elscreen-next)
            (define-key org-mode-map (kbd "C-S-<iso-lefttab>") 'elscreen-previou)))

;;; Wanderlust
;(autoload 'wl "wl" "Wanderlust" t)
;(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
;(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;;; browse-url
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")

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
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

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
          (lambda ()))

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
