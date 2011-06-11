#!/bin/sh

# required libraries
wget --wait=2 \
     http://www.emacswiki.org/emacs/download/icicles.el \
     http://www.emacswiki.org/emacs/download/icicles-chg.el \
     http://www.emacswiki.org/emacs/download/icicles-cmd1.el \
     http://www.emacswiki.org/emacs/download/icicles-cmd2.el \
     http://www.emacswiki.org/emacs/download/icicles-doc1.el \
     http://www.emacswiki.org/emacs/download/icicles-doc2.el \
     http://www.emacswiki.org/emacs/download/icicles-face.el \
     http://www.emacswiki.org/emacs/download/icicles-fn.el \
     http://www.emacswiki.org/emacs/download/icicles-mac.el \
     http://www.emacswiki.org/emacs/download/icicles-mcmd.el \
     http://www.emacswiki.org/emacs/download/icicles-mode.el \
     http://www.emacswiki.org/emacs/download/icicles-opt.el \
     http://www.emacswiki.org/emacs/download/icicles-var.el
exit

# optional libraries
wget --wait=2 \
     http://www.emacswiki.org/emacs/download/bookmark%2b.el \
     http://www.emacswiki.org/emacs/download/col-highlight.el \
     http://www.emacswiki.org/emacs/download/crosshairs.el \
     http://www.emacswiki.org/emacs/download/hexrgb.el \
     http://www.emacswiki.org/emacs/download/hl-line%2b.el \
     http://www.emacswiki.org/emacs/download/icomplete%2b.el \
     http://www.emacswiki.org/emacs/download/lacarte.el \
     http://www.emacswiki.org/emacs/download/vline.el
