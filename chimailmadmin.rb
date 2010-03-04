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
require 'rubygems'
require 'sinatra/base'
require 'rack/utils'
require 'rack/contrib'
require 'rack-rewrite'
require 'builder'
require 'sass'
require 'xml/xslt'
require 'rack-xslview'
require 'rack/cache'
require 'sinatra/xslview'
require 'rexml/document'
require 'memcache'
require 'json'

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
    Main
  end

  # The sub-classed Sinatra application
  class Main < Sinatra::Base

    configure do
      set :static, true
      set :public, 'public'
      set :xslviews, 'views/xsl/'

      # Set request.env with application mount path
      use Rack::Config do |env|
        env['RACK_ENV'] = ENV['RACK_ENV'] ? ENV['RACK_ENV'] : 'development'
        env['path_prefix'] = Chimailmadmin.conf['uripfx']
        env['link_prefix'] = Chimailmadmin.conf['uripfx']
      end

      Chimailmadmin.runtime = Hash.new
      # Setup XSL - better to do this only once
      Chimailmadmin.runtime['xslt']    = XML::XSLT.new()
      Chimailmadmin.runtime['xslfile'] = File.open('views/xsl/html_main.xsl')
      Chimailmadmin.runtime['xslt'].xsl = REXML::Document.new Chimailmadmin.runtime['xslfile']

      # Setup paths to remove from Rack::XSLView, and params to include
      Chimailmadmin.runtime['omitxsl'] = ['/raw/', '/s/js/', '/s/css/', '/s/img/']
      Chimailmadmin.runtime['passenv'] = ['PATH_INFO', 'RACK_MOUNT_PATH', 'RACK_ENV','link_prefix','path_prefix']

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
      rewrite Chimailmadmin.conf['uripfx']+'welcome', '/s/xhtml/welcome.html'
      rewrite Chimailmadmin.conf['uripfx']+'cma-alias-edit', '/s/xhtml/alias_form.html'
      rewrite %r{#{Chimailmadmin.conf['uripfx']}cma-mailbox-edit/(.*)}, '/s/xhtml/mailbox_form.html?email=$1'
      rewrite %r{#{Chimailmadmin.conf['uripfx']}cma-import-(.*)}, '/s/xhtml/import_form.html?type=$1'
      rewrite Chimailmadmin.conf['uripfx']+'cma-mailbox-edit', '/s/xhtml/mailbox_form.html'
      rewrite Chimailmadmin.conf['uripfx']+'cma-server-edit', '/s/xhtml/server_form.html'
      rewrite Chimailmadmin.conf['uripfx']+'cma-domain-edit', '/s/xhtml/domain_form.html'
    end

    use Rack::Cache,
      :verbose     => true,
      :metastore   => 'file:/tmp/cache/rack/meta',
      :entitystore => 'file:/tmp/cache/rack/body'

    # Use Rack-XSLView
    use Rack::XSLView, :myxsl => Chimailmadmin.runtime['xslt'], :noxsl => Chimailmadmin.runtime['omitxsl'], :passenv => Chimailmadmin.runtime['passenv']

    # Sinatra Helper Gems
    helpers Sinatra::XSLView

    helpers do
      # Just the usual Sinatra redirect with App prefix
      def mredirect(uri)
        redirect Chimailmadmin.conf['uripfx']+uri
      end
      def markdown(template, options={})
        output = render :md, template, options
        '<div>'+output+'</div>'
      end
    end

    get '/' do
      puts Chimailmadmin.conf['uripfx']
      mredirect 'welcome'
    end

    get '/cma-mailbox-list' do
      idx_json = Chimailmadmin.memcdb.get('name_index') || '["bill.gates","steve.jobs"]'
      @index = JSON.parse(idx_json)
      xml = builder :'xml/mailboxes'
      xslview xml, 'mailbox_list.xsl'
    end
    get '/cma-mailbox-list/*' do
      idx_json = Chimailmadmin.memcdb.get('name_index') || '["bill.gates","steve.jobs"]'
      @index = JSON.parse(idx_json)
      @domain = params[:splat].first
      xml = builder :'xml/mailboxes'
      xslview xml, 'mailbox_list.xsl'
    end
    get '/cma-domain-list' do
      idx_json = Chimailmadmin.memcdb.get('dig_index') || '["docunext.com"]'
      @index = JSON.parse(idx_json)
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
      xml = '<root />'
      xslview xml, 'spam_access_list.xsl'
    end
    get '/cma-sa-prefs' do
      settings = ["example.com","example.org","example.net"]
      @index = { 'whitelist_to' => settings }
      xml = builder :"xml/sa_prefs"
      xslview xml, "sa_prefs.xsl"
    end
    # Expiriment
    get '/dnu-cma-sa-:pipeline' do
      @prefs = { 'whitelist_to' => ["example.com","example.org"]}
      xml = builder :"xml/sa_#{params[:pipeline]}"
      xslview xml, "sa_#{params[:pipeline]}.xsl"
    end
    get '/cma-info-:info' do
      cache_control :public, :must_revalidate, :max_age => 600
      markdown :"md/cma-#{params[:info]}"
    end
    get '/runtime/info' do
      cache_control :public, :must_revalidate, :max_age => 60
      @uptime   = (0 + Time.now.to_i - Chimailmadmin.runtime['started_at']).to_s
      runtime   = builder :'xml/runtime'
      xslview runtime, 'runtime.xsl'
    end

    not_found do
      headers 'Last-Modified' => Time.now.httpdate, 'Cache-Control' => 'no-store'
      %(<div class="block"><div class="hd"><h2>Error</h2></div><div class="bd">This is nowhere to be found. <a href="#{Chimailmadmin.conf['uripfx']}">Start over?</a></div></div>)
    end

    get '/stylesheet.css' do
      cache_control :public, :max_age => 600
      content_type 'text/css', :charset => 'utf-8'
      sass 'css/notapp'.to_sym
    end
  end

end

if __FILE__ == $0
  conf = Hash["a", 100, "b", 200]
  myapp = Chimailmadmin.new(conf)
  myapp.set :environment, 'development'
  myapp.run!
end
