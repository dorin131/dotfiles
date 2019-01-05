echo "Linking dotfiles for Apps..."
for DOTFILE in `find ~/.dotfiles/apps`
do
  [ -f "$DOTFILE" ] && ln -si "$DOTFILE" ~
done


echo "Linking dotfiles for Env..."
for DOTFILE in `find ~/.dotfiles/env`
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
