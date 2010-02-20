
if ENV['RACK_ENV'] == "demo"
  mountpath = '/demo/chimailmadmin/'
  dirpfx = '/var/www/dev/chimailmadmin/current'
  ENV['DATABASE_URL'] = 'sqlite3:///var/www/dev/chimailr/rbeans.sqlite3'
elsif ENV['RACK_ENV'] == "development"
  mountpath = '/dev/'
  dirpfx = '/var/www/dev/chimailmadmin'
  ENV['DATABASE_URL'] = 'sqlite3:///var/www/dev/chimailmadmin/rbeans.sqlite3'
else
  mountpath = '/'
end

require 'chimailmadmin'


map mountpath do
  conf = Hash['uripfx', mountpath.gsub(/^\/$/,''), "b", 201]
  myapp = Chimailmadmin.new(conf)
  myapp.set :environment, 'development'
  run myapp
end
