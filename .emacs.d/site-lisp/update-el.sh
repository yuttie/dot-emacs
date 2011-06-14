#!/bin/sh

(cd anything-config; git pull)
(cd auto-complete; git pull)
(cd emacs-deferred; git pull)
(cd emacs-inertial-scroll; git pull)
(cd jaunte.el; git pull)
(cd popwin-el; git pull)
(cd twittering-mode; git pull)
(cd undo-tree; git pull)
(cd vimpulse; git pull)

emacs -L ~/.emacs.d/site-lisp/anything-config \
      -L ~/.emacs.d/site-lisp/anything-config/extensions \
      -L ~/.emacs.d/site-lisp/auto-complete \
      -L ~/.emacs.d/site-lisp/emacs-deferred \
      -L ~/.emacs.d/site-lisp/icicles \
      -L ~/.emacs.d/site-lisp/popwin-el \
      -L ~/.emacs.d/site-lisp/vimpulse \
      --quick -batch --funcall batch-byte-recompile-directory ~/.emacs.d/site-lisp
      #--quick -batch --funcall batch-byte-compile ~/.emacs.d/site-lisp/**/*.el
