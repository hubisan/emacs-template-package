# Installation

## From Melpa

Install the package from MELPA with for instance
[use-package](https://github.com/jwiegley/use-package):

```emacs-lisp
(use-package {{{pgk-name}}}
  :ensure t
  :defer t
  :hook (...)
  :init
  ;; Customization
  (setq
   ;; ...
   ))
```

## From Github

You can install the package from github with for instance
[use-package](https://github.com/jwiegley/use-package),
[quelpa](https://github.com/quelpa/quelpa) and
[quelpa-use-package](https://github.com/quelpa/quelpa-use-package) as follows:

```emacs-lisp
(use-package {{{pgk-name}}}
  :ensure nil
  :defer t
  :quelpa ({{{pgk-name}}} :fetcher github :repo "...")
  :hook (...)
  :init
  ;; Customization
  (setq
   ;; ...
   ))
```
