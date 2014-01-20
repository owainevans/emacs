


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))
; (autoload 'python-mode "python-mode" "Python Mode." t)
; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
; (add-to-list 'interpreter-mode-alist '("python" . python-mode))


; ipython as default interpreter
(require 'python)
(setq python-shell-interpreter "ipython")
(setq python-shell-interpreter-args "--pylab")



;; el-get stuff
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; Jedi stuff
(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:setup-keys t)
(add-hook 'python-mode-hook 'jedi:setup)
