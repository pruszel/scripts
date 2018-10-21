DESTDIR=~/dev/dotfiles/osx;
if [ ! -d $DESTDIR ]; then
	echo "Destination directory \"$DESTDIR\" does not exist";
	exit 1;
fi

alias cp="cp -v";

# Aliases
cp ~/.config/.aliases $DESTDIR;

# Fish shell
cp ~/.config/fish/config.fish "$DESTDIR/fish/";
cp -R ~/.config/fish/functions "$DESTDIR/fish/";

# Bash
cp ~/.profile $DESTDIR;
cp ~/.bashrc $DESTDIR;
cp ~/.bash_profile $DESTDIR;

# Programs
cp ~/.config/.osx $DESTDIR;
cp ~/.tmux.conf $DESTDIR;
cp ~/.vimrc $DESTDIR;
cp ~/.gitconfig $DESTDIR;
cp ~/.gitignore_global $DESTDIR;

echo "Completed";
