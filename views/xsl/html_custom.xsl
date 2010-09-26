<!--
Program: http://www.chimailmadmin.com
Component: html_custom.xsl
Copyright: Savonix Corporation
Author: Albert L. Lash, IV
License: Gnu Affero Public License version 3
http://www.gnu.org/licenses

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program; if not, see http://www.gnu.org/licenses
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">

	<xsl:template name="page">
		<html>
			<xsl:call-template name="head"/>

			<body>
      <xsl:for-each select="//pre_body_content">
				<xsl:sort select="priority" order="ascending"/>
				<xsl:apply-templates select="nodes/*"/>
			</xsl:for-each>

		<div id="page">
		  <div id="hd">
      <xsl:if test="$RACK_ENV='demo'">
		  <xsl:call-template name="inline-ads" />
		  </xsl:if>
		  <h1><a href="{$link_prefix}welcome">Open Source Email Admin Software</a></h1>
		  </div>
		  <div id="navigation">
      <xsl:call-template name="main_menu" />
      </div>
			<div id="content">
				<xsl:apply-templates />
			</div>
		</div>
    <xsl:call-template name="footer" />
    <xsl:if test="$RACK_ENV='demo'">
      <xsl:call-template name="g_analytics_code" />
    </xsl:if>
    <xsl:if test="$RACK_ENV='development'">
    <xsl:comment>
      <xsl:value-of select="$analytics_key" />
    </xsl:comment>
    </xsl:if>

			</body>
		</html>
	</xsl:template>
	<xsl:template name="head">
		<head>
    <script type="text/javascript">
var app_prefix = '<xsl:value-of select="$path_prefix"/>';
var svx_cdns = 'http://www-01.evenserver.com/s/';
    </script>
			<title>CMA <xsl:value-of select="document('../../apps/chimailmadmin/i18n/en_US/chimailmadmin.xml')/i18n/*[contains($PATH_INFO,local-name())]"/></title>
      <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/combo?2.7.0/build/reset/reset-min.css"></link>
			<link rel="stylesheet" type="text/css" href="{$path_prefix}s/css/droppy.css"></link>
			<link rel="stylesheet" type="text/css" href="{$path_prefix}s/css/stylesheet.css"></link>

      <xsl:if test="$RACK_ENV='demo'">
      <script type="text/javascript" src="http://www-01.evenserver.com/s/js/jquery/jquery-1.4.2.min.js"></script>
      <script type="text/javascript" src="http://www-01.evenserver.com/s/js/jquery/plugins/jquery.url-1.0.js"></script>
      </xsl:if>
      
      <xsl:if test="not($RACK_ENV='demo')">
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/jquery.js" />
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.url.js" />
			</xsl:if>

			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.cookiejar.js" />
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.metadata.js"></script>
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.tablesorter.min.js"></script>
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.tablesorter.pager.js"></script>
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.cookie.js"></script>
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.tablesorter.cookie.js"></script>
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.droppy.js"></script>
			<script type="text/javascript" src="{$path_prefix}s/js/chimailmadmin.js"></script>
      <xsl:for-each select="//head_nodes">
				<xsl:sort select="priority" order="ascending"/>
				<xsl:apply-templates select="nodes/*"/>
			</xsl:for-each>
		</head>
	</xsl:template>
	
<xsl:template name="main_menu">
<div>
<ul id="nav">
  <xsl:for-each select="document('../../data/xml/main_menu.xml')/menu/item">
    <xsl:call-template name="button">
      <xsl:with-param name="key">
        <xsl:value-of select="key"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
</ul>
</div>
</xsl:template>




  <xsl:template name="button">
    <xsl:param name="key"/>


<li>
  <div><xsl:value-of select="document('../../apps/chimailmadmin/i18n/en_US/chimailmadmin.xml')/i18n/*[local-name()=$key]"/></div>
  <ul>
    <xsl:for-each select="document('../../data/xml/main_menu.xml')/menu/item[key=$key]/item">
      <xsl:variable name="my_key" select="key"/>
      <li>
        <a href="{$link_prefix}{url}" id="{key}">
          <xsl:value-of select="document('../../apps/chimailmadmin/i18n/en_US/chimailmadmin.xml')/i18n/*[local-name()=$my_key]"/>
        </a>
      </li>
    </xsl:for-each>
  </ul>
</li>


  </xsl:template>
  <xsl:template name="pager">
			<div id="{$my-table}-pager" class="pager">
      <input id="mypagesize" class="pagesize" type="hidden" name="pagesize" value="20"/>
      <table>
        <tr>
          <td>
            <img src="{$path_prefix}s/css/blue/first.png" class="first"/>
            <img src="{$path_prefix}s/css/blue/prev.png" class="prev"/>
          </td>
          <td>
            <input type="text" class="pagedisplay" size="4" readonly="readonly"/>
          </td>
          <td>
            <img src="{$path_prefix}s/css/blue/next.png" class="next"/>
            <img src="{$path_prefix}s/css/blue/last.png" class="last"/>
          </td>
        </tr>
      </table>
			</div>
  </xsl:template>




<xsl:template name="inline-ads">
<div style="float:right;">
<script type="text/javascript"><xsl:comment>
google_ad_client = "pub-9657495873329253";
google_ad_width = 728;
google_ad_height = 90;
google_ad_format = "728x90_as";
google_ad_type = "text_image";
google_ad_channel = "";
google_color_border = "FFFFFF";
google_color_bg = "FFFFFF";
google_color_link = "2D8930";
google_color_text = "000000";
google_color_url = "1B703A";
//</xsl:comment></script> 
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js"> 
</script>
</div>
</xsl:template>


<xsl:template name="footer">
<div id="ft">
  <p class="inner">Copyright 
  <a href="http://www.savonix.com/">Savonix Corporation</a><xsl:text> </xsl:text>
  <a href="http://www.docunext.com/wiki/Affero_GPL">AGPL Licensed</a><xsl:text> </xsl:text>
  <a href="http://www.chimailmadmin.com/blog/">ChiMailMadmin.com</a>
  </p>
</div>
</xsl:template>
</xsl:stylesheet>
