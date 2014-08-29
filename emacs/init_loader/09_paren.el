;; show paren
(show-paren-mode 1)
(custom-set-variables
 '(show-paren-delay 0)
 '(show-paren-style 'expression)
 '(parens-require-spaces nil))

(set-face-attribute 'show-paren-match-face nil
                    :background nil :foreground nil
                    :underline "#ffff00" :weight 'extra-bold)

;;;; Paredit
(dolist (hook '(emacs-lisp-mode-hook
                lisp-interaction-mode-hook
                lisp-mode-hook
                ielm-mode-hook
                scheme-mode-hook
                inferior-scheme-mode-hook
                clojure-mode-hook
                cider-repl-mode-hook
                slime-repl-mode-hook))
  (add-hook hook 'enable-paredit-mode))

(defun my/paredit-edit-next-line ()
  (interactive)
  (let ((syntax (char-syntax (char-after))))
    (if (eq syntax ?\()
        (paredit-forward)
      (paredit-forward-up))
    (paredit-newline)))

(with-eval-after-load 'paredit
  (define-key paredit-mode-map (kbd "M-RET") 'my/paredit-edit-next-line)
  (define-key paredit-mode-map (kbd "C-c C-l") 'editutil-toggle-let)
  (define-key paredit-mode-map (kbd "C-c C-q") 'paredit-reindent-defun)
  (define-key paredit-mode-map (kbd "C-c SPC") 'mark-sexp)
  (define-key paredit-mode-map (kbd "M-q") 'nil)
  (define-key paredit-mode-map (kbd "M-)") 'move-past-close-and-reindent))
