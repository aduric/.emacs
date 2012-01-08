(add-to-list 'load-path "~/.emacs.d/")


;;; Fix junk characters in shell mode
(add-hook 'shell-mode-hook
         'ansi-color-for-comint-mode-on)


;;(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")


;;(require 'yasnippet) ;; not yaset-bundle
;;(yas/initialize)
;;(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;;(require 'auto-complete)
;;(global-auto-complete-mode t)

;;(require 'pycomplete)

;;(load-library "init_python")

(setq ipython-command "/usr/bin/ipython")
(require 'ipython)
(setq py-python-command-args '("-pylab" "-colors" "LightBG"))

(normal-erase-is-backspace-mode 0)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-directory "~/Dropbox/org")
(setq org-agenda-files (list "~/Dropbox/org/work.org" 
                             "~/Dropbox/org/home.org"
			     "~/Dropbox/org/fitness.org"))

(add-hook 'org-mode-hook 'turn-on-font-lock)

;(require 'dired+)
;(toggle-dired-find-file-reuse-dir 1)

(delete-selection-mode t)

(add-to-list 'load-path "~/.emacs.d/remember/")
(require 'remember)

(require 'sudo-save)

(require 'auto-complete)

(add-to-list 'load-path "~/.emacs.d/icicles/")
(require 'remember)

;; yes / no to y / n
(fset 'yes-or-no-p 'y-or-n-p)

;; Move through buffers by Ctrl+up,down keys
;;(windmove-default-keybindings)
(global-set-key (kbd "C-x <down>") 'next-multiframe-window)
(global-set-key (kbd "C-x <up>") 'previous-multiframe-window)

;; Get rid of the <2> with duplicate names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; Visually show regions
(setq transient-mark-mode t)

;; Show line numbers
(setq line-number-mode t)

;; Flyspell
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker" t)
(autoload 'flyspell-delay-command "flyspell" "Delay on command" t)
(autoload 'tex-mode-flyspell-verify "flyspell" :: t)
(add-hook 'LaTex-mode-hook 'flyspell-mode)

;; MATLAB
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")


;; Tramp mode password cache
(require 'password-cache)
(setq password-cache-expiry nil)

;;TOP-MODE
;;(require 'top-mode)

;;CEDET-Semnatic
(load-file "~/.emacs.d/cedet-1.0pre7/common/cedet.el")
(require 'semantic-ia)
(global-ede-mode 1)
(semantic-load-enable-code-helpers)

;;ECB
(add-to-list 'load-path "~/.emacs.d/ecb-snap/")
(require 'ecb)

;;;;;;;;;;; FLYMAKE, PYFLAKES, etc... ;;;;;;;;;;;;;;;

  (when (load "flymake" t) 
         (defun flymake-pyflakes-init () 
           (let* ((temp-file (flymake-init-create-temp-buffer-copy 
                              'flymake-create-temp-inplace)) 
              (local-file (file-relative-name 
                           temp-file 
                           (file-name-directory buffer-file-name)))) 
             (list "pyflakes" (list local-file)))) 

         (add-to-list 'flymake-allowed-file-name-masks 
                  '("\\.py\\'" flymake-pyflakes-init))) 

   (add-hook 'find-file-hook 'flymake-find-file-hook)


;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; This from a japanese individual.  I hope it works.
(setq default-buffer-file-coding-system 'utf-8)
;; From Emacs wiki
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(dired-dwim-target t)
 '(dired-recursive-deletes (quote always))
 '(ecb-options-version "2.40")
 '(tramp-chunksize 500))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


;; nXHTML mode
(load "~/.emacs.d/nxhtml/autostart")