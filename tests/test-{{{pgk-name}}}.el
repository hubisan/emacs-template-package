;;; test-{{{pgk-name}}}.el --- Tests for {{{pgk-name}}} -*- lexical-binding:t -*-

;; Package-Requires: ((buttercup))

;;; Commentary:

;; If you wnat to split your tests into multiple files just use another file
;; named test-*.el, *-test.el or *-tests.el

;;; Code:

;; * Requirements

(require 'buttercup)
(require 'ert)

(require '{{{pgk-name}}})

;; * Helpers

;; * Heading1

(describe "A suite"
  (it "contains a spec with an expectation"
    (expect t :to-be t)))

(provide 'test-{{{pgk-name}}})

;;; test-{{{pgk-name}}}.el ends here
