# ragtag-el
The ragtag Vim plugin clone for Emacs

Usage:

```lisp
(autoload 'ragtag-mode "ragtag")
(add-hook 'web-mode-hook 'ragtag-mode)
(add-hook 'html-erb-mode-hook 'ragtag-mode)
```

Key bindings:

| Mapping | Change to | Function |
|---|---|---|
| C-x = | `foo<%= ^ %>` | ragtag/insert-eval-mark |
| C-x + | `<%= foo^ %>` | ragtag/wrap-eval-mark |
| C-x - | `foo<% ^ %>` | ragtag/insert-expr-mark |
| C-x _ | `<% foo^ %>` | ragtag/wrap-expr-mark |
| C-x ' | `foo<%# ^ %>` | ragtag/insert-comment-mark |
| C-x " | `<%# foo^ %>` | ragtag/wrap-comment-mark |
| C-x SPC | `<foo>^</foo>` | ragtag/wrap-inline-tag |
| C-x <return> | `<foo>\n^\n</foo>` | ragtag/wrap-multiline-tag |
| C-x ! | `<!doctype html>` | ragtag/insert-doctype-tag |
| C-x @ | `<link rel="stylesheet" href="/stylesheets/^.css"` /> | ragtag/insert-link-tag |
| C-x $ | `<script type="text/javascript" src="/javascripts/^.js" />` | ragtag/insert-js-mark |
| C-u C-x @ | `<%= stylesheet_link_tag '^' %>` | ragtag/insert-link-tag |
| C-u C-x $ | `<%= javascript_include_tag '^' %>` | ragtag/insert-js-mark |
| C-x # | `<meta charset="utf-8" />` | ragtag/insert-meta-mark |

