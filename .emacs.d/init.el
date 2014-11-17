(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)

(setq-default indent-tabs-mode nil)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(undo-tree evil color-theme-solarized linum-relative
                                auto-complete ac-nrepl
                                paredit highlight-parentheses
                                clojure-mode cider
                                lua-mode
                                markdown-mode
                                css-mode
                                less-css-mode
                                magit))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(global-undo-tree-mode)
(evil-mode 1)

(require 'linum-relative)
(global-linum-mode 1)

(require 'auto-complete)
(global-auto-complete-mode t)
(require 'ac-nrepl)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))

(setq cider-repl-popup-stacktraces t)
(setq nrepl-popup-stacktraces-in-repl t)

(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)

(load-theme 'solarized-light t)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Parentheses
(add-hook 'clojure-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'cider-repl-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))
(require 'highlight-parentheses)
(global-set-key (kbd "C-x p") 'highlight-parentheses-mode)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(require 'whitespace)
(global-set-key (kbd "C-x w") 'whitespace-mode)

(defun cider-repl-reset ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(reset)")
    (cider-repl-return)))
(global-set-key (kbd "C-c r") 'cider-repl-reset)

;; Copy/paste
(global-set-key [(shift delete)] 'clipboard-kill-ring-save)
(global-set-key [(shift insert)] 'clipboard-yank)
