(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)

(setq-default indent-tabs-mode nil)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(undo-tree evil color-theme-solarized
                                paredit highlight-parentheses
                                clojure-mode nrepl
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

(load-theme 'solarized-light t)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(add-hook 'clojure-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'nrepl-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))
(require 'highlight-parentheses)
(global-set-key (kbd "C-x p") 'highlight-parentheses-mode)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(require 'whitespace)
(global-set-key (kbd "C-x w") 'whitespace-mode)

(global-set-key [(shift delete)] 'clipboard-kill-ring-save)
(global-set-key [(shift insert)] 'clipboard-yank)
