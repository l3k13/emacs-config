(setq inhibit-startup-message t)
(set-fringe-mode 10)
(tool-bar-mode 0)
(column-number-mode t)
(display-time-mode t)
(global-display-line-numbers-mode t)
(global-hl-line-mode t)

(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda() (display-line-numbers-mode 0))))

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
  :bind (
	 :map ivy-minibuffer-map ("TAB" . ivy-alt-done))
  :init (ivy-mode t))

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
  :init(which-key-mode t))

;; theme setup
(use-package doom-themes
  :init(load-theme 'doom-ayu-mirage t))


