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
                                clojure-mode nrepl
                                markdown-mode
                                magit))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(global-undo-tree-mode)
(evil-mode 1)

(load-theme 'solarized-light t)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(require 'whitespace)
(global-set-key (kbd "C-x w") 'whitespace-mode)

(global-set-key [(shift delete)] 'clipboard-kill-ring-save)
(global-set-key [(shift insert)] 'clipboard-yank)
