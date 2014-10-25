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
                      'afternoon
                      'alect-black
                      'alect-black-alt
                      'alect-dark
                      'alect-dark-alt
                      'alect-light
                      'alect-light-alt
                      'ample
                      'ample-zen
                      'anti-zenburn
                      'badger
                      'base16-chalk
                      'base16-default
                      'base16-eighties
                      'base16-greenscreen
                      'base16-mocha
                      'base16-monokai
                      'base16-ocean
                      'base16-railscasts
                      'base16-solarized
                      'base16-tomorrow
                      'birds-of-paradise-plus
                      'bubbleberry
                      'busybee
                      'calmer-forest
                      'cherry-blossom
                      'clues
                      'darcula
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

(defun my-load-theme ()
  "Load a new theme after disabling last one"
  (interactive)
  (disable-all-themes)
  (command-execute 'load-theme)) ;; FIXME: disable after load-theme is successful?

;; Theme keys
(global-set-key (kbd "\C-ctd") 'disable-all-themes)
(global-set-key (kbd "\C-ctl") 'my-load-theme)
(global-set-key (kbd "\C-ctr") 'my-random-theme)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)  ;; ANSI colour in term

(provide 'init-personal-theme)
