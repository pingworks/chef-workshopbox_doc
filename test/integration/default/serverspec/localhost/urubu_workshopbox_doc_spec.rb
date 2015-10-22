require_relative '../spec_helper'

describe package('python-pip') do
  it { should be_installed }
end

describe package('git') do
  it { should be_installed }
end

describe file('/var/cache/urubu') do
  it { should be_directory }
  it { should be_mode '755' }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/var/cache/urubu/urubu-tpl') do
  it { should be_directory }
  it { should be_mode '755' }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

# make sure that the right version has been checked out
describe command('cd /var/cache/urubu/urubu-tpl; git rev-parse HEAD') do
  its(:stdout) { should match /^da6c14245f3a207fb43734cf83c038a918c061b8$/ }
end
