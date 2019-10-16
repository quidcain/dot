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
 '(custom-enabled-themes (quote (ample)))
 '(custom-safe-themes
   (quote
    ("c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" default)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (expand-region f smex rg cider clojure-mode try counsel ample-theme web-mode smart-tabs-mode clojure-mode csv-mode flycheck less-css-mode)))
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
(setq-default tab-width 4)

(defmacro set-indent (indent-func tabs size)
  `(progn
     (setq indent-tabs-mode ,tabs)
     (if ,tabs
         (setq ,indent-func (* ,size tab-width))
       (setq ,indent-func ,size))))

(add-hook 'css-mode-hook
          (lambda ()
            (set-indent css-indent-offset nil 6)))

(add-hook 'html-mode-hook
          (lambda ()
            (setq tab-width 4)
            (set-indent sgml-basic-offset t 1)
            (smart-tabs-mode-enable)
            (smart-tabs-advice sgml-indent-line sgml-basic-offset)))

(defun is-react-file ()
  (string-match-p "import.*React" (buffer-string)))

(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))

(add-hook 'web-mode-hook
          (lambda ()
            (setq tab-width 2)
            (setq web-mode-markup-indent-offset 2)
            (setq web-mode-code-indent-offset 2)
            (if (is-react-file)
              (web-mode-set-content-type "jsx"))
            ))

(add-hook 'less-css-mode-hook
          (lambda ()
            (set-indent css-indent-offset nil 2)))

(add-hook 'js2-mode-hook
          (lambda ()
            (setq tab-width 2)
            (set-indent js2-basic-offset nil 2)))

(add-hook 'java-mode-hook
          (lambda ()
            (setq tab-width 4)
            (set-indent c-basic-offset t 1)))

(add-to-list 'auto-mode-alist '("\\.\\(jsp\\|jspf\\|tag\\)\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(setq vc-follow-symlinks nil) ;;disable warning of using 'symlinked' .emacs file
(define-key global-map "\M-*" 'pop-tag-mark) ;;smth related to tags

;;enable shift+arrow buffer navigation
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(global-set-key "\C-x\C-b" 'buffer-menu)

(setq inhibit-startup-screen t)

(when (member "-s" command-line-args)
  (server-start)
  (desktop-save-mode 1)) ;;enable restoring of opened buffers)

(setq command-line-args
      (delete "-s" command-line-args))

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq create-lockfiles nil)
(global-auto-revert-mode t)

(add-hook 'dired-mode-hook
          (lambda ()
            (dired-hide-details-mode 1)))

(global-set-key (kbd "C-=") 'er/expand-region)

;;after-change-major-mode-hook
;;Documentation:
;;Normal hook run at the very end of major mode functions
(add-hook 'after-change-major-mode-hook
          (lambda ()
            (message "hello guys")))

;(shell-command-to-string "java -jar ~/indentor/target/indentor.jar get -e java -p ~/indentor/")
;(shell-command-to-string "java -jar ~/indentor/target/indentor.jar get -e js -p ./")


;(require 'json)

;(let* ((json-object-type 'hash-table)
;       (json-array-type 'list)
;       (json-key-type 'string)
;       (json (json-read-file "test.json")))
;  (car (gethash "projects" json)))
