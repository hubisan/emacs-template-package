;;; test-package-name.el --- Tests for package-name -*- lexical-binding:t -*-

;;; Commentary:

;; <commentary>
;; If you wnat to split your tests into multiple files just use another file
;; named test-*.el, *-test.el or *-tests.el

;;; Code:

;; * Requirements

(require 'buttercup)
(require 'ert)

(require 'package-name)

;; * Helpers

;; * Heading components

(describe "Org-jump: "
  (describe "Org-jump--get-matched-headings-components"
    (describe "works with the followinng args:"
      (it "a file or buffer name and an org-ql query."
        (expect ...)
        (expect ...))
      (it "a list of file or buffer names and an org-ql query.")
      (it "a list with a file or buffer name and an org-ql query.")
      (it "a list with a list of file or buffer names and an org-ql query.")
      (it "multiple lists with a file or buffer name and an org-ql query.")
      (it "multiple lists with a list of file or buffer names and an org-ql query.")
      )
    (describe "supports all types:"
      (it "a normal org-ql")
      (it "narrowing to region.")
      (it "narrowing to heading matching outline path (olp)."
        (expect without parent)
        (expect with parent))
      (it "narrowing to heading with ID."
        (expect without parent)
        (expect with parent))
      (it "narrowing to heading with CUSTOM_ID."
        (expect without parent)
        (expect with parent))
      (it "narrowing to heading at a point."
        (expect without parent)
        (expect with parent))
      (it "narrowing to heading at a marker."
        (expect without parent)
        (expect with parent))
      )
    (describe "returns"
      (it "a concatenated list when used with multiple queries.")
      (it "a list with duplicates removed when arg unique is non-nil.")
      )
    ))

;;; test-package-name.el ends here
