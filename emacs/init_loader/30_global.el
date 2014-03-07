;;;; GNU gtags
(custom-set-variables
 '(helm-gtags-pulse-at-cursor nil))

(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-t") 'helm-gtags-pop-stack)

     (set-face-attribute 'helm-gtags-file nil
                         :foreground "yellow")
     (set-face-attribute 'helm-gtags-lineno nil
                         :foreground "GreenYellow" :underline nil)))

;;; Enable helm-gtags-mode
(dolist (hook '(c-mode-common-hook
                java-mode-hook
                asm-mode-hook))
  (add-hook hook 'helm-gtags-mode))
