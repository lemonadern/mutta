PHONY: install, completion-dir-755, stow-link, stow-adopt

install:
	./scripts/install-brew.sh
	brew install stow

completion-dir-755:
	./scripts/completion-dir-755.sh

# link new files
stow-link:
	stow -d stow -t ~ brew zsh git nvim tmux starship alacritty

# adopt existing files
# stow-adopt:
# 	stow --adopt -v -d stow -t ~ brew zsh git nvim tmux starship alacritty
