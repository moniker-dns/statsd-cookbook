# Copyright 2013 Hewlett-Packard Development Company, L.P.
#
# Author: Kiall Mac Innes <kiall@hp.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#

# Find the Graphite Servers via search, or use the configured servers
graphite_hosts = search_helper_best_ip(node[:statsd][:graphite_search], node[:statsd][:graphite_hosts], false) do |ip, other_node|
  {:host => ip, :port => other_node['graphite']['carbon']['line_receiver_port']}
end

return if graphite_hosts.empty? || graphite_hosts.nil?

# Install the StatsD PPA if necessary
include_recipe "statsd::repository"

# Install the StatsD package
package "statsd" do
  action  :upgrade
end

# Enable+Start the StatsD service
service "statsd" do
  supports    :restart => true, :status => true
  action      [:enable, :start]
end

# Write out the StatsD configuration file
template "/etc/statsd/localConfig.js" do
  source    "localConfig.js.erb"
  owner     "root"
  group     "root"
  mode      0644

  notifies  :restart, "service[statsd]"

  variables(
    :graphite => graphite_hosts[0]
  )
end
