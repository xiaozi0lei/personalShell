#!/bin/bash
# configure the vim to support ruby completion
# 安装pathogen.vim - 用来管理个人的runtimepath和plugins和runtime files
# https://github.com/tpope/vim-pathogen
# 拷贝pathogen的vim插件放到家目录下的.vim下,此插件是用来管理其他插件的,可以自动搜索和加载其他插件
echo "create directory and get the pathogen.vim to ~/.vim/autoload"

mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# 安装rails.vim
# https://github.com/tpope/vim-rails#readme
# rails.vim是支持ruby on rails的vim auto completion的插件
echo "git clone the vim plugins for vim-rails and vim-bundler"

cd ~/.vim/bundle
git clone git://github.com/tpope/vim-rails.git
git clone git://github.com/tpope/vim-bundler.git

# 安装vim-ruby
# https://github.com/vim-ruby/vim-ruby
# vim-ruby是支持ruby的vim auto completion的插件
echo "git clone vim-ruby plugins"

git clone git://github.com/vim-ruby/vim-ruby.git ~/.vim/bundle/vim-ruby

echo
echo "Successful Done!"

exit 0

