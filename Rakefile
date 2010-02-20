require 'rubygems'
require 'rake'
require 'spec/rake/spectask'


task :test => :spec
task :default => :spec


begin
  require "vlad"
  Vlad.load(:app => nil, :scm => "git")
rescue LoadError
  # do nothing
end

namespace :vlad do
  @application = 'chimailmadmin'
  remote_task :restart do
    run "sudo svc -d /service/#{@application}"
    run "sudo svc -u /service/#{@application}"
  end
  remote_task :fix do
    run "mkdir /var/www/dev/#{@application}/current/public/d/xhtml"
    run "chmod 0777 /var/www/dev/#{@application}/current/public/d/xhtml"
  end
  task :deploy => [:update, :restart, :fix]
end


Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = Dir.glob('spec/*_spec.rb')
  t.spec_opts << '--format specdoc'
  t.rcov = true
  t.rcov_opts = ['--exclude', '/var/lib/gems/1.8/gems,/usr/bin/spec,spec']
end