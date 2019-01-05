echo "Installing git"
sudo apt install git

if ! command -v brew > /dev/null 2>&1
then
  echo "Installing brew"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
fi
