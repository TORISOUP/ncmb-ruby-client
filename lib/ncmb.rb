$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.dirname(__FILE__))
require "ncmb/version"
require "ncmb/client"
require "ncmb/data_store"
require "ncmb/push"
require "ncmb/user/user_client"
require "ncmb/role/role_client"
require "ncmb/role/role"
require "ncmb/login"
require "ncmb/datastore/data_store_client"