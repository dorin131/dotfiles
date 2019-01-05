SYSTEM_TYPE="$(uname -s)"

if [ "$SYSTEM_TYPE" = 'Linux' ]
then
  echo "Running on Linux"
  echo "Installing apps..."
  ./linuxapps.sh
else
  echo "Running on unknown OS"
fi


echo "Linking dotfiles for Apps..."
for DOTFILE in `find ~/.dotfiles/apps`
do
  [ -f "$DOTFILE" ] && ln -si "$DOTFILE" ~
done

# Add .my_profile to .profile
echo "Installing custom profile"
CUSTOM_PROFILE="$HOME/.dotfiles/profile/.my_profile"
if ! grep -Fxq "source $CUSTOM_PROFILE" ~/.profile
then
  echo "source $CUSTOM_PROFILE" >> ~/.profile
  source "$CUSTOM_PROFILE"
fi
