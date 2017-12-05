zip_file = '/home/awscli-bundle.zip'
package 'unzip'

directory '/opt' do
  owner 'root'
  group 'root'
  recursive false
  mode '0755'
end

remote_file zip_file do
  source node['generic']['aws-cli-url'].to_s
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  not_if { ::File.exist?('/home/awscli-bundle.zip') }
  notifies :run, 'execute[Unzip the bundle]', :immediately
end

execute 'Unzip the bundle' do
  user 'root'
  cwd '/home'
  command 'unzip awscli-bundle.zip'
  action :nothing
  not_if { ::File.exist?('/home/awscli-bundle') }
  notifies :run, 'execute[Install cli]', :immediately
end

execute 'Install cli' do
   user 'root'
   cwd '/home'
   command 'awscli-bundle/install -i /opt/aws -b /bin/aws'
   not_if { ::File.exist?('/opt/aws') }
   action :nothing
end