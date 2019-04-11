emacs_smart_dir=$(cd `dirname $0` && pwd)
sudo ln -s $emacs_smart_dir/emacs-smart /usr/local/bin/emacs-smart
sudo desktop-file-install $emacs_smart_dir/emacs-smart.desktop
