name 'dynect'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description "Resource for managing DNS records with Dynect's REST API"
version '4.0.0'

%w(redhat centos scientific oracle fedora ubuntu debian linuxmint suse opensuse opensuseleap freebsd netbsd mac_os_x solaris2 gentoo arch nexus).each do |platform|
  supports platform
end

source_url 'https://github.com/chef-cookbooks/dynect'
issues_url 'https://github.com/chef-cookbooks/dynect/issues'
chef_version '>= 14.0'
