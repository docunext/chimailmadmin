<!--
Program: http://www.docunext.com
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
		  <h1>Open Source Email Admin Software</h1>
		  </div>
		  <div id="navigation">
      <xsl:call-template name="main_menu" />
      </div>
			<div id="content">
				<xsl:apply-templates />
			</div>
      <div id="nofooter"/>
		</div>

				<xsl:for-each select="//footer">
					<xsl:sort select="priority"/>
					<xsl:value-of select="string" disable-output-escaping="yes"/>
				</xsl:for-each>
      <xsl:for-each select="//post_body_content">
				<xsl:sort select="priority" order="ascending"/>
				<xsl:apply-templates select="nodes/*"/>
			</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="head">
		<head>
			<title>ChiMailMadmin.com</title>
      <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/combo?2.7.0/build/reset/reset-min.css"></link>
			<link rel="stylesheet" type="text/css" href="{$path_prefix}s/css/chimailmadmin.css"></link>
			<link rel="stylesheet" type="text/css" href="{$path_prefix}s/css/droppy.css"></link>
			<link rel="stylesheet" type="text/css" href="{$path_prefix}stylesheet.css"></link>

			<script type="text/javascript" src="{$path_prefix}s/js/jquery/jquery.js" />

			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.cookiejar.js" />
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.rotate.js"></script>
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.metadata.js"></script>
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.tablesorter.min.js"></script>
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.tablesorter.pager.js"></script>
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.dimensions.js"></script>
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.date_input.js"></script>
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.cookie.js"></script>
			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.json.js"></script>
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


<xsl:template name="nav-menu">
<div id="navigation">
<ul id="primary-navigation">
  <li id="nav-home"><a href="/">Home</a></li>
</ul>
<ul id="user-navigation">
  <li><a href="/runtime/info" class="regdel-link">Settings</a></li>
  <li><a href="/runtime/info" class="regdel-link not-production">Development</a></li>
</ul>
<div class="clear"></div>
</div>
</xsl:template>

<xsl:template name="sidebar">
<div class="block">
  <div class="hd">
  <h2>
    <span class="i18n-quick_links">Quick Links</span>
  </h2>
  </div>
  <div class="bd">
    <h3>
      <span class="i18n-actions">Actions</span>
    </h3>
    <ul class="biglist">
      <li>
        <a href="/" id="sb-new-entry" class="regdel-link">
          <span class="i18n-new_entry">Home</span>
        </a>
      </li>
    </ul>
  </div>
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

<xsl:template name="ads">
<div class="block" style="float:right;">
  <div class="hd">
  <h2>
    <span class="i18n-quick_links">Sponsors</span>
  </h2>
  </div>
  <div class="bd" style="padding:1em 0;">
<script type="text/javascript"><xsl:comment>
google_ad_client = "pub-9657495873329253";
/* 300x250-wiki */
google_ad_slot = "6561520760";
google_ad_width = 300;
google_ad_height = 250;
//</xsl:comment></script> 
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js"> 
</script> 
  </div>
</div>
</xsl:template>

<xsl:template name="footer">
<div id="ft">
  <p class="inner">Copyright 
  <a href="http://www.savonix.com/">Savonix Corporation</a>. 
  AGPL Licensed
  </p>
</div>
</xsl:template>
</xsl:stylesheet>
