$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.dirname(__FILE__))
require 'rubygems'
require 'ncmb'
require 'yaml'
yaml = YAML.load_file(File.join(File.dirname(__FILE__), '..', 'setting.yml'))
NCMB.initialize application_key: yaml['application_key'], client_key: yaml['client_key']

dc = NCMB::DataStoreClient.new('premium_users', 'session_token')

data = {
    'user_name' => 'username',
    'user_object_id' => 'aaaaxxxxxxx'
}

acl = {
    'role:Admin' => {
        'write' => true,
        'read' => true
    },
    'aaaaxxxxxxx' =>
        {
            'read' => true
        }
}

puts dc.find({user_name: 'username'})
