;; My theme customisations

(add-to-list 'custom-theme-load-path "~/.emacs.d/my-themes")

(defun disable-all-themes ()
  "Disable all active themes"
  (interactive)
  (dolist (i custom-enabled-themes)
        (disable-theme i)))

;; Random theme list
(setq my-themes-list (list
                      'adwaita
                      'ample-zen
                      'assemblage
                      'bubbleberry
                      'clues
                      'deeper-blue
                      'dichromacy
                      'light-blue
                      'manoj-dark
                      'misterioso
                      'tango
                      'tango-dark
                      'tsdh-dark
                      'tsdh-light
                      'wheatgrass
                      'whiteboard
                      'wombat))

;; Disable all themes, then apply a random one
(defun my-random-theme ()
  "Load a random theme"
  (interactive)
  (disable-all-themes)
  (setq random-theme (my-random-item my-themes-list))
  (load-theme random-theme)
  (message (format "Loaded theme: %s" random-theme)))


;; Theme keys
(global-set-key (kbd "\C-ctd") 'disable-all-themes)
(global-set-key (kbd "\C-ctl") 'load-theme)
(global-set-key (kbd "\C-ctr") 'my-random-theme)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)  ;; ANSI colour in term

(provide 'init-personal-theme)
