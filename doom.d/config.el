;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq whitespace-display-mappings
      ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
      '(
        (space-mark 32 [183] [46]) ; 32 SPACE, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
        (newline-mark 10 [8629 10]) ; 10 LINE FEED
        (tab-mark 9 [8594 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
        )
      )
(global-whitespace-mode)

(after! go-mode
  (setq gofmt-command "goimports")
  (add-hook 'go-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'gofmt nil 'make-it-local)))
  ;; disable various functions of guru
  (setq go-guru-hl-identifier-mode nil
        go-guru-define-function nil
        go-guru-implementations-function nil
        go-guru-referrers-function nil))

(unicad-mode 1)
(setq visible-cursor t)

;; https://discourse.doomemacs.org/t/why-is-emacs-doom-slow/83
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
;; https://emacs-lsp.github.io/lsp-mode/page/performance/#adjust-gc-cons-threshold
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq gc-cons-threshold 100000000)
(setq font-lock-maximum-decoration t)

(use-package! lsp-mode
  :commands lsp
  :hook ((go-mode . lsp-deferred))
  :config
  (setq lsp-gopls-staticcheck t
        lsp-prefer-flymake nil
        lsp-completion-provider :capf
        lsp-enable-symbol-highlighting nil
        lsp-log-io nil
        lsp-enable-folding nil
        lsp-enable-links nil
        lsp-idle-delay 0.500
        lsp-gopls-complete-unimported nil
        lsp-gopls-use-placeholders nil
        lsp-gopls-watch-file-threshold 5000
        read-process-output-max (* 1024 1024) ;; 1MB
        gc-cons-threshold 100000000))

(add-hook 'go-mode-hook #'lsp)

(after! lsp-mode
  (setq lsp-enable-file-watchers nil
        lsp-file-watch-threshold 2000))

(use-package! lsp-ui
  :after lsp-mode
  :config
  (setq lsp-ui-doc-enable nil
        lsp-ui-sideline-enable nil
        lsp-ui-peek-enable nil
        lsp-ui-doc-delay 2))

(after! lsp-mode
  (setq lsp-enable-file-watchers nil))
(setq lsp-lens-enable nil)

(use-package! projectile
  :config
  (setq projectile-enable-caching t
        projectile-indexing-method 'alien
        projectile-sort-order 'recentf)
  (projectile-mode +1))

(use-package! dired
  :commands dired
  :config
  (setq dired-listing-switches "-alh"))

(use-package! deadgrep
  :commands deadgrep)

(map! :leader
      :desc "Search with deadgrep" "s g" #'deadgrep)

(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

(setq lsp-semgrep-languages nil)
