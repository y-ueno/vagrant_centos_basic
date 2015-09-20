#
# Cookbook Name:: minimal
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "devtools" do
  user "root"
  command 'yum -y groupinstall "Development Tools" "Base"'
  action :run
end

%w[
  git
  tar
  gzip
  openssl-devel
  libffi-devel
  tcl-devel
  tk-devel
  libxml2-devel
  readline-devel
  nc
  tcpdump
  vim
].each do |p|
  package p do
    action :install
  end
end
