(defvar ragtag-mode-map (make-keymap))

(defun ragtag/insert-eval-mark ()
  (interactive)
  (insert "<%= ")
  (save-excursion (insert " %>")))

(defun ragtag/wrap-eval-mark ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (end-of-thing 'whitespace)
    (insert "<%= ")
    (end-of-line)
    (insert " %>")))

(defun ragtag/insert-expr-mark ()
  (interactive)
  (insert "<% ")
  (save-excursion (insert " %>")))

(defun ragtag/wrap-expr-mark ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (end-of-thing 'whitespace)
    (insert "<% ")
    (end-of-line)
    (insert " %>")))

(defun ragtag/insert-comment-mark ()
  (interactive)
  (insert "<%# ")
  (save-excursion (insert " %>")))

(defun ragtag/wrap-comment-mark ()
  (interactive)
  (save-excursion
    (beginning-of-line)
    (end-of-thing 'whitespace)
    (insert "<%# ")
    (end-of-line)
    (insert " %>")))

(defun ragtag/wrap-inline-tag ()
  (interactive)
  (let ((tag-name (thing-at-point 'symbol)) (symbol-bounds (bounds-of-thing-at-point 'symbol)))
    (delete-region (car symbol-bounds) (cdr symbol-bounds))
    (insert (format "<%s>" tag-name))
    (save-excursion (insert (format "</%s>" tag-name)))))

(defun ragtag/wrap-multiline-tag ()
  (interactive)
  (let ((tag-name (thing-at-point 'symbol)) (symbol-bounds (bounds-of-thing-at-point 'symbol)))
    (delete-region (car symbol-bounds) (cdr symbol-bounds))
    (insert (format "<%s>" tag-name))
    (save-excursion (insert (format "</%s>" tag-name))) (save-excursion (newline-and-indent)) (newline-and-indent)
    ))

(defun ragtag/insert-doctype-tag()
  (interactive)
  (insert "<!doctype html>"))

(defun ragtag/insert-link-tag(rails-tag-helper)
  (interactive "P")
  (if rails-tag-helper
      (progn (insert "<%= stylesheet_link_tag '")
             (save-excursion (insert "' %>")))
    (insert "<link rel=\"stylesheet\" href=\"/stylesheets/")
    (save-excursion (insert ".css\" />"))))

(defun ragtag/insert-js-mark(rails-tag-helper)
  (interactive "P")
  (if rails-tag-helper
      (progn (insert "<%= javascript_include_tag '")
             (save-excursion (insert "' %>")))
    (insert "<script type=\"text/javascript\" src=\"/javascripts/")
    (save-excursion (insert ".js\" />"))))

(defun ragtag/insert-meta-mark()
  (interactive)
  (insert "<meta charset=\"utf-8\"/>"))

(define-key ragtag-mode-map (kbd "C-x =") #'ragtag/insert-eval-mark)
(define-key ragtag-mode-map (kbd "C-x +") #'ragtag/wrap-eval-mark)
(define-key ragtag-mode-map (kbd "C-x -") #'ragtag/insert-expr-mark)
(define-key ragtag-mode-map (kbd "C-x _") #'ragtag/wrap-expr-mark)
(define-key ragtag-mode-map (kbd "C-x '") #'ragtag/insert-comment-mark)
(define-key ragtag-mode-map (kbd "C-x \"") #'ragtag/wrap-comment-mark)
(define-key ragtag-mode-map (kbd "C-x SPC") #'ragtag/wrap-inline-tag)
(define-key ragtag-mode-map (kbd "C-x <return>") #'ragtag/wrap-multiline-tag)
(define-key ragtag-mode-map (kbd "C-x !") #'ragtag/insert-doctype-tag)
(define-key ragtag-mode-map (kbd "C-x @") #'ragtag/insert-link-tag)
(define-key ragtag-mode-map (kbd "C-x $") #'ragtag/insert-js-mark)
(define-key ragtag-mode-map (kbd "C-x #") #'ragtag/insert-meta-mark)

;;;###autoload
(define-minor-mode ragtag-mode "The ragtag Vim plugin clone for Emacs." nil nil ragtag-mode-map)

(provide 'ragtag)

