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


echo "Installing custom profile"
CUSTOM_PROFILE="$HOME/.dotfiles/profile/.profile"
if ! grep -Fxq "source $CUSTOM_PROFILE" ~/.profile
then
  echo "source $CUSTOM_PROFILE" >> ~/.profile
  source "$CUSTOM_PROFILE"
fi


echo "Installing custom bashrc"
CUSTOM_BASHRC="$HOME/.dotfiles/profile/.bashrc"
if ! grep -Fxq "source $CUSTOM_BASHRC" ~/.bashrc
then
  echo "source $CUSTOM_BASHRC" >> ~/.bashrc
  source "$CUSTOM_BASHRC"
fi
