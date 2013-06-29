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

# Install the statsd PPA, if required
if node[:statsd][:install_repository]
  apt_repository "kiall-statsd-#{node['lsb']['codename']}" do
    uri           "http://ppa.launchpad.net/kiall/statsd/ubuntu"
    distribution  node['lsb']['codename']
    components    ["main"]
    key           "DFA62498"
    keyserver     "keyserver.ubuntu.com"
    action        :add
  end
else
  apt_repository "kiall-statsd-#{node['lsb']['codename']}" do
    action  :remove
  end
end
