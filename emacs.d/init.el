
(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
(eval-when-compile
    (require 'use-package))

(global-display-line-numbers-mode)
(global-auto-revert-mode)

(use-package evil
  :ensure t
  :config
  (evil-mode 1)

  ;; Use Emacs state in these additional modes.
  (dolist (mode '(ag-mode
      flycheck-error-list-mode
      git-rebase-mode
      org-capture-mode))
    (add-to-list 'evil-emacs-state-modes mode))

  ;;(define-key evil-normal-state-map (kbd "C-j") 'next-buffer)
  ;;(define-key evil-normal-state-map (kbd "C-j") 'evil-next-buffer)
  ;;(define-key evil-normal-state-map (kbd "C-k") 'previous-buffer)
  ;;(define-key evil-normal-state-map (kbd "C-k") 'evil-prev-buffer)
  (define-key evil-normal-state-map (kbd "C-w b") 'helm-mini)

  (define-key evil-normal-state-map (kbd "C-k") (lambda ()
		(interactive)
		(evil-scroll-up nil)))
  (define-key evil-normal-state-map (kbd "C-j") (lambda ()
		(interactive)
		(evil-scroll-down nil)))

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader ",")
    (evil-leader/set-key
	","  'other-window
	"."  'mode-line-other-buffer
	":"  'eval-expression
	"b"  'helm-mini             ;; Switch to another buffer ('switch-to-buffer)
	"d"  'kill-this-buffer
	"k"  'kill-buffer
	"l"  'whitespace-mode       ;; Show invisible characters
	"v"  'delete-other-windows  ;; C-w o
	"S"  'delete-trailing-whitespace
	"w"  'save-buffer
	"x"  'helm-M-x
        "e"  'helm-find-files
        "oi"  (lambda () (interactive) (shell-command "oi") )
        "oo"  (lambda () (interactive) (shell-command "oo") )
  ))

  (use-package evil-escape
    :ensure t
    :config
    (evil-escape-mode 1))

  ;;; If `display-line-numbers-mode' is available (only in Emacs 26),
  ;;; use it! Otherwise, install and run nlinum-relative.
  (if (functionp 'display-line-numbers-mode)
      (and (add-hook 'display-line-numbers-mode-hook
                     (lambda () (setq display-line-numbers-type 'relative)))
           (add-hook 'prog-mode-hook #'display-line-numbers-mode))
    (use-package nlinum-relative
      :ensure t
      :config
      (nlinum-relative-setup-evil)
      (setq nlinum-relative-redisplay-delay 0)
      (add-hook 'prog-mode-hook #'nlinum-relative-mode)))
)

(use-package markdown-mode
  :ensure t)

(use-package helm
  :ensure t
  :diminish helm-mode
  :commands helm-mode
  :config
  (helm-mode 1)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40)
  (global-set-key (kbd "M-x") 'helm-M-x)
  ;;(define-key helm-map (kbd "S-SPC") 'helm-toggle-visible-mark)
  ;;(define-key helm-find-files-map (kbd "C-k") 'helm-find-files-up-one-level))
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(git-auto-commit-mode evil-escape evil-visual-mark-mode helm markdown-mode use-package))
 '(safe-local-variable-values
   '((gac-automatically-add-new-files-p . t)
     (gac-automatically-push-p . t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
