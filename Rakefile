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
    run "mkdir -p /var/www/dev/#{@application}/current/public/d/xhtml"
    run "chmod 0777 /var/www/dev/#{@application}/current/public/d/xhtml"
  end
  task :deploy => [:update, :restart, :fix]
end

task :geturls do
  command = %q~ echo "myurls = Array.new" && cat chimailmadmin.rb | grep -E "get|r301|rewrite " | sed -r "s/    get //g" | sed -r "s/ do//g" | sed -r "s/[^\+]*\+'([^']+').+/'\/\1/g" | sort | uniq | awk '{print "myurls << " $1}'r~
  puts `#{command}`
end
 
  
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = Dir.glob('spec/*_spec.rb')
  t.spec_opts << '--format specdoc'
  t.rcov = true
  t.rcov_opts = ['--exclude', '/var/lib/gems/1.8/gems,/usr/bin/spec,spec']
end