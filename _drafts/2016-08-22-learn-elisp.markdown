---
layout: post
title:  "learn elisp"
date:   2016-08-23 14:55:46
description:  "learn elisp"
categories: elisp
tages: elisp
---

### learn elisp logs
+ search elisp in github.
+ find a repo https://github.com/qinshulei/elisp-guide
+ read https://github.com/qinshulei/elisp-guide
写的不错，从开发者角度，写了一些重点

```
emacs keywords

concat
defun
defvar
let
let*
progn
setq
```

```
Evaluation

Use M-: to evaluate any Emacs Lisp expression and print the result. I personally use this constantly.
Use C-x C-e to evaluate the previous s-expression in the buffer. I personally never use this. See next binding.
Use C-M-x to evaluate the current top-level s-expression. I use this to re-apply defvar and defun declarations.
There is a REPL available by M-x ielm. I tend to use M-: rather than the REPL but you might like it.
Use M-x eval-buffer to evaluate the whole buffer of Emacs Lisp code.
```

```
(current-buffer)
- get the current buffer.

(with-current-buffer buffer-or-name ...)
- temporarily use the given buffer.

(set-buffer buffer-or-name)
- set the current buffer without switching to it.

(switch-to-buffer name)
- switch to the buffer visually.
```

```
;; Buffer-local variables

(defvar your-variable-name nil "Your documentation here.")
(set (make-local-variable 'your-variable-name) <the-value>)
```

```
(point) - current point
(point-max) - maximum point of the buffer
(point-min) - minimum point of the buffer (why is this not just 0? Because of narrowing).
```

```
(region-beginning) - beginning of the region (a point)
(region-end) - end of the region (a point)
(use-region-p) - whether to try to use region-beginning/region-end for manipulation. Handy for use in commands.
(region-active-p) - also handy to know whether the region is active.
```

```
Run M-: (setq debug-on-error t) RET and any errors will open up the debugger.
```

```
(insert "foo" "bar") - to insert text at point.
(delete-region start end) - to delete the region of text.
(insert-buffer-substring-no-properties buffer start end) - insert text from another buffer.
(insert-file-contents <filename>) - insert from a file.
```

```
(goto-char <point>) - go to the point.
(forward-char n) - go forward n chars. Accepts a negative argument.
(end-of-line) - self-explanatory.
(beginning-of-line) - self-explanatory.
(skip-chars-forward "chars") - skip given chars.
(skip-chars-backward "chars") - skip given chars back.
(search-forward "foo") - search for foo, move cursor there.
(search-backward "foo") - search backward.
(search-forward-regexp "blah") - same, but with regexes.
(search-backward-regexp "blah") - same, but with regexes.
```

```
(save-excursion ...)
(save-excursion (beginning-of-line) (looking-at "X"))
```

```
(buffer-substring start end) - get the string at point, including text properties.
(buffer-substring-no-properties start end) - get the string at point, excluding text properties.
(buffer-string) - return the string of the whole buffer.
(looking-at "[a-zA-Z]+") - does text following point match the regex?
(looking-back "[a-zA-Z]+") - does text preceding point match the regex?
```

```
(with-temp-buffer
  (insert "Hello!"))
```
+ find a elisp manual https://www.gnu.org/software/emacs/manual/html_node/elisp/index.html

+ read blog
  http://joelmccracken.github.io/entries/emacs-lisp-for-hackers-part-1-lisp-essentials/
  http://joelmccracken.github.io/entries/emacs-lisp-for-hackers-part-2-emacs-documentation/
  http://joelmccracken.github.io/entries/emacs-lisp-for-hackers-next/
  http://joelmccracken.github.io/entries/emacs-lisp-for-hackers-all-things-variables/
  http://joelmccracken.github.io/entries/emacs-lisp-for-hackers-keys/


+ emacs wiki about learn emacs lisp https://www.emacswiki.org/emacs/EmacsLisp

+ read elisp cook book https://www.emacswiki.org/emacs/ElispCookbook

+ Programming in Emacs Lisp http://www.delorie.com/gnu/docs/emacs-lisp-intro/emacs-lisp-intro_toc.html
