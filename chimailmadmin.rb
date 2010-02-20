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
require 'sinatra/xslview'
require 'rexml/document'

# The container for the Chimailmadmin application
module Chimailmadmin


  class << self
    attr_accessor(:conf, :runtime)
  end

  # Create the app which will run
  def self.new(conf)
    self.conf = conf
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

    configure :test do
      #
    end

    # Rewrite app url patterns to static files
    use Rack::Rewrite do
      rewrite Chimailmadmin.conf['uripfx']+'welcome', '/s/xhtml/welcome.html'
      rewrite Chimailmadmin.conf['uripfx']+'cma-alias-edit', '/s/xhtml/alias_form.html'
      rewrite Chimailmadmin.conf['uripfx']+'cma-mailbox-edit', '/s/xhtml/mailbox_form.html'
      rewrite Chimailmadmin.conf['uripfx']+'cma-domain-edit', '/s/xhtml/domain_form.html'
      r301 Chimailmadmin.conf['uripfx']+'cma-email-resources', Chimailmadmin.conf['uripfx']+'welcome'
    end
    
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
      xslview '<root />', 'mailbox_list.xsl'
    end
    get '/cma-domain-list' do
      xslview '<root />', 'domain_list.xsl'
    end
    get '/cma-about' do
      markdown :'md/cma-about'
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
