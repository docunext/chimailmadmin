if ENV['RACK_ENV'] == "demo"
  mountpath = '/demo/chimailmadmin/'
  dirpfx = '/var/www/dev/chimailmadmin/current'
elsif ENV['RACK_ENV'] == "development"
  mountpath = '/dev/'
  dirpfx = '/var/www/dev/chimailmadmin'
else
  mountpath = '/'
end

ENV['analytics_key'] = 'UA-9068589-14'

require 'chimailmadmin'

map mountpath do
  ccf = 'config/customconf.rb'
  conf = { :uripfx => mountpath.gsub(/^\/$/,''), :ccf => ccf }
  myapp = Chimailmadmin.new(conf)
  myapp.set :environment, 'development'
  run myapp
end
