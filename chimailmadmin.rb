###
# Program:: http://www.docunext.com/wiki/Sinatra
# Component:: notapp.rb
# Copyright:: Savonix Corporation
# Author:: Albert L. Lash, IV
# License:: Gnu Affero Public License version 3
# http://www.gnu.org/licenses
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program; if not, see http://www.gnu.org/licenses
# or write to the Free Software Foundation, Inc., 51 Franklin Street,
# Fifth Floor, Boston, MA 02110-1301 USA
##
require 'sinatra/base'
require 'rack/contrib/config'
require 'rack-rewrite'
require 'builder'
require 'sass'
require 'xml/xslt'
require 'rack-xslview'
require 'rack/cache'
require 'sinatra/xslview'
require 'sinatra/simplerdiscount'
require 'rexml/document'
require 'memcache'
require 'json'
require 'dbi'
require 'net/ssh'
require File.dirname(File.dirname(__FILE__)) + '/svxbox/lib/svxbox' unless ENV['RACK_ENV'] == 'production'
require 'svxbox' if ENV['RACK_ENV'] == 'production'

module Sinatra
  module ModBox
    include SvxBox::Sinatricus
    include SvxBox::MarkupGuppy
  end
  helpers ModBox
end

# The container for the Chimailmadmin application
module Chimailmadmin

  class << self
    attr_accessor(:conf, :runtime, :memc, :memcdb)
  end

  # Create the app which will run
  def self.new(conf)
    self.conf = conf
    self.memc = MemCache.new '192.168.8.2:11211', :namespace => 'doculabsappone'
    self.memcdb = MemCache.new '192.168.8.2:21201', :namespace => 'doculabsappone'
    if File.exists?(self.conf[:ccf])
      myconf = File.open(self.conf[:ccf]) { |f| f.read }
      customconf = eval(myconf)
      self.conf.merge!(customconf)
    end
    Main
  end

  # The sub-classed Sinatra application
  class Main < Sinatra::Base

    configure do
      set :static, true
      set :public, 'public'
      set :xslviews, 'views/xsl/'
      set :uripfx, Proc.new { Chimailmadmin.conf[:uripfx] }

      # Set request.env with application mount path
      use Rack::Config do |env|
        env['RACK_ENV'] = ENV['RACK_ENV'] ? ENV['RACK_ENV'] : 'development'
        env['path_prefix'] = Chimailmadmin.conf[:uripfx]
        env['link_prefix'] = Chimailmadmin.conf[:uripfx]
      end

      Chimailmadmin.runtime = Hash.new
      # Setup XSL - better to do this only once
      Chimailmadmin.runtime[:xslt]    = XML::XSLT.new()
      Chimailmadmin.runtime[:xslfile] = File.open('views/xsl/html_main.xsl') {|f| f.read }
      Chimailmadmin.runtime[:xslt].xsl = REXML::Document.new Chimailmadmin.runtime[:xslfile]

      # Setup paths to remove from Rack::XSLView, and params to include
      Chimailmadmin.runtime[:omitxsl] = ['/raw/', '/s/js/']
      Chimailmadmin.runtime[:passenv] = ['PATH_INFO', 'RACK_MOUNT_PATH', 'RACK_ENV','link_prefix','path_prefix']

      # Used in runtime/info
      Chimailmadmin.runtime['started_at'] = Time.now.to_i
    end
    configure :development do
      set :logging, false
      set :reload_templates, true # This does work! :-)
    end
    configure :demo do
      set :logging, true
      set :reload_templates, false # This does work! :-)
    end

    configure :test do
      #
    end

    # Rewrite app url patterns to static files
    use Rack::Rewrite do
      rewrite Chimailmadmin.conf[:uripfx]+'welcome', '/s/xhtml/welcome.html'
      rewrite Chimailmadmin.conf[:uripfx]+'cma-alias-edit', '/s/xhtml/alias_form.html'
      rewrite %r{#{Chimailmadmin.conf[:uripfx]}cma-mailbox-edit/(.*)}, '/s/xhtml/mailbox_form.html?email=$1'
      rewrite %r{#{Chimailmadmin.conf[:uripfx]}cma-import-(.*)}, '/s/xhtml/import_form.html?type=$1'
      rewrite %r{#{Chimailmadmin.conf[:uripfx]}cma-spamassassin-edit}, '/s/xhtml/spam_spamassassin_form.html?type=$1'
      rewrite %r{#{Chimailmadmin.conf[:uripfx]}cma-access-edit}, '/s/xhtml/spam_acl_form.html?type=$1'
      rewrite Chimailmadmin.conf[:uripfx]+'cma-mailbox-edit', '/s/xhtml/mailbox_form.html'
      rewrite Chimailmadmin.conf[:uripfx]+'cma-server-edit', '/s/xhtml/server_form.html'
      rewrite Chimailmadmin.conf[:uripfx]+'cma-domain-edit', '/s/xhtml/domain_form.html'
      rewrite Chimailmadmin.conf[:uripfx]+'cma-access-edit', '/s/xhtml/spam_acl_form.html'
    end

    use Rack::Cache,
      :verbose     => false,
      :metastore   => 'file:/tmp/cache/rack/meta',
      :entitystore => 'file:/tmp/cache/rack/body'

    # Use Rack-XSLView
    use Rack::XSLView, :myxsl => Chimailmadmin.runtime[:xslt], :noxsl => Chimailmadmin.runtime[:omitxsl], :passenv => Chimailmadmin.runtime[:passenv]

    # Sinatra Helper Gems
    helpers Sinatra::XSLView
    helpers Sinatra::ModBox
    helpers Sinatra::SimpleRDiscount

    helpers do
      # These should be different based upon development vs. production
      def get_mailboxes(domain=nil)
        idx_json = Chimailmadmin.memcdb.get('name_index') || '["bill.gates","steve.jobs"]'
        @index = JSON.parse(idx_json)
        @updex = @index.map do |name|
          name.gsub('.',' ').gsub(/\b\w/){$&.upcase}
        end
        return [@index, @updex]
      end
      def get_domains(domain_group=nil)
        idx_json = Chimailmadmin.memcdb.get('dig_index') || '["docunext.com"]'
        return JSON.parse(idx_json)
      end
    end

    get '/' do
      puts Chimailmadmin.conf[:uripfx]
      mredirect 'welcome'
    end

    get '/cma-mailbox-list' do
      @index, @updex = get_mailboxes
      xml = builder :'xml/mailboxes'
      xslview xml, 'mailbox_list.xsl'
    end
    post '/cma-mailbox-post' do
      idx_json = Chimailmadmin.memcdb.get('name_index') || '["bill.gates","steve.jobs"]'
      index = JSON.parse(idx_json)
      index << params[:email_address]
      Chimailmadmin.memcdb.set('name_index',index.uniq.to_json)
      mredirect 'cma-mailbox-list/'
    end

    get '/cma-mailbox-list/*' do
      @index, @updex = get_mailboxes
      @domain = params[:splat].first
      xml = builder :'xml/mailboxes'
      xslview xml, 'mailbox_list.xsl'
    end
    get '/cma-domain-list' do
      @index = get_domains
      xml = builder :'xml/domains'
      xslview xml, 'domain_list.xsl'
    end
    get '/cma-domain-groups' do
      xml = '<root />'
      xslview xml, 'domain_groups.xsl'
    end
    get '/cma-server-list' do
      xml = '<root />'
      xslview xml, 'server_list.xsl'
    end
    get '/cma-access-lists' do
      @index = { "example.com"=>'allow', "example.org"=>'allow' }
      @index['microsoft'] = 'deny'
      xml = builder :'xml/access_lists'
      xslview xml, 'spam_access_list.xsl'
    end
    get '/cma-sa-prefs' do
      settings = ["example.com","example.org","example.net"]
      @index = { 'whitelist_to' => settings }
      xml = builder :"xml/sa_prefs"
      xslview xml, "sa_prefs.xsl"
    end
    # Experiment
    get '/dnu-cma-sa-:pipeline' do
      @prefs = { 'whitelist_to' => ["example.com","example.org"]}
      xml = builder :"xml/sa_#{params[:pipeline]}"
      xslview xml, "sa_#{params[:pipeline]}.xsl"
    end
    get '/cma-info-:info' do
      cache_control :public, :must_revalidate, :max_age => 600
      markdown :"md/cma-#{params[:info]}"
    end
    get '/cma-admin' do
      xslview '<root />', 'admin.xsl', { 'link_prefix' => "#{Chimailmadmin.conf[:uripfx]}"  }
    end
    get '/cma-admin-rr' do
      stdout = '<pre>'<< Chimailmadmin.conf[:user] << "@" << Chimailmadmin.conf[:pfhost] << "\n"
      Net::SSH.start(Chimailmadmin.conf[:pfhost], Chimailmadmin.conf[:user]) do |ssh|
        ssh.exec!("sudo cat /etc/postfix/relay_recipients") do |channel, stream, data|
          stdout << data if stream == :stdout
        end
      end
      stdout << '</pre>'
    end
    get '/cma-admin-sa' do
      stdout = '<pre>'<< Chimailmadmin.conf[:user] << "@" << Chimailmadmin.conf[:sahost] << "\n"
      Net::SSH.start(Chimailmadmin.conf[:sahost], Chimailmadmin.conf[:user]) do |ssh|
        ssh.exec!("sudo cat /etc/spamassassin/local.cf") do |channel, stream, data|
          stdout << data if stream == :stdout
        end
      end
      stdout << '</pre>'
    end
    get '/runtime/info' do
      cache_control :public, :must_revalidate, :max_age => 60
      @uptime   = (0 + Time.now.to_i - Chimailmadmin.runtime['started_at']).to_s
      runtime   = builder :'xml/runtime'
      xslview runtime, 'runtime.xsl'
    end

    get '/raw/json/cma-mailbox-list' do
      content_type :json
      idx_json, names = get_mailboxes
      idx_json.to_json
    end
    get '/raw/json/cma-domain-list' do
      content_type :json
      idx_json = get_domains.to_json
      idx_json
    end
    not_found do
      headers 'Last-Modified' => Time.now.httpdate, 'Cache-Control' => 'no-store'
      %(<div class="block"><div class="hd"><h2>Error</h2></div><div class="bd">This is nowhere to be found. <a href="#{Chimailmadmin.conf[:uripfx]}">Start over?</a></div></div>)
    end

    get '/stylesheet.css' do
      cache_control :public, :max_age => 600
      content_type 'text/css', :charset => 'utf-8'
      sass 'css/notapp'.to_sym
    end
  end

end
