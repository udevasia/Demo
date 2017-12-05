package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

group node['service']['group']

user node['service']['owner'].to_s do
  group node['service']['group']
  system true
  shell '/bin/bash'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode node['service']['mode']
  owner node['service']['owner']
  group node['service']['group']
end
