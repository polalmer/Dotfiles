;; Disable startup clutter
(setq inhibit-startup-message t)
(scroll-bar-mode -1)

;; Package system setup
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Install use-package if not present
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; Install and enable Evil mode
(use-package evil
  :ensure t
  :init
  :config
  (evil-mode 1))

;; No backup files
(setq make-backup-files nil)
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/auto-saves/" t)))


;; Simpler prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; Faster startup
(setq gc-cons-threshold (* 50 1000 1000))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
