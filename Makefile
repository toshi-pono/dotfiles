
.PHONY: all
all: init create_dir brew defaults

# For CI test
.PHONY: test_setup
test_setup: init create_dir brew_test defaults

.PHONY: init
init:
	@echo '==> Initializing'
	@echo ''
	@./init/init.sh

.PHONY: brew
brew:
	@echo '==> Start to install homebrew formula.'
	@echo ''
	@./brew/setup.sh

.PHONY: brew_all
brew_all:
	@echo '==> Start to install homebrew formula full.'
	@echo ''
	@./brew/setup.sh -a

.PHONY: brew_light
brew_light:
	@echo '==> Start to install homebrew formula in light mode.'
	@echo ''
	@./brew/setup.sh -s

.PHONY: brew_test
brew_test:
	@echo '==> Start to install homebrew formula in test mode.'
	@echo ''
	@./brew/setup.sh -t

.PHONY: defaults
defaults:
	@echo '==> Start to setup macOS defaults.'
	@echo ''
	@./init/os_setting.sh

.PHONY: create_dir
create_dir:
	@echo '==> Start to create directory.'
	@echo ''
	@./init/create_dir.sh
