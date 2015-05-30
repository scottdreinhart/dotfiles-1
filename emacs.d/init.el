;;;(if (eq system-type 'darwin)
;;;  (setenv "PATH"
;;;)   (concat (getenv "path") ":/usr/local/bin:~/bin/")
;;;  )


(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setq debug-on-error t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
;(menu-bar-mode -1)
(add-to-list 'default-frame-alist '(width  . 120))
(add-to-list 'default-frame-alist '(height . 40))
;(add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline-12:weight:light" ))
(add-to-list 'default-frame-alist '(font . "Source Code Pro for Powerline-12" ))


(put 'set-goal-column 'disabled nil)
(setq vc-follow-symlinks t)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq resize-mini-windows t)


(add-to-list 'auto-mode-alist '("emacs\\'" . emacs-lisp-mode))
(fringe-mode 0)



;;; Set symbol for the border
(set-display-table-slot standard-display-table
                        'vertical-border 
                        (make-glyph-code ?┃))

(set-face-attribute 'vertical-border nil  :foreground "gray")


(add-to-list 'load-path "~/.emacs.d/config")
(require 'my-packages)

;; elscreen should be placed begin of https://github.com/knu/elscreen/issues/6
(elscreen-start)
(require 'init-elscreen)
(require 'init-color-theme)


;---------------------------------------------------------------------------------------
;; Ido
;;
(require 'ido-vertical-mode)
(ido-vertical-mode 1)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-use-faces nil)

(setq org-completion-use-ido t)
(setq magit-completing-read-function 'magit-ido-completing-read)

(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; smex
(require 'smex) 
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;---------------------------------------------------------------------------------------
;; Magit
;;
(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")
(global-set-key (kbd "C-x g") 'magit-status)
;(setq magit-auto-revert-mode nil)


;(require 'init-evil)



;;---------------------------------------------------------------------------------------
;; Fiplr
;;
(setq fiplr-root-markers '(".git" ".svn" "*.DS_Store"))
(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (files ("*.jpg" "*.png" "*.zip" "*~" "*.o" ".obj" "*.swp" "*.hg" ".pyc" ".*" ))))

(global-set-key (kbd "C-x f") 'fiplr-find-file)

;;---------------------------------------------------------------------------------------
;; Wind-move
;;
(global-set-key (kbd "C-x C-l") 'windmove-right)
(global-set-key (kbd "C-x C-h") 'windmove-left)
(global-set-key (kbd "C-x C-k") 'windmove-up)
(global-set-key (kbd "C-x C-j") 'windmove-down)

;;---------------------------------------------------------------------------------------
;; sr-speedbar
;;
;(require 'sr-speedbar)
;(setq speedbar-use-images nil)
;(setq speedbar-show-unknown-files t)


;(toggle-frame-fullscreen)


(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(require 'projectile-speedbar)

;(require 'cc-mode)
;(require 'ecb)

;(setq ecb-layout-name "leftright3")


;(setq mac-command-modifier 'super) ; make cmd key do Meta
(global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen)




(global-set-key (kbd "M-g M-v") 'split-window-right)
(global-set-key (kbd "M-g M-s") 'split-window-below)
(global-set-key (kbd "M-g M-o") 'delete-other-windows)

(global-set-key (kbd "M-g M-w") 'other-window)

;; gnu global support
;(require 'semantic/db)
;(global-semanticdb-minor-mode 1)

(require 'init-ggtags)

(global-unset-key "\C-o")
(global-set-key (kbd "C-o C-f") 'ido-find-file)
(global-set-key (kbd "C-o C-b") 'ido-switch-buffer)

(global-set-key (kbd "C-o g") 'ggtags-find-file)
(global-set-key (kbd "C-o t") 'ggtags-find-tag-dwim)

(global-set-key (kbd "M-g M-g") 'magit-status)


(setq scroll-margin 5)
(setq scroll-conservatively 10000)
(show-paren-mode t)

;;; next, cedet & ecb for c++ development
;(require 'cc-mode)
;(require 'semantic)

;(global-semanticdb-minor-mode 1)
;(global-semantic-idle-scheduler-mode 1)

;(semantic-mode 1)



; set LD_LIBRARY_PATH 
(setenv "LD_LIBRARY_PATH" "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/")
; load irony-mode
;( add-to-list 'load-path (expand-file-name "~/.emacs.d/irony-mode/elisp/"))
(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)



;; c/c++ auto-complete, yasnippet, auto-complet-c-headers
;;https://www.youtube.com/watch?v=HTUE03LnaXA&list=PL-mFLc7R_MJet8ItKipCtYc7PWoS5KTfM
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
;; input TAB to 
(require 'yasnippet)
(yas-global-mode 1)

;; auto-complete-c-headers
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/6.0/include")
)
;; call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;;; iedit, fix iedit bug in Mac, C-c ; to trigger multiple cursor edit
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;; flymake-google-cpplint-load
;; define a function for flymake initialization
;(defun my:flymake-google-init ()
;  (require 'flymake-google-cpplint)
;  (custom-set-variables
;   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
;  (flymake-google-cpplint-load)
;  )
;(add-hook 'c-mode-hook 'my:flymake-google-init)
;(add-hook 'c++-mode-hook 'my:flymake-google-init)

;; start google-c-style with emacs
;(require 'google-c-style)
;(add-hook 'c-mode-hook 'google-set-c-style)
;(add-hook 'c++-mode-hook 'google-make-newline-indent)



;; cedet
(semantic-mode 1)
;; let's define a function which adds semantic as a suggestion backend to auto complete
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
;; turn on ede mode
(global-ede-mode 1)

;(ede-cpp-root-project "my project" :file "~/demos/my_program/src/main.cpp"
;		      :include-path '("/../my_inc"))
;; you can use system-include-path for setting up the system header file locations.

;; turn on automatic reparsing of open buffers in semantic
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)
