(require 'bindings-evil)
(require 'ivy)

;;(setq ivy-minibuffer-map (make-sparse-keymap))
(substitute-key-definition 'self-insert-command 'self-insert-command ivy-minibuffer-map original-global-map) 
(define-key ivy-minibuffer-map (kbd "DEL") 'ivy-backward-delete-char)
(define-key ivy-minibuffer-map (kbd "M-t") 'ivy-backward-delete-char)
(define-key ivy-minibuffer-map (kbd "<delete>") 'ivy-delete-char)
(define-key ivy-minibuffer-map (kbd "M-y") 'ivy-delete-char)
(define-key ivy-minibuffer-map (kbd "ESC ESC") 'minibuffer-keyboard-quit)
(define-key ivy-minibuffer-map (kbd "RET") 'ivy-done)
(define-key ivy-minibuffer-map (kbd "C-RET") 'ivy-immediate-done)
(define-key ivy-minibuffer-map (kbd "TAB") 'ivy-partial-or-done)
(define-key ivy-minibuffer-map (kbd "<left>") 'backward-char)
(define-key ivy-minibuffer-map (kbd "M-s") 'backward-char)
(define-key ivy-minibuffer-map (kbd "<right>") 'forward-char)
(define-key ivy-minibuffer-map (kbd "M-f") 'forward-char)
(define-key ivy-minibuffer-map (kbd "<up>") 'ivy-previous-line-or-history)
(define-key ivy-minibuffer-map (kbd "M-e") 'ivy-previous-line-or-history)
(define-key ivy-minibuffer-map (kbd "<down>") 'ivy-next-line-or-history)
(define-key ivy-minibuffer-map (kbd "M-d") 'ivy-next-line-or-history)
(define-key ivy-minibuffer-map (kbd "M-v") 'kill-ring-save)
(define-key ivy-minibuffer-map (kbd "M-n") 'yank)
;; ivy-toggle-regexp-quote

(provide 'bindings-ivy)
