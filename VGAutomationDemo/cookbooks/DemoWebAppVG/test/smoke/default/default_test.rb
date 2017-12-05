# # encoding: utf-8

# Inspec test for recipe DemoWebApp::default

describe package('unzip') do
	it { should be_installed }
end

control 'httpd' do
  impact 0.7
  title 'Verify httpd service'
  desc 'Ensures httpd service is up and running'
	describe package('httpd') do
		  it { should be_installed }
		end
	describe service('httpd') do  
	  it { should be_enabled }
	  it { should be_running }
	end
end

control 'file' do
  impact 0.7
  title 'Verify index file'
  desc 'Ensures index file is created'
	describe file('/var/www/html/index.html') do  
	  it { should exist }	  
	end
end

describe command('curl localhost') do
  its('stdout') { should match /My FQDN/ }
end

describe port(80) do
  it { should be_listening }
end

describe user('web_admin') do
  it { should exist }
end

control 'chef-client' do
  impact 0.7
  title 'Verify chef-client service'
  desc 'Ensures chef-client service is up and running'
	describe service('chef-client') do  
	  it { should be_enabled }
	  it { should be_running }
	end
end

describe package('vim-enhanced') do
	it { should be_installed }
end