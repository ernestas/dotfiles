(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(undo-tree evil color-theme-solarized clojure-mode nrepl))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(global-undo-tree-mode)
(evil-mode 1)
(tool-bar-mode -1)

(load-theme 'solarized-dark t)
