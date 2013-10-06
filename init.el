(add-to-list 'load-path "~/.emacs.d/site-lisp")

;;; El-Get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(setq el-get-user-package-directory "~/.emacs.d/packages.d/")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(add-to-list 'el-get-sources
             '(:name anzu
                     :website "https://github.com/syohex/emacs-anzu"
                     :description "Emacs Port of anzu.vim"
                     :type github
                     :pkgname "syohex/emacs-anzu"))
(add-to-list 'el-get-sources
             '(:name auto-complete
                     :submodule nil))
(add-to-list 'el-get-sources
             '(:name elscreen
                     :description "Screen Manager for Emacsen"
                     :type git
                     :url "https://github.com/shosti/elscreen.git"))
(add-to-list 'el-get-sources
             '(:name emmet-mode
                     :website "https://github.com/smihica/emmet-mode"
                     :description "Unofficial Emmet's support for emacs"
                     :type github
                     :pkgname "smihica/emmet-mode"))
(add-to-list 'el-get-sources
             '(:name evil
                     :before (setq evil-search-module 'evil-search)))
(add-to-list 'el-get-sources
             '(:name evil-elscreen
                     :features evil-elscreen
                     :depends (evil elscreen)))
(add-to-list 'el-get-sources
             '(:name f
                     :description "Modern API for working with files and directories in Emacs"
                     :website "https://github.com/rejeep/f.el"
                     :type github
                     :pkgname "rejeep/f.el"
                     :depends (s dash)))
(add-to-list 'el-get-sources
             '(:name flycheck
                     :depends (s dash f cl-lib)))
(add-to-list 'el-get-sources
             '(:name flycheck-d
                     :description "This library adds D support to flycheck."
                     :website "https://github.com/tom-tan/flycheck-d"
                     :type github
                     :pkgname "tom-tan/flycheck-d"
                     :depends (flycheck dash)))
(add-to-list 'el-get-sources
             '(:name ghc-mod
                     :depends (haskell-mode)))
(add-to-list 'el-get-sources
             '(:name haskell-mode
                     :load "haskell-mode-autoloads.el"))
(add-to-list 'el-get-sources
             '(:name inertial-scroll
                     :description "Inertial scrolling for emacs"
                     :website "https://github.com/kiwanami/emacs-inertial-scroll"
                     :type github
                     :pkgname "kiwanami/emacs-inertial-scroll"
                     :features inertial-scroll
                     :depends (deferred)))
(add-to-list 'el-get-sources
             '(:name minimap
                     :description "Minimap sidebar for Emacs"
                     :type elpa
                     :features minimap))
(add-to-list 'el-get-sources
             '(:name multi-mode-util
                    :pkgname "tarao/multi-mode-util"))
(add-to-list 'el-get-sources
             '(:name popup
                     :submodule nil))
(add-to-list 'el-get-sources
             '(:name powerline
                     :website "https://github.com/milkypostman/powerline"
                     :description "Powerline for Emacs"
                     :type github
                     :pkgname "milkypostman/powerline"
                     :features powerline))
(add-to-list 'el-get-sources
             '(:name session
                     :type elpa))

(defconst my-packages
  '(ace-jump-mode
    ac-math
    auctex
    auto-complete
    auto-complete-clang
    calfw
    c-eldoc
    deferred
    d-mode
    edit-server
    elscreen
    emacs-jabber
    emmet-mode
    ess
    evil
    evil-elscreen
    evil-numbers
    evil-surround
    expand-region
    flycheck
    flycheck-d
    ghc-mod
    gtags
    haskell-mode
    helm
    helm-descbinds
    helm-ls-git
    html5
    inertial-scroll
    inf-ruby
    magit
    markdown-mode
    minimap
    mmm-mode
    multiple-cursors
    org-mode
    popwin
    powerline
    rainbow-mode
    ruby-mode
    session
    term+
    term+evil
    term+mode
    term+mux
    twittering-mode
    wanderlust
    wgrep
    yari
    yasnippet))

