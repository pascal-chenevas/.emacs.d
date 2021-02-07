(setq flycheck-elixir-credo-strict t)
;(push 'company-lsp company-backends)

;;(add-hook 'elixir-mode-hook 'elixir-mode)

;(use-package lsp-mode
;    :commands lsp
;    :ensure t
;    :diminish lsp-mode
;    :hook
;    (elixir-mode . lsp)
;    :init
;    (add-to-list 'exec-path "~/bin/elixir-ls/release/"))

(use-package flycheck-elixir-credo
             :defer t
             :init (add-hook 'elixir-mode-hook 'flycheck-elixir-credo-setup))
;; Highlights *.elixir2 as well
(add-to-list 'auto-mode-alist '("\\.elixir2\\'" . elixir-mode))
;(add-hook 'lsp-after-initialize-hook
;	  (lambda ()
;	    (add-to-list 'exec-path "~/bin/elixir-ls/release/")
;	    (lsp--set-configuration `(:elixirLS, lsp-elixir--config-options))
;	    (elixir/init-flycheck-credo)
;	    (flycheck-add-next-checker 'lsp 'elixir-credo)))
;;; ExUnits
(require 'exunit)
