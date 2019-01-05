systemType="$(uname -s)"

if [ "$systemType" = 'Linux' ]; then
	echo "Running on Linux"
	echo "Installing apps..."
	./linuxapps.sh
else
	echo "Running on unknown OS"
fi

echo "Linking dotfiles for Apps..."
for DOTFILE in `find ~/.dotfiles/apps`
do
	[ -f "$DOTFILE" ] && ln -sv "$DOTFILE" ~
done
