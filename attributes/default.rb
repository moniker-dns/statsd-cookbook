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
# Cookbook Configuration
default[:statsd][:install_repository] = true
default[:statsd][:graphite_search] = "role:graphite AND chef_environment:#{node.chef_environment}"
default[:statsd][:graphite_hosts] = nil

# StatsD Configuration
default[:statsd][:address] = "127.0.0.1"
default[:statsd][:port] = 8125
default[:statsd][:mgmt_address] = "127.0.0.1"
default[:statsd][:mgmt_port] = 8126
default[:statsd][:backends] = ["graphite"]
default[:statsd][:flushInterval] = 10000
default[:statsd][:deleteIdleStats] = false
default[:statsd][:prefixStats] = "statsd"

default[:statsd][:graphite][:legacyNamespace] = false
default[:statsd][:graphite][:globalPrefix] = "stats"
default[:statsd][:graphite][:prefixCounter] = "counters"
default[:statsd][:graphite][:prefixTimer] = "timers"
default[:statsd][:graphite][:prefixGauge] = "gauges"
default[:statsd][:graphite][:prefixSet] = "sets"
