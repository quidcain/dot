;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (web-mode smart-tabs-mode clojure-mode csv-mode flycheck less-css-mode)))
 '(whitespace-style
   (quote
    (face trailing tabs spaces lines newline empty space-before-tab space-mark tab-mark newline-mark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
(setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)

(add-hook 'html-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (setq tab-width 4)
            ;; (setq indent-line-function 'insert-tab)
            ;; (setq tab-stop-list (number-sequence 4 200 4))
            (setq sgml-basic-offset 4)
            (smart-tabs-mode-enable)
            (smart-tabs-advice sgml-indent-line sgml-basic-offset)
            ))

(add-hook 'web-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (setq tab-width 2)
            (setq web-mode-markup-indent-offset 2)
            (smart-tabs-mode-enable)
            (smart-tabs-advice web-mode-indent-line
                               web-mode-markup-indent-offset)
            ))

(add-hook 'less-css-mode-hook
	  (lambda ()
            (setq indent-tabs-mode nil)
            ;; (setq tab-width 2)
            ;; (setq indent\-line-function 'insert-tab)
            ;; (setq tab-stop-list (number-sequence 2 200 2))
            (setq css-indent-offset 2)))

(add-hook 'js-mode-hook
          (lambda ()
            (setq tab-width 2)
            (setq js-indent-level 2)))

(add-hook 'java-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (setq tab-width 4)))

(add-to-list 'auto-mode-alist '("\\.\\(jsp\\|jspf\\|tag\\)\\'" . web-mode))

(desktop-save-mode 1)
(setq vc-follow-symlinks nil)
