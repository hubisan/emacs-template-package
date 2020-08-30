# * makem.sh/Makefile --- Script to aid building and testing Emacs Lisp packages

# This Makefile is from the makem.sh repo: <https://github.com/alphapapa/makem.sh>.

# * Arguments

# For consistency, we use only var=val options, not hyphen-prefixed options.

# NOTE: I don't like duplicating the arguments here and in makem.sh,
# but I haven't been able to find a way to pass arguments which
# conflict with Make's own arguments through Make to the script.
# Using -- doesn't seem to do it.

ifdef install-deps
	INSTALL_DEPS = "--install-deps"
endif
ifdef install-linters
	INSTALL_LINTERS = "--install-linters"
endif

ifdef sandbox
	ifeq ($(sandbox), t)
		SANDBOX = --sandbox
	else
		SANDBOX = --sandbox=$(sandbox)
	endif
endif

ifdef debug
	DEBUG = "--debug"
endif

# ** Verbosity

# Since the "-v" in "make -v" gets intercepted by Make itself, we have
# to use a variable.

verbose = $(v)

ifneq (,$(findstring vv,$(verbose)))
	VERBOSE = "-vv"
else ifneq (,$(findstring v,$(verbose)))
	VERBOSE = "-v"
endif

# * Rules

# TODO: Handle cases in which "test" or "tests" are called and a
# directory by that name exists, which can confuse Make.

%:
	@./makem.sh $(DEBUG) $(VERBOSE) $(SANDBOX) $(INSTALL_DEPS) $(INSTALL_LINTERS) $(@)

.DEFAULT: init
init:
	@./makem.sh $(DEBUG) $(VERBOSE) $(SANDBOX) $(INSTALL_DEPS) $(INSTALL_LINTERS)

# ** Custom Rules

# Added those rules for convenience.

sandbox_dir = '.sandbox'

# Create sandbox and install dependencies and linters.
sandbox-build:
	@./makem.sh --sandbox=$(sandbox_dir) --install-deps --install-linters
	@echo Sandbox created successfully in $(sandbox_dir)  

# Delete the sandbox directory.
sandbox-clean:
	@rm -rf $(sandbox_dir)
	@echo Removed $(sandbox_dir)

sandbox-rebuild: sandbox-clean sandbox-build
	@echo Rebuilt sandbox successfully in $(sandbox_dir)  

# Lint and run tests.
sandbox-all: _sandbox-run-all clean-elc

_sandbox-run-all:
	@./makem.sh --sandbox=$(sandbox_dir) $(DEBUG) $(VERBOSE) all

sandbox-lint: _sandbox-lint-all clean-elc

# Lint in sandbox.
_sandbox-lint-all:
	@./makem.sh --sandbox=$(sandbox_dir) $(DEBUG) $(VERBOSE) lint

sandbox-lint-checkdoc:
	@./makem.sh --sandbox=$(sandbox_dir) $(DEBUG) $(VERBOSE) lint-checkdoc

sandbox-lint-compile: _sandbox-lint-compile clean-elc

_sandbox-lint-compile:
	@./makem.sh --sandbox=$(sandbox_dir) $(DEBUG) $(VERBOSE) lint-compile

sandbox-lint-declare:
	@./makem.sh --sandbox=$(sandbox_dir) $(DEBUG) $(VERBOSE) lint-declare

sandbox-lint-elsa:
	@./makem.sh --sandbox=$(sandbox_dir) $(DEBUG) $(VERBOSE) lint-elsa

sandbox-lint-indent:
	@./makem.sh --sandbox=$(sandbox_dir) $(DEBUG) $(VERBOSE) lint-indent

sandbox-lint-package:
	@./makem.sh --sandbox=$(sandbox_dir) $(DEBUG) $(VERBOSE) lint-package

sandbox-lint-regexps:
	@./makem.sh --sandbox=$(sandbox_dir) $(DEBUG) $(VERBOSE) lint-regexps

sandbox-test: _sandbox-test-all clean-elc

# Test in sandbox.
_sandbox-test-all:
	@./makem.sh --sandbox=$(sandbox_dir) $(DEBUG) $(VERBOSE) test

# Launch Emacs with only stuff loaded from the sandbox.
sandbox-interactive:
	@./makem.sh --sandbox=$(sandbox_dir) $(DEBUG) $(VERBOSE) interactive

# Delete the elc-files and the .sandbox directory.
clean-elc:
	@find . -name \*.elc -type f -delete
	@echo Removed all elc files
