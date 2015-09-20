#
# Cookbook Name:: kibana
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'devtools' do
  user 'root'
  cwd '/home/ec2-user'
  code <<-EOH
    yum -y groupinstall "Base" "Development tools" "Japanese Support"
  EOH
end

bash 'utils' do
  user 'root'
  cwd '/home/ec2-user'
  code <<-EOH
    yum -y install tar
  EOH
end

bash 'install kibana' do
  user 'root'
  cwd '/usr/local/src'
  code <<-EOH
    wget https://download.elastic.co/kibana/kibana/kibana-4.1.2-linux-x64.tar.gz
    tar -zxvf kibana-4.1.1-linux-x64.tar.gz
    mv kibana-4.1.2-linux-x64 ../kibana
    chwon -R kibana:kibana kibana
  EOH
end

# 起動スクリプト作成
template '/etc/init.d/kibana' do
  owner 'root'
  mode 0755
  source 'kibana.erb'
end

# 起動
bash 'start kibana' do
  user 'root'
  code <<-EOH
    /etc/init.d/kibana start
  EOH
end

# 自動起動設定
service 'kibana' do
  action :enable
end
