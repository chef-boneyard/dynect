#
# Cookbook:: dynect
# Recipe:: default
#
# Copyright:: 2010-2016, Chef Software, Inc <legal@chef.io>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'build-essential::default'

# Install dynect gem for usage within Chef runs
chef_gem 'dynect_rest' do
  # as per https://www.chef.io/blog/2015/02/17/chef-12-1-0-chef_gem-resource-warnings/
  compile_time false if Chef::Resource::ChefGem.method_defined?(:compile_time)
  action :install
  compile_time false
end
