;;; early-init.el --- -*- no-byte-compile: t; lexical-binding: t; -*-
(setq package-enable-at-startup nil)
(customize-set-variable 'menu-bar-mode nil)
(customize-set-variable 'scroll-bar-mode nil)
(customize-set-variable 'tool-bar-mode nil)
(customize-set-variable 'ring-bell-function 'ignore)
;; Gli avvisi della compilazione nativa riguardano il codice dei pacchetti,
;; non la config: si scrivono in *Warnings* senza aprire la finestra
(setq native-comp-async-report-warnings-errors 'silent)
(provide 'early-init-file)
;;; early-init.el ends here
