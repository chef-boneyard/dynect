require 'spec_helper'

describe 'a_record recipe on Ubuntu 14.04' do
  context 'with databag based configuration' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.set[:lsb][:codename] = 'trusty'
        node.set['hostname'] = 'host'
        node.set['ipaddress'] = '127.0.0.1'
        node.set['dynect']['domain'] = 'example.com'
        node.set['dynect']['zone'] = 'z'
        node.set['dynect']['data_bag_name'] = 'passwords'
        node.set['dynect']['data_bag_item'] = 'dynect'
      end.converge('dynect::a_record')
    end

    before do
      allow(Chef::EncryptedDataBagItem).to receive(:load).with('passwords', 'dynect').and_return({
        'customer' => 'xavier',
        'username' => 'yolanda',
        'password' => 'zoolander'
      })
    end

    it 'places an A record' do
      expect(chef_run).to update_dynect_rr('chefspec').with(
        record_type: 'A',
        rdata: {
          'address' => '127.0.0.1'
        },
        fqdn: 'chefspec.example.com',
        customer: 'xavier',
        username: 'yolanda',
        password: 'zoolander',
        zone: 'z'
      )
    end
  end

  context 'with inline configuration' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set[:lsb][:codename] = 'trusty'
        node.set['ipaddress'] = '127.0.0.1'
        node.set['dynect']['domain'] = 'example.com'
        node.set['dynect']['customer'] = 'alice'
        node.set['dynect']['username'] = 'bob'
        node.set['dynect']['password'] = 'carol'
        node.set['dynect']['zone'] = 'z'
      end.converge('dynect::a_record')
    end

    it 'places an A record' do
      expect(chef_run).to update_dynect_rr('chefspec').with(
        record_type: 'A',
        rdata: {
          'address' => '127.0.0.1'
        },
        fqdn: 'chefspec.example.com',
        customer: 'alice',
        username: 'bob',
        password: 'carol',
        zone: 'z'
      )
    end
  end
end
