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

describe file('/var/cache/urubu/urubu-workshopbox_doc') do
  it { should be_directory }
  it { should be_mode '755' }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
