script_dir=$(cd `dirname $0` && pwd)
script_name=.vimrc
ln -s $script_dir/$script_name ~/$script_name
