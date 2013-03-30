(set-default-font "DejaVu Sans Mono:pixelsize=15:foundry=unknown:weight=normal:slant=normal:width=normal:spacing=100:scalable=true")
(custom-set-variables
 '(vc-follow-symlinks t))
(custom-set-faces
 )

;; locale coding
(setq locale-coding-system'utf-8)
(prefer-coding-system'utf-8)
(set-keyboard-coding-system'utf-8)
(set-terminal-coding-system'utf-8)
(set-selection-coding-system'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

;;global shortcout key
(global-set-key  "\C-cl" 'windmove-left)
(global-set-key  "\C-cr" 'windmove-right)
(global-set-key  "\C-cu" 'windmove-up)
(global-set-key  "\C-cd" 'windmove-down)

(global-set-key [f6] 'my-compile)
(global-set-key [f7] 'revert-buffer)
(global-set-key [f8] 'eshell)
(global-set-key [f9] 'bookmark-set)
(global-set-key [f10] 'list-bookmarks)
(global-set-key [f11] 'my-eshell-execute-current-line)

(global-set-key "\C-xl" 'goto-line)
(global-set-key "\C-x%" 'match-paren)          
 
;; compile
(add-hook 'c-mode-hook
	  (lambda ()
	    (set (make-local-variable 'compile-command) "scons -D . -j7")
	    )
	  )
(add-hook 'c++-mode-hook
	  (lambda ()
	    (set (make-local-variable 'compile-comand) "scons -D . -j7")
	    )
)
(setq compile-command "scons -D . -j7")

;; auto-mode
(setq auto-mode-alist
      (cons '("\\.h\\'" . c++-mode) auto-mode-alist)
)

;;set line number
(setq column-number-mode t)
(setq line-number-mode t)

;;parentheses settings
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;transient-mark-mode
(setq transient-mark-mode t);

;;c++ code style
(load-file "~/.emacs.d/vespa-style.el")
(require 'vespa-style)
(add-hook 'c-mode-common-hook 'vespa-c-mode-hook)

(add-hook 'c++-mode-hook
      '(lambda ( )
         (c-set-style "vespa")))
(add-hook 'c++-mode-hook
      '(lambda ( )
         (c-toggle-hungry-state)))
(add-hook 'c++-mode-hook
      '(lambda ( )
         (flyspell-prog-mode)))

(setq auto-mode-alist
     (cons '("\\.h\\'" . c++-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist
	     '("\\..pp\\'" . c++-mode))


(add-to-list 'auto-mode-alist
'("\\.ll\\'" . c++-mode))

(add-to-list 'auto-mode-alist
'("\\.yy\\'" . c++-mode))

;;c-mode related
(add-hook 'c++-mode-hook
      '(lambda ( )
         (c-toggle-hungry-state)))
(add-hook 'c++-mode-hook
      '(lambda ( )
         (flyspell-prog-mode)))
;;(add-hook 'c++-mode-hook
;;      '(lambda ( )
;;         (c-toggle-auto-newline)))

;;(require 'cc-mode)
;;(global-srecode-minor-mode 1)
(require 'semantic)
;;(semantic-load-enable-minimum-features)
;;(semantic-load-enable-code-helpers)
;;(semantic-load-enable-guady-code-helpers)
;;(semantic-load-enable-excessive-code-helpers)
;;(semantic-load-enable-semantic-debugging-helpers)


(defun copy-lines(&optional arg)
  (interactive "p")
  (save-excursion
    (beginning-of-line)
    (set-mark (point))
    (next-line arg)
    (kill-ring-save (mark) (point))
    )
  )

;;(load-file (expand-file-name "~/.emacs.d/highlight_symbol.el"))

(menu-bar-mode 0)

;;ido
(require 'ido)
(ido-mode t)


;; ################## add by shuai.li   #####################
(defalias 'e 'find-file)

;;;Color Theme 
;;(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0") 
;;(require 'color-theme) 
;;(color-theme-initialize) 
;;(color-theme-euphoria)

;;(require 'dired-lis)
;;(require 'color-theme-ahei)

(load-file "~/.emacs.d/sourcepair.el")
(require 'sourcepair)
(define-key global-map "\C-ct" 'sourcepair-load)


;; ############ autosave #################
(setq backup-directory-alist
      `((".*" . , "~/.autosave" )))
(setq auto-save-file-name-transforms
      `((".*" , "~/.autosave" t)))


;(add-to-list 'load-path "~/.emacs.d/settings")

; general settings
;(require 'ido-settings)
;;(require 'auto-complete-settings)
;;(require 'fill-column-indicator-settings)

; python specific
;(require 'python-settings)

; aesthetics
;;(require 'ui-settings)
;(require 'window-settings)
;(require 'cursor-settings)
;(require 'text-settings)
;(require 'color-theme-settings)

(load-file "~/.emacs.d/deft.el")
(require 'deft)

;;(set 'eshell-buffer-shorthand t)

(load-file "~/.emacs.d/tools/eshell-autojump.el")
(eval-after-load 'eshell
  '(require 'eshell-autojump nil t))


;;;;; custom function

(defun my-eshell-execute-current-line ()
  "Insert text of current line in eshell and execute."
  (interactive)
  (require 'eshell)
  (let ((command (buffer-substring
                  (save-excursion
                    (beginning-of-line)
                    (point))
                  (save-excursion
                    (end-of-line)
                    (point)))))
    (let ((buf (current-buffer)))
      (unless (get-buffer eshell-buffer-name)
        (eshell))
      (display-buffer eshell-buffer-name t)
      (switch-to-buffer-other-window eshell-buffer-name)
      (end-of-buffer)
      (eshell-kill-input)
      (insert command)
      (eshell-send-input)
      (end-of-buffer)
      (switch-to-buffer-other-window buf))))

(defun my-compile()
  "Save buffers and start compile"
  (interactive)
  (save-some-buffers t)
  ;;(switch-to-buffer-other-window "*compilation*")
  (compile compile-command))

(defun match-paren (arg)  
  "Go to the matching paren if on a paren; otherwise insert %."  
  (interactive "p") 
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1)) ((looking-at "\\s\)") (forward-char 1) (backward-list 1)) (t (self-insert-command (or arg 1))))
  )
