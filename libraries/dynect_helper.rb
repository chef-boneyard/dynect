module Dynect
  module Helper
    def credential_source
      if node['dynect']['data_bag_name']
        Chef::EncryptedDataBagItem.load(
          node['dynect']['data_bag_name'],
          node['dynect']['data_bag_item']
        )
      else
        node['dynect']
      end
    end

    def get_credentials
      credential_source.select { |key, _| %w(customer username password).include? key }
    end
  end
end