(el-get-cleanup my-packages)
(el-get 'sync my-packages)

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;;; emacs
(blink-cursor-mode)
(show-paren-mode t)
(setq show-paren-delay 0)
(setq-default fill-column 80)
(setq-default show-trailing-whitespace t)
(setq-default truncate-lines t)  ;; don't wrap lines by default
(setq truncate-partial-width-windows nil)

;;; UI
(setq inhibit-splash-screen t)
(line-number-mode)    ;; for the mode line
(column-number-mode)  ;; for the mode line
(setq linum-format " %3d ")
(add-hook 'prog-mode-hook #'linum-mode)
(setq-default indicate-empty-lines t)
(load-theme 'darkfruit t)
(define-key minibuffer-local-map (kbd "C-h") (kbd "DEL"))
(global-unset-key (kbd "C-x C-b"))

;;; GUI
;; https://github.com/tarao/dotfiles/blob/master/.emacs.d/init/window-system.el
(defconst default-fontset-name "myfonts")
(defconst default-base-font-name "monospace")
(defconst default-base-font-size 9)
(defconst default-ja-font-name "Migu 1M")
(defconst default-ja-font-scale 1.204)

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
             (ja-pat       (format ".*%s.*" default-ja-font-name))
             (scale        default-ja-font-scale)
             (base-font    (format "%s-%d:weight=normal:slant=normal" base size))
             (ja-font      (font-spec :family ja))
             (fsn          (concat "fontset-" fontset-name))
             (elt          (list (cons 'font fsn))))
        ;; create font
        (create-fontset-from-ascii-font base-font nil fontset-name)
        (set-fontset-font fsn 'unicode ja-font nil 'append)
        (add-to-list 'face-font-rescale-alist (cons ja-pat scale))
        ;; default
        (set-frame-font fsn nil t)
        (setq initial-frame-alist (append elt initial-frame-alist)
              default-frame-alist (append elt default-frame-alist))
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

(tool-bar-mode -1)
(set-scroll-bar-mode 'right)
(setq scroll-conservatively 101)  ;; Don't let redisplay recenter point.
(add-to-list 'default-frame-alist '(width . 84))
(global-set-key (kbd "<C-mouse-4>") #'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") #'text-scale-decrease)

;;; language
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

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
(setq-default indent-tabs-mode nil)

;;; auto indentation in lisp-mode
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") #'newline-and-indent))
(add-hook 'lisp-mode-hook #'set-newline-and-indent)

;;; auto indentation in cc-mode
(defun my-make-CR-do-indent ()  ; from cc-mode's manual
  (define-key c-mode-base-map (kbd "RET") #'c-context-line-break))
(add-hook 'c-initialization-hook #'my-make-CR-do-indent)

;;; completion
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

;;; spell check
(setq ispell-dictionary "en")
(setq ispell-program-name "aspell")
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
(add-hook 'prog-mode-hook (lambda () (flyspell-prog-mode)))

;;; SKK
(load "skk-autoloads" t)
(eval-after-load 'skk-autoloads
  '(progn
     (require 'skk-study)

     (setq default-input-method "japanese-skk-auto-fill")

     (setq skk-cdb-large-jisyo "~/.emacs.d/SKK-JISYO.L.cdb")
     (setq skk-show-annotation t)
     (setq skk-use-act t)

     (setq skk-rom-kana-rule-list
           (append skk-rom-kana-rule-list
                   '(("!"  nil "！")
                     ("~"  nil "〜")
                     ("z " nil "　")
                     ("z(" nil "（")
                     ("z)" nil "）"))))

     ;; 送り仮名の優先的なマッチ
     (setq skk-henkan-strict-okuri-precedence t
           skk-process-okuri-early nil
           skk-henkan-okuri-strictly nil)

     (global-set-key (kbd "C-x C-j") #'skk-mode)
     (global-set-key (kbd "C-x j") #'skk-auto-fill-mode)
     (global-set-key (kbd "C-x t") #'skk-tutorial)))

;;; Tramp
(setq tramp-default-method "sshx")

;;; Text mode
(add-hook 'text-mode-hook
          (lambda ()
            (auto-fill-mode)
            (flyspell-mode)))

;;; browse-url
(setq browse-url-browser-function #'browse-url-firefox)

;;; Ediff
(setq ediff-window-setup-function #'ediff-setup-windows-plain)
(setq ediff-split-window-function #'split-window-horizontally)

;;; eldoc
(add-hook 'emacs-lisp-mode-hook #'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook #'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook #'turn-on-eldoc-mode)

;;; VC
(setq vc-handled-backends nil)  ;; disabling VC at all

;;; flymake
(setq help-at-pt-timer-delay 0)
(setq help-at-pt-display-when-idle '(flymake-overlay))
(eval-after-load 'flymake
  '(progn
     (help-at-pt-set-timer)
     (global-set-key (kbd "M-n") #'flymake-goto-next-error)
     (global-set-key (kbd "M-p") #'flymake-goto-prev-error)))

;;; CC Mode
(setq-default c-basic-offset 4)
(add-to-list 'c-default-style '(other . "linux"))

;;; C++ Mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;; Python Mode
(add-to-list 'auto-mode-alist '("/wscript\\'" . python-mode))

;;; nXML Mode
(add-to-list 'auto-mode-alist '("\\.[sx]?html?\\'" . nxml-mode))

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
