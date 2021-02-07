;;; Theme:
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)

; UI
(setq visible-bell 1)

;; autosave
(setq auto-save-visited-mode t)
;;; disable startup welcome message
(setq inhibit-startup-screen t)

; Tool bar and scroll bar off
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

; Enable line number
(global-linum-mode 1)

; Parenthesis
(show-paren-mode 1)
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)

; Code indent
(defun infer-indentation-style ()
  ;; if our source file uses tabs, we use tabs, if spaces spaces, and if        
  ;; neither, we use the current indent-tabs-mode                               
  (let ((space-count (how-many "^  " (point-min) (point-max)))
        (tab-count (how-many "^\t" (point-min) (point-max))))
    (if (> space-count tab-count) (setq indent-tabs-mode nil))
    (if (> tab-count space-count) (setq indent-tabs-mode t))))

(setq indent-tabs-mode nil)
(infer-indentation-style)

; Vertical alignment
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-delay 0)

; Company (auto completion)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0)
(setq company-dabbrev-downcase 0)

(local-set-key (kbd "TAB") 'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

; Syntax checker
;(add-hook 'after-init-hook #'global-flycheck-mode)
