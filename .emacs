

;; (set-default-font "-outline-΢���ź�-normal-normal-normal-sans-16-*-*-*-p-*-iso8859-1")
(if window-system
    (tool-bar-mode 0))
(if window-system
    (menu-bar-mode 0))
(if window-system
    (scroll-bar-mode 0))


;; Auto generated by chinese-fonts-setup
;; <https://github.com/tumashu/chinese-fonts-setup>
;; (set-face-attribute
;;  'default nil
;;  :font (font-spec :name "-outline-Consolas-bold-normal-normal-mono-*-*-*-*-c-*-iso10646-1"
;;                   :weight 'normal
;;                   :slant 'normal
;;                   :size 11.5))
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font
;;    (frame-parameter nil 'font)
;;    charset
;;    (font-spec :name "-outline-΢���ź�-normal-normal-normal-sans-*-*-*-*-p-*-iso10646-1"
;;               :weight 'normal
;;               :slant 'normal
;;               :size 12.0)))

;; ---------- basic config -----------

(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq indent-line-function 'insert-tab)
;; cursor blinking speed
( setq blink-cursor-interval .1 )
;; color
;; (add-to-list 'default-frame-alist '(foreground-color . "#E0DFDB"))
;; (add-to-list 'default-frame-alist '(background-color . "#102372"))
;; (add-to-list 'default-frame-alist '(foreground-color . "#C81010"))
;; (add-to-list 'default-frame-alist '(background-color . "#400000"))
;; n(add-to-list 'default-frame-alist '(foreground-color . "#F8F8F2"))
;; (add-to-list 'default-frame-alist '(background-color . "#272822"))

;; ido
;; ( ido-mode 1 )
;; org-mode
( setq org-tag-column 77 )
( setq org-log-done 'time )
( setq org-log-done 'note )
( setq org-todo-keywords
       '((sequence "TODO(t@/!)" "|" "DONE(d@/!)")))

;; proxy
;; ( setq url-proxy-services '(("http" . "localhost:2333")
;;                                       ("http" . "localhost:2333")))
( setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
( setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
( prefer-coding-system 'utf-8 ) 
( setq c-default-style "linux"
       c-basic-offset 2 )

;; ---------- basic config ends ------

;; ---------- keybind ----------------
( define-key global-map ( kbd "C-c =" ) 'er/expand-region )
( define-key global-map ( kbd "M-n" ) 'move-text-down )
( define-key global-map ( kbd "M-p" ) 'move-text-up )
( define-key global-map ( kbd "C-x C-a" ) 'org-agenda )
( define-key global-map ( kbd "M-j" ) 'ace-jump-mode )
( define-key global-map ( kbd "C-c M-p" ) 'pop-tag-mark )
;; ---------- keybind ends -----------

(require 'package) ;; You might already have this line
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" default)))
 '(org-agenda-files
   (quote
    ("~/Shadow/notes/org/slf.org" "~/Shadow/notes/org/vivo.org")))
 '(package-selected-packages
   (quote
    (omnisharp ac-php php-mode helm-swoop helm jedi python-mode chinese-fonts-setup ace-jump-mode move-text yasnippet expand-region ggtags auto-complete sr-speedbar git-gutter hide-lines window-numbering slime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; slime
;; Set your lisp system and, optionally, some contribs
;; (setq inferior-lisp-program "/usr/bin/sbcl")
;; (setq slime-contribs '(slime-fancy))

;; window-numbering
( window-numbering-mode 1 )

;; git-gutter
( global-git-gutter-mode +1 )

;; auto-complete
( global-auto-complete-mode 1 )
( add-to-list 'ac-modes 'org-mode )

;; ggtags
( ggtags-mode 1 )
( setq ggtags-oversize-limit t )
(require 'ggtags)
(defun gtags-root-dir ()
  "Returns GTAGS root directory or nil if doesn't exist."
  (with-temp-buffer
    (if (zerop (call-process "global" nil t nil "-pr"))
        (buffer-substring (point-min) (1- (point-max)))
      nil)))
(defun gtags-update-single(filename)  
  "Update Gtags database for changes in a single file"
  (interactive)
  (start-process "update-gtags" "update-gtags" "bash" "-c" (concat "cd " (gtags-root-dir) " ; gtags --single-update " filename )))
(defun gtags-update-current-file()
  (interactive)
  (defvar filename)
  (setq filename (replace-regexp-in-string (gtags-root-dir) "." (buffer-file-name (current-buffer))))
  (gtags-update-single filename)
  (message "Gtags updated for %s" filename))
(defun gtags-update-hook()
  "Update GTAGS file incrementally upon saving a file"
  (when ggtags-mode
    (when (gtags-root-dir)
      (gtags-update-current-file))))
(add-hook 'after-save-hook 'gtags-update-hook)

;; YASnippet
( require 'yasnippet )
( add-to-list
  'yas-snippet-dirs
  ( concat ( getenv "wn" ) "/yasnippet_template" ) )
( yas-global-mode 1 )
(add-hook 'org-mode-hook
   '(lambda () (set (make-local-variable 'yas-indent-line) 'fixed)))

;; helm 
( helm-mode 1 )
( require 'recentf )
( recentf-mode 1 )
( setq-default recent-save-file "~/.emacs.d/recentf" )
( setq recentf-auto-cleanup 'never )
( setq bookmark-save-flag 1 )
( global-set-key (kbd "M-x") #'helm-M-x )
( global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks )
( global-set-key (kbd "C-x C-f") #'helm-find-files )

;; sr-speedbar
( setq sr-speedbar-max-width 44 )
( setq sr-speedbar-right-side nil )

;; unknown
(put 'set-goal-column 'disabled nil)

;; chinese-fonts-setup
;; ( require 'chinese-fonts-setup )

;; web-mode
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode));;;;;;;; plain html
;; (setq web-mode-engines-alist
;;       '(("php"    . "\\.html\\'")
;;         ("blade"  . "\\.blade\\."))
;; )
;; (setq web-mode-markup-indent-offset 2)
;; (setq web-mode-css-indent-offset 2)
;; (setq web-mode-code-indent-offset 2)

;; for dotnet
(require 'csharp-mode)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))
;; -- omnisharp start --
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(add-hook 'csharp-mode-hook
          (lambda()
            (progn (local-set-key (kbd "C-M-g") #'omnisharp-go-to-definition)
                   (local-set-key (kbd "C-i") #'omnisharp-auto-complete)
                   )))
(setq omnisharp-server-executable-path "/usr/local/bin/omnisharp")
;; ( define-key global-map ( kbd "C-i" ) 'omnisharp-auto-complete )
;; -- omnisharp ends --

;; something written by myself
(load ( concat ( getenv "wn" ) "/.emacs.selfused.lisp" ))

;;
;; for debugging
;;
;; ( message "wassup" )
;; ( message ( getenv "ws" ) )
;; ( message ( getenv "wn" ) )
;; ( message "wassup ends" )
