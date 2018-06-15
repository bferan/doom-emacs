;;; lang/elm/config.el -*- lexical-binding: t; -*-

;; `elm-mode'
(setq elm-format-on-save t)

(after! elm-mode
  (add-hook 'elm-mode-hook #'rainbow-delimiters-mode)
  (set-company-backend! 'elm-mode 'company-elm)
  (set-repl-handler! 'elm-mode #'run-elm-interactive))


(def-package! flycheck-elm
  :when (featurep! :feature syntax-checker)
  :after elm-mode
  :init (add-hook 'elm-mode-hook #'flycheck-mode)
  :config (add-to-list 'flycheck-checkers 'elm nil #'eq))

