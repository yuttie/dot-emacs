;;; Search engines
(setq search-engines
      '(("Add-ons for Firefox"               . "https://addons.mozilla.org/en-US/firefox/search/?q=%s")
        ("Amazon.co.jp"                      . "http://www.amazon.co.jp/s/ref=nb_sb_noss?__mk_ja_JP=%u30AB%u30BF%u30AB%u30CA&url=search-alias%3Daps&field-keywords=%s")
        ("Bing"                              . "http://www.bing.com/search?q=%s")
        ("BlenderWiki"                       . "http://wiki.blender.org/index.php/Special:Search?search=%s")
        ("cpprefjp - C++ Library Reference"  . "https://sites.google.com/site/cpprefjp/system/app/pages/search?scope=search-site&q=%s")
        ("D Programming Language"            . "http://google.com/search?q=%s&domains=dlang.org&sourceid=google-search&sitesearch=dlang.org")
        ("EmacsWiki"                         . "http://www.emacswiki.org/cgi-bin/emacs?search=%s")
        ("Gentoo Portage Overlays"           . "http://gpo.zugaina.org/Search?search=%s")
        ("Gmail"                             . "https://mail.google.com/mail/u/0/?q=%s")
        ("Google"                            . "https://www.google.com/search?q=%s")
        ("Google define:?"                   . "https://www.google.com/search?q=define%3A%s")
        ("Google Scholar"                    . "https://scholar.google.com/scholar?hl=en&q=%s&as_sdt=1%2C5&as_sdtp=")
        ("Hayoo!"                            . "http://holumbus.fh-wedel.de/hayoo/hayoo.html?query=%s")
        ("Hoogle"                            . "http://hoogle.botis.org/?hoogle=%s")
        ("jQuery API Documentation"          . "http://api.jquery.com/?s=%s")
        ("Microsoft Academic Search"         . "http://academic.research.microsoft.com/Search?query=%s")
        ("Mozilla Developer Network"         . "https://developer.mozilla.org/en-US/search?q=%s")
        ("Phobos Runtime Library"            . "http://google.com/search?q=%s&domains=dlang.org&sourceid=google-search&sitesearch=dlang.org/phobos")
        ("Python documentation"              . "http://docs.python.org/3/search.html?q=%s")
        ("Ruby-Doc.org"                      . "http://ruby-doc.com/search.html?q=%s")
        ("RubyGems.org"                      . "http://rubygems.org/search?query=%s")
        ("Stack Overflow"                    . "http://stackoverflow.com/search?q=%s")
        ("The Free Dictionary"               . "http://www.thefreedictionary.com/_/search.aspx?charset=utf-8&Word=%s")
        ("Wikipedia (en)"                    . "http://en.wikipedia.org/w/index.php?search=%s")
        ("Wikipedia (ja)"                    . "http://ja.wikipedia.org/w/index.php?search=%s")
        ("Wiktionary"                        . "http://en.wiktionary.org/wiki/Special:Search?search=%s")
        ("英辞郎 on the WEB"                 . "http://eow.alc.co.jp/search?q=%s")))

;;; Override so that it returns names in the original order
(defun make-search-engine-name-list ()
  (mapcar 'car search-engines))

;;; Search Web for the region or the word at point
(defun search-web-region-or-at-point (&optional engine)
  (interactive)
  (let ((completion-ignore-case t)
        (engine (or engine
                    (completing-read "Search Engine: " (make-search-engine-name-list) nil t))))
    (cond ((use-region-p) (let ((beg (mark))
                                (end (point)))
                            (search-web engine (buffer-substring-no-properties beg end))))
          (t (search-web engine (substring-no-properties (thing-at-point 'word)))))))

;;; Key bindings
(defmacro make-search-command (engine)
  `(lambda () (interactive) (search-web-region-or-at-point ,engine)))

(global-set-key (kbd "M-s e") (make-search-command "英辞郎 on the WEB"))
(global-set-key (kbd "M-s g") (make-search-command "Google"))
(global-set-key (kbd "M-s m") (make-search-command "Mozilla Developer Network"))
(global-set-key (kbd "M-s w") (make-search-command "Wikipedia (en)"))

(eval-after-load 'evil
  '(progn
     (define-key evil-normal-state-map (kbd "g s e") (make-search-command "英辞郎 on the WEB"))
     (define-key evil-normal-state-map (kbd "g s g") (make-search-command "Google"))
     (define-key evil-normal-state-map (kbd "g s m") (make-search-command "Mozilla Developer Network"))
     (define-key evil-normal-state-map (kbd "g s w") (make-search-command "Wikipedia (en)"))))
