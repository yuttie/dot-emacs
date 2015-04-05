(setq racer-rust-src-path (expand-file-name "~/rust/src/"))
(setq racer-cmd "/usr/bin/racer")
(with-eval-after-load 'rust-mode
  (require 'racer))
