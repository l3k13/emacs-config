(setq inhibit-startup-message t)
(set-fringe-mode 10)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode t)
(display-time-mode t)
(global-display-line-numbers-mode t)
(global-hl-line-mode t)

;; mac stuffs
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

;; backup to a different location
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups


(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))

;; Scroll smoothly
(setq scroll-conservatively 100)

;; y or n
(defalias 'yes-or-no-p 'y-or-n-p)



;; use esc to quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Set font to Source Code pro
(set-face-attribute 'default nil :font "Hack" :height 120)


;; melpa setup
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; use-package setup
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; crush them modes
(use-package diminish)

;; ivy setup
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done))
  :init (ivy-mode 1))
(use-package counsel
  :bind (("C-x b" . counsel-ibuffer)
	 ("C-x C-b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file))
  :init(counsel-mode))
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))


;; modeline from doom-emacs
(use-package all-the-icons
  :if (display-graphic-p))
(set-fontset-font t 'unicode (font-spec :family "all-the-icons") nil 'append)

(use-package doom-modeline
  :init (doom-modeline-mode 1))
(require 'doom-modeline)
(setq doom-modeline-support-imenu t)
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon t)

;; which-key setup
(use-package which-key
  :init(which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

;; theme setup
(use-package doom-themes
  :init(load-theme 'doom-tomorrow-night t))

(use-package company
  :hook((prog-mode . company-mode))
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3))

(use-package company-irony
  :after company
  :config(add-to-list 'company-backends 'company-irony)
  :hook(cc-mode . irony-mode))

(require 'cc-mode)
(setq-default c-default-style "linux")
(setq-default c-basic-offset 4)

(add-hook 'prog-mode-hook (lambda() (electric-pair-mode t)))
(setq electric-pair-preserve-balance nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company which-key use-package ivy-rich doom-themes doom-modeline diminish counsel all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
