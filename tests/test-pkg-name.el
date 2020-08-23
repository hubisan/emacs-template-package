;;; test-pkg-name.el --- Tests for {{{pgk-name}}} -*- lexical-binding:t -*-

;; Package-Requires: ((buttercup))

;;; Commentary:

;; If you wnat to split your tests into multiple files just use another file
;; named test-*.el, *-test.el or *-tests.el

;;; Code:

;; * Requirements

(require 'buttercup)
(require 'ert)

(require 'pkg-name)

;; * Helpers

;; * Heading1

(describe "A suite"
  (it "contains a spec with an expectation"
    (expect t :to-be t)))

(provide 'test-pkg-name)

;;; test-pkg-name.el ends here
