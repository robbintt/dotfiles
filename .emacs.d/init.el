;; simple emacs config
;; from: https://blog.aaronbieber.com/2015/05/24/from-vim-to-emacs-in-fourteen-days.html

;; Update package-archive lists (why does this have to be before mentioning package-archives?)
(require 'package)

(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
;;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Install use-package if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; enable use-package
(eval-when-compile
  (require 'use-package))

;; evil mode
(use-package evil 
  :ensure t)
;; enable evil-mode
(evil-mode 1)

;; helm
(use-package helm
  :ensure t)
;; enable helm-mode
(helm-mode 1)

;; undo-tree 
(use-package undo-tree 
  :ensure t)
;; enable undo-tree-mode
(global-undo-tree-mode 1)
;; persistent undo tree between exits
;; store persistent undo tree in system tmp (macos is $TMPDIR)
(setq undo-tree-auto-save-history t
    undo-tree-history-directory-alist
    `(("." . ,(concat temporary-file-directory "undo"))))
(unless (file-exists-p (concat temporary-file-directory "undo"))
    (make-directory (concat temporary-file-directory "undo")))

;; (require 'diminish) ;; if you use diminish
;; (require 'bind-key) ;; if you use any :bind variant

(load-theme 'tango-dark t)

;; add a space after line number
(setq linum-format "%d ")
;; turn line numbers on
(global-linum-mode)

;; avoid tabs
(setq-default indent-tabs-mode nil)

; set the top and bottom pointer line margins to 5
(setq-default scroll-margin 5)

;; backups in system tmp directory
;; from emacs wiki: https://www.emacswiki.org/emacs/BackupDirectory#toc2
(setq backup-directory-alist
  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
  `((".*" ,temporary-file-directory t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (helm evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
