;; setting of auto-complete
;; (shell-command "git clone https://github.com/m2ym/auto-complete.git ~/.emacs.d/myelisp/repos/auto-complete")
;; (auto-install-from-url "http://www.emacswiki.org/emacs/download/pos-tip.el")
(require 'pos-tip)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/myelisp/repos/auto-complete/dict")
(ac-config-default)

(setq ac-auto-start nil)
(define-key ac-mode-map (kbd "M-/") 'auto-complete)

(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(define-key ac-complete-mode-map "\C-s" 'ac-isearch)
(define-key ac-completing-map "\t" 'ac-complete)
(setq ac-quick-help-delay 0.5)
