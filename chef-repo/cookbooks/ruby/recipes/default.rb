#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# ruby
bash "install ruby" do
  user node['ruby']['user']
  group node['ruby']['group']
  cwd '/home/vagrant'
  environment "HOME" => '/home/vagrant'
  code <<-EOC
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    exec $SHELL -l
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    rbenv install -v 2.0.0-p645
    rbenv rehash
    rbenv global 2.0.0-p645
  EOC
end

# bundler
# bash "install bundler" do
#   user node['ruby']['user']
#   group node['ruby']['group']
#   cwd '/home/vagrant'
#   environment "HOME" => '/home/vagrant'
#   code <<-EOC
#     gem install bundler
#   EOC
# end

# Gemfile
# template "/home/vagrant/Gemfile" do
#   owner node['ruby']['user']
#   group node['ruby']['group']
#   mode 0644
# end
