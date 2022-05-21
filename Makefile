
.PHONY: all
all: init brew defaults

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

.PHONY: defaults
defaults:
	@echo '==> Start to setup macOS defaults.'
	@echo ''
	@./init/os_setting.sh
