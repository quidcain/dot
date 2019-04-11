script_dir=$(cd `dirname $0` && pwd)
script_name=emacs-console
sudo ln -s $script_dir/$script_name /usr/local/bin/$script_name
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/emacs-console 50
