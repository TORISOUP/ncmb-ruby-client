$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.dirname(__FILE__))
require 'rubygems'
require 'ncmb'
require 'yaml'
yaml = YAML.load_file(File.join(File.dirname(__FILE__), '..', 'setting.yml'))
NCMB.initialize application_key: yaml['application_key'], client_key: yaml['client_key']

@role = NCMB::RoleClient.new
role = @role.get_role_by({"roleName": "Free"})
role.first.add_user('7W4MVsGkOZjU5pWA')
role = @role.get_role_by({"roleName": "Premium"})
role.first.add_user('7W4MVsGkOZjU5pWA')
