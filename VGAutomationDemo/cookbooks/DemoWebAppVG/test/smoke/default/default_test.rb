# # encoding: utf-8

# Inspec test for recipe DemoWebApp::default

describe package('httpd') do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

describe command('curl localhost') do
  its('stdout') { should match /My FQDN/ }
end

describe port(80) do
  it { should be_listening }
end

describe service('chef-client') do
  it { should be_enabled }
  it { should be_running }
end

describe package('vim-enhanced') do
	it { should be_installed }
end