script_dir=$(cd `dirname $0` && pwd)
script_name=emacs-ide
sudo ln -s $script_dir/$script_name /usr/local/bin/$script_name
sudo desktop-file-install $script_dir/$script_name.desktop
