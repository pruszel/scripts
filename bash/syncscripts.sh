
DESTDIR=~/dev/scripts/osx;
if [ ! -d $DESTDIR ]; then
	echo "Destination directory \"$DESTDIR\" does not exist";
	exit 1;
fi

alias cp="cp -v";

# Copy all com.user.X.plist files
# to scripts directory
grep -rl --null com.user ~/Library/LaunchAgents | xargs -I % -0 cp % $DESTDIR;

echo "Completed";
