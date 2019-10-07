#
# Cookbook:: dynect
# Resource:: rr
#
# Author:: Adam Jacob <adam@chef.io>
# Copyright:: 2010-2019, Chef Software, Inc <legal@chef.io>
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

property :record_type, String
property :rdata, Hash
property :ttl, Integer
property :fqdn, String
property :username, String
property :password, String
property :customer, String
property :zone, String

load_current_value do |desired|
  require 'dynect_rest'

  begin
    @dyn = DynectRest.new(desired.customer, desired.username, desired.password, desired.zone)
    @rr = DynectRest::Resource.new(@dyn, desired.record_type, desired.zone).get(desired.fqdn)

    fqdn @rr.fqdn
    ttl @rr.ttl
    zone @rr.zone
    rdata @rr.rdata
  rescue DynectRest::Exceptions::RequestFailed
    Chef::Log.debug("Cannot find resource #{desired} at Dynect")
    current_value_does_not_exist!
  end
end

action :create do
  return if current_resource
  converge_by("added #{new_resource} to dynect") do
    rr = DynectRest::Resource.new(@dyn, new_resource.record_type, new_resource.zone)
    rr.fqdn(new_resource.fqdn)
    rr.ttl(new_resource.ttl) if new_resource.ttl
    rr.rdata = new_resource.rdata
    rr.save
    @dyn.publish
  end
end

action :update do
  if current_resource
    if new_resource.ttl && current_resource.ttl != new_resource.ttl
      converge_by("changed #{new_resource} ttl from #{current_resource.ttl} to #{new_resource.ttl}") do
        @rr.ttl(new_resource.ttl)
        @rr.save
        @dyn.publish
      end
    end
    if current_resource.rdata != new_resource.rdata
      converge_by("changed #{new_resource} rdata from #{current_resource.rdata.inspect} to #{new_resource.rdata.inspect}") do
        @rr.rdata = new_resource.rdata
        @rr.save
        @dyn.publish
      end
    end
  else
    action_create
  end
end

action :replace do
  converge_by("replace #{new_resource} at dynect") do
    rr = DynectRest::Resource.new(@dyn, new_resource.record_type, new_resource.zone)
    rr.fqdn(new_resource.fqdn)
    rr.ttl(new_resource.ttl) if new_resource.ttl
    rr.rdata = new_resource.rdata
    rr.save(true)
    @dyn.publish
  end
end

action :delete do
  return unless current_resource
  converge_by("delete #{new_resource} from dynect") do
    @rr.delete
    @dyn.publish
  end
end
