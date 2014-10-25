(define-key isearch-mode-map "\C-h" 'isearch-delete-char)
;; TODO: make M-h delete-word in isearch

;; Make C-h and M-h backspace keys
(defvar my-overriding-binding-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map [?\C-h] 'delete-backward-char)
    (define-key map [?\M-h] 'backward-kill-word)
        (define-key map [?\M-o] 'other-window)
    map))
(define-minor-mode my-overriding-binding-mode
  "Personal global key-bindings."
  :global t)
(my-overriding-binding-mode 1)

;;(setq help-char [f1])                           ; I don't want help when I'm just trying to backspace! - Does it anyway. :/
(global-unset-key [f2])				; I'll set F2 myself thanks
(global-unset-key [f10])			; No F10 menu key
(global-unset-key (kbd "C-z"))                  ; Stop that pesky accidental hide
(global-set-key (kbd "M-?") 'mark-paragraph)	; Use this more!
(global-set-key (kbd "<f5>") 'recompile)	; Also this
(global-set-key (kbd "M-o") 'other-window)	; Handy key for other-window

(provide 'init-personal-keybinds)
