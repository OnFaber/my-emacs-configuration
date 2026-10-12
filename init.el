;;; init.el --- -*- no-byte-compile: t; lexical-binding: t; -*-

(require 'package)
(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))
(setq package-archive-priorities
      '(("melpa" . 4) ("nongnu" . 2) ("gnu" . 1)))
;; Permette di aggiornare i pacchetti inclusi in Emacs (eglot, transient):
;; su Emacs 29 quelli inclusi sono troppo vecchi.
;; Una volta: M-x package-upgrade RET eglot, poi transient.
(setq package-install-upgrade-built-in t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Paths
(defconst my/cache-directory
  (expand-file-name ".cache/" user-emacs-directory))
(defconst my/custom-directory
  (expand-file-name "core/custom/" user-emacs-directory))
(defconst my/libs-directory
  (expand-file-name "core/libs/" user-emacs-directory))

(make-directory my/cache-directory 'parents)
(add-to-list 'load-path my/custom-directory)

(dolist (subdir '("vue-ts-mode/" "peek/"))
  (let ((path (expand-file-name subdir my/libs-directory)))
    (when (file-exists-p path)
      (add-to-list 'load-path path))))

;; Transparency
;; (set-frame-parameter nil 'alpha-background 91)
;; (add-to-list 'default-frame-alist '(alpha-background . 91))

;; Le impostazioni salvate da Customize (e da package.el) vanno qui,
;; non in init.el, che viene rigenerato dal tangle
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Load main config
(load (expand-file-name "dotemacs.el" user-emacs-directory))

(provide 'init)
;;; init.el ends here
