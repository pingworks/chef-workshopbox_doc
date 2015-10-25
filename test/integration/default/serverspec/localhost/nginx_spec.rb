require_relative '../spec_helper'

describe package('nginx') do
  it { should be_installed }
end

describe port(80) do
  it { should be_listening.with('tcp') }
end
