(require 'edit-server)
(edit-server-start)
(add-hook 'edit-server-start-hook #'edit-server-edit-mode)
