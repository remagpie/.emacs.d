;(package-initialize)

(setq load-prefer-newer t)

(require 'package)

(setq package-archives
      '(("marmalade" . "https://marmalade-repo.org/packages/")
	("melpa-stable" . "https://stable.melpa.org/packages/")
	("melpa" . "https://melpa.org/packages/")
	("gnu" . "https://elpa.gnu.org/packages/")))
(setq package-archive-priorities
      '(("melpa-stable" . 30)
	("marmalade" . 20)
	("gnu" . 10)
	("melpa" . 0)))
(package-initialize)

(unless package-archive-contents (package-refresh-contents))

(setq package-selected-packages '(req-package evil f s dash))
(package-install-selected-packages)


(require 'f)

(setq init-dir (f-dirname (f-this-file)))
(load (f-join init-dir "bindings" "init.el"))
(add-to-list 'load-path (f-join init-dir "scripts"))
(load (f-join init-dir "themes" "init.el"))
(load-theme 'base t)

;; turn on evil mode (evil keymap is critical for this setting, so we manually turn it on)
(require 'evil)
(load-binding "evil")
(evil-mode t)
(setq evil-move-beyond-eol t)

(line-number-mode t)
(column-number-mode t)

(require 'req-package)
(setq use-package-always-ensure t)

(req-package paradox
  :config
  (paradox-enable))

(req-package undo-tree
  :config
  (load-binding "undo-tree")
  (global-undo-tree-mode t))

(req-package helpful
  :config
  (load-binding "helpful"))

(req-package tabbar
  :config
  (load-binding "tabbar")
  (tabbar-mode t))

(req-package windmove
  :config
  (load-binding "windmove"))

;; TODO : add key bindings
(req-package magit
  :config
  (load-binding "magit"))

;; magithub

;; TODO : disable linum on specified modes
(req-package linum
  :config
  (global-linum-mode t))

(req-package hlinum
  :require linum)

(req-package hl-line
  :config
  (global-hl-line-mode t))

(req-package whitespace
  :config
  (global-whitespace-mode t)
  (setq whitespace-style
 	'(face
 	  tabs lines-tail trailing space-before-tab indentation tab-mark))
  (setq whitespace-global-modes '(not help-mode messages-buffer-mode)))

(req-package highlight-parentheses
  :config (global-highlight-parentheses-mode t))

(req-package electric
  :config
  (electric-pair-mode t)
  (electric-layout-mode t))

(req-package autorevert
  :config
  (global-auto-revert-mode t))

;; TODO : add configurations
(req-package anzu
  :config
  (global-anzu-mode t))

(req-package flx)

(req-package ivy
  :require flx
  :config
  (load-binding "ivy")
  (ivy-mode 1)
  (setq ivy-re-builders-alist
 	'((t . ivy--regex-fuzzy)))
  (setq ivy-count-format "(%d/%d) "))

(req-package company
  :config
  (load-binding "company")
  (setq company-idle-delay 0.1)
  (global-company-mode t))

(req-package company-flx
  :require company flx
  :config
  (company-flx-mode t))

(req-package yasnippet
  :require cl-lib)

(req-package perspective
  :config
  (persp-mode))

(req-package projectile
  :require dash pkg-info perspective
  :config
  (projectile-global-mode))

(req-package persp-projectile
  :require perspective projectile)

(req-package desktop
  :config
  (desktop-save-mode t))

(req-package-finish)

;; some additional local packages
(require 'minimap)

(setq gc-cons-threshold 20000000)

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; (setq-default tab-always-indent 'complete)

(let ((backup-dir (f-slash (f-join init-dir "backup"))))
  (unless (f-directory? backup-dir) (f-mkdir backup-dir))
  (setq backup-directory-alist `((".*" . ,backup-dir))))
(let ((autosave-dir (f-slash (f-join init-dir "autosave"))))
  (unless (f-directory? autosave-dir) (f-mkdir autosave-dir))
  (setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))
  (setq auto-save-list-file-prefix (f-join autosave-dir ".save-list")))
(setq backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2)

(setq scroll-step 1)
(setq frame-resize-pixelwise t)

(setq custom-file (f-join init-dir "custom.el"))
(load custom-file 'noerror)
