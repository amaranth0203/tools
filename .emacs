
;; (set-default-font "-outline-微软雅黑-normal-normal-normal-sans-16-*-*-*-p-*-iso8859-1")
;; (tool-bar-mode 0)
;; (menu-bar-mode 0)
;; (scroll-bar-mode 0)

;; ---------- basic config -----------

(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq indent-line-function 'insert-tab)
;; cursor blinking speed
( setq blink-cursor-interval .1 )
;; ido
( ido-mode 1 )

;; ---------- basic config ends ------

;; ---------- functions --------------

(defun go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

(defun go-to-char-backward (n char)
  "Move forward to Nth occurence of CHAR.
Typing `go-to-char-backward-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-backward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-backward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

(defun qyh-delete-char ( n )
  (interactive "p\n")
  (delete-backward-char n)
    (while (read-char)
      (delete-backward-char n))
    (setq unread-command-events (list last-input-event)))

(defun qyh-delete-word ( n )
  (interactive "p\n")
  (backward-kill-word n)
    (while (read-char)
      (backward-kill-word n))
    (setq unread-command-events (list last-input-event)))

(defun qyh-expand-region ( n )
  (interactive "p\n")
  (er/expand-region n)
    (while (read-char)
      (er/expand-region n))
    (setq unread-command-events (list last-input-event)))

(defun qyh-next-line( n )
  ( interactive "p\n" )
  ( next-line n )
  ( recenter-top-bottom )
  ( while ( read-char )
    ( next-line n )
    ( recenter-top-bottom ) )
  ( setq unread-command-events ( list last-input-event ) ) )

(defun qyh-previous-line( n )
  ( interactive "p\n" )
  ( previous-line n )
  ( recenter-top-bottom )
  ( while ( read-char )
    ( previous-line n )
    ( recenter-top-bottom ) )
  ( setq unread-command-events ( list last-input-event ) ) )

( defun qyh-neotree-change-to-env-dir ( )
  ( interactive )
  ( let ( ( env-name ( read-string "" ) ) )
  ( neotree-dir (getenv env-name))))

;; ---------- functions ends ---------

;; ---------- keybind ----------------

( define-key global-map ( kbd "C-c f" ) 'go-to-char )
( define-key global-map ( kbd "C-c F" ) 'go-to-char-backward )
( define-key global-map ( kbd "C-c h" ) 'qyh-delete-char )
( define-key global-map ( kbd "C-c w" ) 'qyh-delete-word )
( define-key global-map ( kbd "C-c =" ) 'er/expand-region )
( define-key global-map ( kbd "C-c j" ) 'qyh-next-line )
( define-key global-map ( kbd "C-c k" ) 'qyh-previous-line )
( define-key global-map ( kbd "M-n" ) 'move-text-down )
( define-key global-map ( kbd "M-p" ) 'move-text-up )

;; ---------- keybind ends -----------

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
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
 '(package-selected-packages
   (quote
    (ace-jump-mode move-text yasnippet expand-region ggtags auto-complete smartrep sr-speedbar git-gutter hide-lines monokai-theme smex window-numbering tabbar buffer-flip neotree slime)))
 '(tabbar-separator (quote (0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; neotree
(global-set-key [f8] 'neotree-toggle)

;; buffer-flip
( key-chord-mode 1 )
( buffer-flip-mode )

;; slime
;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; tabbar
( load-file "~/.emacs.d/tabbar-tweak.el" )

;; window-numbering
( window-numbering-mode 1 )

;; smex
( smex-initialize )
( global-set-key ( kbd "M-x" ) 'smex )
( global-set-key ( kbd "M-X" ) 'smex-major-mode-commands )

;; git-gutter
( global-git-gutter-mode +1 )

;; monokai
( load-theme 'monokai t )

;; auto-complete
( global-auto-complete-mode 1 )

;; ggtags
( ggtags-mode 1 )

;; YASnippet
( yas-global-mode 1 )
