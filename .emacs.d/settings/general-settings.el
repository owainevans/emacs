;--------------------------------;
;;; General or Global Settings ;;;
;--------------------------------;

; set PATH, because we don't load .bashrc
; function from https://gist.github.com/jakemcc/3887459
;; (defun set-exec-path-from-shell-PATH ()
;;   (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))
 
;; (if window-system (set-exec-path-from-shell-PATH))

; language
(setq current-language-environment "English")


;(load-file "/home/owainevans/Venturecxx/tool/python-flymake.el")


; don't show the startup screen
(setq inhibit-startup-screen 1)
; don't show the menu bar
;(menu-bar-mode 0)
; don't show the tool bar
(require 'tool-bar)
(tool-bar-mode 0)
; don't show the scroll bar
;(scroll-bar-mode 0)

; turn on mouse wheel support for scrolling
(require 'mwheel)
(mouse-wheel-mode 1)

; set command key to be meta instead of option
(if (system-is-mac)
    (setq ns-command-modifier 'meta))

; number of characters until the fill column 
(setq-default fill-column 70)

; each line of text gets one line on the screen (i.e., text will run
; off the left instead of wrapping around onto a new line)
;(setq-default truncate-lines 1)
; truncate lines even in partial-width windows
(setq truncate-partial-width-windows 1)

; default window width and height
(defun custom-set-frame-size ()
  (add-to-list 'default-frame-alist '(height . 53))
  (add-to-list 'default-frame-alist '(width . 178)))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

; window modifications
;; (global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
;; (global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
;; (global-set-key (kbd "S-C-<down>") 'shrink-window)
;; (global-set-key (kbd "S-C-<up>") 'enlarge-window)

; always use spaces, not tabs, when indenting
(setq-default indent-tabs-mode nil)
; indentation styles
(setq c-basic-offset 8)
(setq c-default-style (quote (
    (c-mode . "bsd") 
    (java-mode . "java") 
    (awk-mode . "awk") 
    (other . "gnu"))))
 
; ignore case when searching
(setq-default case-fold-search 1)

;; copy and cut
(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))


(defun quick-cut-line ()
  "Cut the whole line that point is on.  Consecutive calls to this command append each line to the kill-ring."
  (interactive)
  (let ((beg (line-beginning-position 1))
	(end (line-beginning-position 2)))
    (if (eq last-command 'quick-cut-line)
	(kill-append (buffer-substring beg end) (< end beg))
      (kill-new (buffer-substring beg end)))
    (delete-region beg end))
  (beginning-of-line 1)
  (setq this-command 'quick-cut-line))

(defun avi-kill-line-save (&optional arg)
  "Copy to the kill ring from point to the end of the current line.
With a prefix argument, copy that many lines from point. Negative
arguments copy lines backward. With zero argument, copies the
text before point to the beginning of the current line."
  (interactive "p")
  (save-excursion
    (copy-region-as-kill
     (point)
     (progn (if arg (forward-visible-line arg)
              (end-of-visible-line))
            (point)))))

(global-set-key (kbd "C-7") 'copy-line)
(global-set-key (kbd "M-7") 'quick-cut-line)
(global-set-key (kbd "M-o") 'avi-kill-line-save)

(global-set-key [f8] 'goto-line)
;; (global-set-key (kbd "S-C-<down>") 'shrink-window)
;; (global-set-key (kbd "S-C-<up>") 'enlarge-window)


(global-set-key (kbd "M-]") 'comint-previous-matching-input-from-input) 
(global-set-key (kbd "M-'") 'comint-next-matching-input-from-input)
(global-set-key (kbd "C-;") 'python-indent-shift-left)
(global-set-key (kbd "C-'") 'python-indent-shift-right)
(global-set-key (kbd "C-0") 'run-python)


(global-set-key (kbd "C-q") 'ido-switch-buffer)
(global-set-key (kbd "C-x b") 'list-buffers)
(global-set-key (kbd "M-q") 'other-window)
(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "M-1") 'delete-window)
(global-set-key (kbd "M-.") 'end-of-buffer)
(global-set-key (kbd "M-,") 'beginning-of-buffer)

(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key [f5] 'shell)
(global-set-key (kbd "M-5") 'query-replace)
(global-set-key (kbd "TAB") 'indent-for-tab-command)








; require final newlines in files when they are saved
(setq require-final-newline 1)
; add a new line when going to the next line
(setq next-line-add-newlines t)

; show the current line and column numbers in the stats bar as well
(line-number-mode 1)
(column-number-mode 1)

; don't blink the cursor
;(blink-cursor-mode 0)

; make sure transient mark mode is enabled (it should be by default,
; but just in case)
(transient-mark-mode 1)

; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode 1)

; color theme
;(add-to-list 'custom-theme-load-path (make-plugin-path "color-theme-solarized"))
;(load-theme 'solarized-dark 1)
;(setq solarized-termcolors 256)

; text decoration
;(require 'font-lock)
;(setq font-lock-maximum-decoration 1)
;(global-font-lock-mode 1)
;(global-hi-lock-mode nil)
;(setq jit-lock-contextually 1)
;(setq jit-lock-stealth-verbose 1)

; if there is size information associated with text, change the text
; size to reflect it
(size-indication-mode 1)

; disable backup
;(setq backup-inhibited t)
; disable auto save
;(setq auto-save-default nil)

(provide 'general-settings)
