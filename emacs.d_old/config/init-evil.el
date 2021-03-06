
;;---------------------------------------------------------------------------------------
;; evil
;;

(require 'evil)

(defalias 'evil-insert-state 'evil-emacs-state)

;;https://github.com/toumorokoshi/yt.rc/blob/master/emacs/my-evil.el
(define-key evil-visual-state-map "\C-w" nil)
;(define-key evil-normal-state-map (kbd "M-.") nil)
(define-key evil-normal-state-map "\C-t" nil)
(define-key evil-normal-state-map "\C-p" nil)
(define-key evil-normal-state-map "\C-n" nil)
(define-key evil-normal-state-map "\C-k" nil)
(define-key evil-normal-state-map "\C-l" nil)
(define-key evil-normal-state-map "\C-k" nil)
(define-key evil-normal-state-map "\C-j" nil)
(define-key evil-normal-state-map "\C-o" nil)


;; M-e not works correctly in evil-normal mode, this fix it
(define-key evil-normal-state-map "\M-e" (lambda() (interactive)
					   (forward-sentence 2)))
(define-key evil-motion-state-map "\C-e" (move-end-of-line 1))


;; most common keys in normal-mode to swith buffer, project, windows,
;; in emacs mode, Esc + s + x, the same
(global-evil-leader-mode)
(evil-leader/set-leader "s")
(evil-leader/set-key "j" 'pl-switch-buffers)
(evil-leader/set-key "h" 'persp-switch)
(evil-leader/set-key "k" 'helm-cmd-t)
(evil-leader/set-key "b" 'helm-mini)
(evil-leader/set-key "m" 'helm-mini)


(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define evil-emacs-state-map "jj" 'evil-normal-state)

(key-chord-define evil-normal-state-map ";s" 'split-window-below)
(key-chord-define evil-normal-state-map ";v" 'split-window-right)

(key-chord-mode 1)

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))
(loop for (mode . state) in '(
                  (nrepl-mode . insert)
                  (pylookup-mode . emacs)
                  (comint-mode . normal)
                  (shell-mode . emacs)
                  (git-commit-mode . emacs)
                  (git-rebase-mode . emacs)
                  (term-mode . emacs)
                  (help-mode . emacs)
                  (helm-grep-mode . emacs)
                  (grep-mode . emacs)
                  (bc-menu-mode . emacs)
                  (magit-branch-manager-mode . emacs)
                  (magit-popup-mode . emacs)
                  (rdictcc-buffer-mode . emacs)
                  (dired-mode . emacs)
                  (text-mode . emacs)
                  (wdired-mode . normal)
;			    (inferior-emacs-lisp-mode . emacs)
;			    (wdired-mode . normal)
			    (eshell-mode . emacs))
    do (evil-set-initial-state mode state))


;(global-evil-tabs-mode t)
(evil-mode 1)

(provide 'init-evil)
