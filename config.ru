use Rack::Static, :urls => ['/favicon.ico'], :root => 'web/s/'

if ENV['RACK_ENV'] == "demo"
  mountpath = '/demo/chimailmadmin/'
  dirpfx = '/var/www/dev/chimailmadmin/current'
elsif ENV['RACK_ENV'] == "development"
  mountpath = '/dev/'
  dirpfx = '/var/www/dev/chimailmadmin'
else
  mountpath = '/'
end

require 'chimailmadmin'

map mountpath do
  ccf = 'config/customconf.rb'
  conf = { :uripfx => mountpath.gsub(/^\/$/,''), :ccf => ccf }
  myapp = Chimailmadmin.new(conf)
  myapp.set :environment, 'development'
  run myapp
end
