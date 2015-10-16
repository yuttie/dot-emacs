(setq aw-keys '(?a ?o ?e ?u ?h ?t ?n ?s ?i ?d))
(global-set-key (kbd "C-c S-SPC") #'ace-window)

(with-eval-after-load 'evil
  (define-key evil-motion-state-map (kbd "S-SPC") #'ace-window))
