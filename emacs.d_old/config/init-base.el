

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(add-to-list 'default-frame-alist '(width  . 120))
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline-12:weight:light" ))
;(add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline-12" ))

(setq inhibit-startup-message t)

(put 'set-goal-column 'disabled nil)
(setq vc-follow-symlinks t)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq resize-mini-windows t)
(blink-cursor-mode 0)

;(custom-set-variables
; '(fringe-mode (quote (0 . 0)) nil (fringe)))

(fringe-mode (quote (0 . 0)))

(add-to-list 'auto-mode-alist '("emacs\\'" . emacs-lisp-mode))



;;; Set symbol for the border
(set-display-table-slot standard-display-table
                        'vertical-border 
                        (make-glyph-code ?┃))

(set-face-attribute 'vertical-border nil  :foreground "gray")

(defalias 'yes-or-no-p 'y-or-n-p)

(setq scroll-margin 5)
(setq scroll-conservatively 10000)
(show-paren-mode t)


(add-hook 'help-mode-hook
	  (lambda ()
	    (linum-mode -1)))

;; Dired mode
(require 'dired+)
;; create new file  key map
(define-key dired-mode-map "c" 'find-file)
;; ^ goto-up directory
(define-key dired-mode-map (kbd "C-c C-u") 'dired-up-directory)

(setq diredp-hide-details-initially-flag t)
(setq diredp-hide-details-propagate-flag t)

(setq term-buffer-maximum-size 10000)

(provide 'init-base)
