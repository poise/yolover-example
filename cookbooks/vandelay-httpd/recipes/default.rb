#
# Copyright 2016, Noah Kantrowitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

httpd_service 'default' do
  action [:create, :start]
end

directory '/srv/vandelay' do
  group 'apache'
  mode '750'
  owner 'root'
end

template '/srv/vandelay/index.html' do
  group 'apache'
  mode '640'
  owner 'root'
  source 'index.html.erb'
end

httpd_config 'default' do
  notifies :restart, 'httpd_service[default]'
  source 'site.conf.erb'
end
