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
             '(:name auto-complete
                     :submodule nil))
(add-to-list 'el-get-sources
             '(:name elscreen
                     :description "Screen Manager for Emacsen"
                     :type git
                     :url "https://github.com/shosti/elscreen.git"))
(add-to-list 'el-get-sources
             '(:name evil-elscreen
                     :features evil-elscreen
                     :depends (evil elscreen)))
(add-to-list 'el-get-sources
             '(:name ghc-mod
                     :depends (haskell-mode)))
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

(setq my-packages
      '(ace-jump-mode
        auctex
        auto-complete
        auto-complete-clang
        c-eldoc
        calfw
        deferred
        edit-server
        elscreen
        emacs-jabber
        ess
        evil
        evil-elscreen
        evil-numbers
        evil-surround
        ghc-mod
        gtags
        haskell-mode
        helm
        helm-descbinds
        highlight-parentheses
        html5
        inertial-scroll
        magit
        markdown-mode
        minimap
        multi-term
        org-mode
        popwin
        powerline
        ruby-block
        session
        twittering-mode
        wanderlust
        wgrep
        yari
        yasnippet))

(el-get 'sync my-packages)

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;;; emacs
(blink-cursor-mode)
(setq-default fill-column 80)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq default-truncate-lines t)  ;; don't wrap lines by default
(setq truncate-partial-width-windows nil)

;;; UI
(setq inhibit-splash-screen t)
(line-number-mode)    ;; for the mode line
(column-number-mode)  ;; for the mode line
(setq linum-format " %3d ")
(global-linum-mode)
(setq-default indicate-empty-lines t)
(load-theme 'darkfruit t)

;;; GUI
(set-face-attribute 'default nil :family "Ricty" :height 100 :weight 'bold)
(tool-bar-mode -1)
(set-scroll-bar-mode 'right)
(setq scroll-conservatively 101)  ;; Don't let redisplay recenter point.
(add-to-list 'default-frame-alist '(width . 84))
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

;;; language
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;;; printing
;; http://aki.issp.u-tokyo.ac.jp/itoh/PukiWiki/pukiwiki.php?Emacs
(setq ps-multibyte-buffer 'non-latin-printer)

;;; history
(setq history-length 10000)
(setq recentf-max-saved-items 10000)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

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

     (global-set-key (kbd "C-x C-j") 'skk-mode)
     (global-set-key (kbd "C-x j") 'skk-auto-fill-mode)
     (global-set-key (kbd "C-x t") 'skk-tutorial)))

;;; Tramp
(setq tramp-default-method "sshx")

;;; Text mode
(add-hook 'text-mode-hook
          (lambda ()
            (auto-fill-mode)
            (flyspell-mode)))

;;; Org mode
(setq org-log-done t)
(add-hook 'org-mode-hook
          (lambda ()
            (turn-on-font-lock)
            (set (make-local-variable 'system-time-locale) "C")))
(eval-after-load 'elscreen
  '(add-hook 'org-mode-hook
             (lambda ()
               (define-key org-mode-map (kbd "C-<tab>") 'elscreen-next)
               (define-key org-mode-map (kbd "C-S-<iso-lefttab>") 'elscreen-previous))))

;;; browse-url
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

;;; Ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;;; eldoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;;; VC
(setq vc-handled-backends nil)  ;; disabling VC at all

;;; flymake
(setq help-at-pt-timer-delay 0)
(setq help-at-pt-display-when-idle '(flymake-overlay))
(eval-after-load 'flymake
  '(progn
     (help-at-pt-set-timer)
     (global-set-key (kbd "M-n") 'flymake-goto-next-error)
     (global-set-key (kbd "M-p") 'flymake-goto-prev-error)))

;;; CC Mode
(add-hook 'c-mode-common-hook (lambda ()
    (setq-default c-basic-offset 4)
    (add-to-list 'c-default-style '(other . "linux"))))

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

;;; Ruby mode
(add-hook 'ruby-mode-hook
          (lambda ()
            (ruby-block-mode t)
            (setq ruby-block-highlight-toggle 'overlay)))
