# Contributing

## Bugs, Improvements and new Features

Go to [Issues](https://github.com/hubisan/emacs-template-package/issues) and
make a new issue.

Make sure to:

- Check that the issue has not already been reported (open and closed ones).
- Check that the issue is not part of an active pull request.

## Pull Requests

Cool that you want to contribute your code :-)

Remember to:

- Include only one feature in a pull request.
- Open an issue and mention/reference your planned pull request.
- The tests must pass (see [Testing](#testing)).
- Update [README.org](https://github.com/hubisan/emacs-template-package/blob/master/README.org) if needed.
- Update the documentation if needed (see [Documentation](#documentation))
- Update [CHANGELOG.org](https://github.com/hubisan/emacs-template-package/blob/master/CHANGELOG.org).

### Testing

Uses [makem.sh](https://github.com/alphapapa/makem.sh) for linting and running
the tests. The tests are written with
[buttercup](https://github.com/jorgenschaefer/emacs-buttercup). After pushing a
GitHub action is triggered to automatically lint and run tests. The outcome can
be seen on the
[Actions](https://github.com/hubisan/emacs-template-package/actions) page.

#### Lint & run tests

To lint the package and run the tests locally from the command line you can use
the Makefile targets or call makem.sh directly. To run Emacs with an empty
configuration and not use your local emacs configuration it is best to use the
sandbox mechanism provided by makem.sh.

For convenience there are some additional make targets for linting and testing.
Make sure to build the sandbox before running the tests and to rebuild it if the
dependencies or the emacs version have changed. The main targets are:

| Target                | Description                                                                                |
|:----------------------|:-------------------------------------------------------------------------------------------|
| `sandbox-build`       | Creates the `.sandbox` directory and installs the dependencies and linters in the sandbox. |
| `sandbox-clean`       | Removes the `.sandbox` directory.                                                          |
| `sandbox-rebuild`     | Runs `sandbox-clean` and then `sandbox-build`.                                             |
| `sandbox-all`         | Run the tests and lint the package in the sandbox.                                         |
| `sandbox-lint`        | Lint in the sandbox.                                                                       |
| `sandbox-test`        | Run the tests in the sandbox.                                                              |
| `sandbox-interactive` | Load the packages in the sandbox and launch Emacs (GUI).                                   |

There are additional targets for linting to be able to call the linters
separately (those linters except `elsa` are all run with `sandbox-lint`):

| Target                  | Description                                                    |
|:------------------------|:---------------------------------------------------------------|
| `sandbox-lint-checkdoc` | Run checkdoc. Checks for style errors.                         |
| `sandbox-lint-compile`  | Byte-compile source files with warnings as errors.             |
| `sandbox-lint-declare`  | Run check-declare.                                             |
| `sandbox-lint-elsa`     | Run Elsa (not included in "lint" rule).                        |
| `sandbox-lint-indent`   | Lint indentation.                                              |
| `sandbox-lint-package`  | Run package-lint, a linting library for elisp package metadata |
| `sandbox-lint-regexps`  | Relint scans elisp files for mistakes in regexps.              |

To increase the verbosity add `v=v` or `v=vv` before or after the target like
`make v=vv sandbox-all`.

### Documentation

The files to build the documentation are stored in the
[docs](https://github.com/hubisan/emacs-template-package/blob/master/docs)
folder. The settings for the documentation can be found in
[mkdocs.yml](https://github.com/hubisan/emacs-template-package/blob/master/mkdocs.yml).

#### Files

The documentation has the following files:

| File            | Content                                                                                               |
|:----------------|:------------------------------------------------------------------------------------------------------|
| index.md        | The homepage of the package describe its purpose and includes a description of the main features.     |
| installation.md | Instructions on how to install the package.                                                           |
| usage.md        | Description on how to use the package including customization (variables and faces) and key bindings. |
| changelog.md    | The changelog of the package.                                                                         |
| contributing.md | The guidelines for contributing.                                                                      |

#### Building the Documentation

The documentation is automatically built and pushed to the `gh-pages` branch
with [mkdocs-material](https://squidfunk.github.io/mkdocs-material/) and a
GitHub Action when the master branch is updated.

To preview the documentation locally install the dependencies:

```shell
pip3 install mkdocs-material
pip3 install mkdocs-minify-plugin
pip3 install mkdocs-git-revision-date-localized-plugin
```

Then run a local server with `mkdocs serve` at <http://localhost:8000/>. The
documentation will be built and live reloading is started. Upon any changes the
documentation is automatically rebuilt and the page is reloaded.

#### Taking Svg-Screenshots

If you have build Emacs with Cairo support (check variable
`system-configuration-features`) you can take vector screenshots of your Emacs
to use for the documentation. The Cairo flag is not on by default when building
from source.

```emacs-lisp
(defun my-emacs-screenshot-svg ()
    "Save a screenshot of the current frame as an SVG image.
  Saves to a temp file and puts the filename in the kill ring."
    (interactive)
    (let* ((filename (make-temp-file "emacs-screenshot" nil ".svg"))
           (data (x-export-frames nil 'svg)))
      (with-temp-file filename
        (insert data))
      (kill-new filename)
      (message filename)))
```
