;;; c-eldoc
(setq c-eldoc-includes "`pkg-config gtk+-2.0 --cflags` -I./ -I../ ")
(autoload 'c-turn-on-eldoc-mode "c-eldoc" "Enable c-eldoc-mode" t)
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
