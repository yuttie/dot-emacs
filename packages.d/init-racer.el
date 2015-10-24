(setq racer-rust-src-path (expand-file-name "~/rust/src/"))
(setq racer-cmd "/usr/bin/racer")
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
