require 'spec_helper'

describe 'default recipe on ubuntu 16.04' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') }
  let(:chef_run) { runner.converge('dynect::default') }

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end

  it 'installs the chef gem' do
    expect(chef_run).to install_chef_gem('dynect_rest')
  end
end
