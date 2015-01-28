(require 'mmm-auto)

(setq mmm-global-mode 'maybe)

(mmm-add-mode-ext-class 'html-mode nil 'html-css)
(mmm-add-mode-ext-class 'html-mode nil 'html-js)
(mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)
(mmm-add-mode-ext-class 'nxml-mode nil 'html-css)
(mmm-add-mode-ext-class 'nxml-mode nil 'html-js)
(mmm-add-mode-ext-class 'nxml-mode "\\.php\\'" 'html-php)
