name 'dynect'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description "LWRP for managing DNS records with Dynect's REST API"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.0'

recipe 'dynect', 'Installs the dynect_rest RubyGem'
recipe 'dynect::ec2', 'Dynamically configures Dyn resource records for EC2 nodes based on instance ID and prepopulated attributes on the node'
recipe 'dynect::a_record', 'Example resource usage to configure an A record'

depends 'build-essential'

source_url 'https://github.com/chef-cookbooks/dynect'
issues_url 'https://github.com/chef-cookbooks/dynect/issues'
chef_version '>= 12.1'
