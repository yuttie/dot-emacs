(evil-define-command evil-elscreen/tab-next (&optional count)
  ""
  :repeat nil
  (interactive "P")
  (cond
   (count (elscreen-goto (- count 1)))
   (t (elscreen-next))))

(evil-define-command evil-elscreen/tab-previous (&optional count)
  ""
  :repeat nil
  (interactive "P")
  (dotimes (i (or count 1))
    (elscreen-previous)))
