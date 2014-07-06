;; path where settings files are kept
(add-to-list 'load-path "~/.emacs.d/settings")
;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")

;; define various custom functions
(require 'custom-functions)

;; configure general settings
(require 'general-settings)

;; install dependencies with el-get
;(require 'el-get-settings)

;---------------;
;;; Utilities ;;;
;---------------;

;; Git
;; (include-plugin "magit")
;; (require 'magit)

;; Popup
;; (include-elget-plugin "popup")
;; (require 'popup)

;; ;; Websocket
;; (include-plugin "websocket")
;; (require 'websocket)

;; Request
(include-plugin "request")
(require 'request)

;; Auto complete
;(require 'auto-complete-settings)

;; Camelcase functions
;(require 'camelcase-settings)

;; Helm
;(require 'helm-settings)


;-----------;
;;; Modes ;;;
;-----------;

;; Ido mode
(require 'ido)
(ido-mode 1)

;; MuMaMo
;(require 'mumamo-settings)

;; Markdown mode
;(require 'markdown-settings)

;; Python mode 
(require 'python-settings)

;; LaTeX and Auctex
(require 'latex-settings)

;; SCSS Mode
(require 'scss-settings)

;; Matlab mode
;(require 'matlab-settings)

;; Nyancat mode!
;(nyan-mode 1)


;---------------------------------------------------------------------
;; Put auto 'custom' changes in a separate file (this is stuff like
;; custom-set-faces and custom-set-variables)
(load 
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))


;; python mode
 ;; (autoload 'python-mode "python-mode" "Python Mode." t)
 ;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
 ;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

(defun ipy ()
    (interactive)
    (term "/usr/bin/ipython"))


(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args (if (system-is-mac)
				   "--gui=osx --matplotlib=osx --colors=Linux"
                                   (if (system-is-linux)
				       "--pylab" "--colors=LightBG") )
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)
