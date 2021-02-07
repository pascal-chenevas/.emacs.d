(setq lsp-auto-guess-root nil)
(setq lsp-ui-flycheck-enable 1)
(setq lsp-prefer-capf t)
(setq lsp-completion-provider :capf)
(setq lsp-completion-enable t)

(add-hook 'lsp-mode-hook 'lsp-ui-mode)
