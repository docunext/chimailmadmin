<!--
Program: ChiMailMadmin.com
Component: html_shell.xsl
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
	<xsl:output method="xml"
		indent="yes" encoding="UTF-8" omit-xml-declaration="no"
		doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
		doctype-public="-//W3C//DTD XHTML 1.1//EN" />
  <xsl:strip-space  elements="*"/>
	<xsl:template match="/">
		<html>
      <xsl:variable name="link_prefix" select="/_R_/runtime/link_prefix"/>
      <xsl:variable name="path_prefix" select="/_R_/runtime/path_prefix"/>
      <xsl:variable name="my18n"
        select="document('../../i18n/en_US/chimailmadmin.xml')/i18n"/>

			<xsl:call-template name="head">
				<xsl:with-param name="link_prefix" select="$link_prefix"/>
				<xsl:with-param name="path_prefix" select="$path_prefix"/>
				<xsl:with-param name="i18n" select="$my18n"/>
			</xsl:call-template>

			<body>
      <xsl:for-each select="//pre_body_content">
				<xsl:sort select="priority" order="ascending"/>
				<xsl:apply-templates select="nodes/*"/>
			</xsl:for-each>

				<xsl:call-template name="main">
          <xsl:with-param name="link_prefix" select="$link_prefix"/>
          <xsl:with-param name="path_prefix" select="$path_prefix"/>
          <xsl:with-param name="i18n" select="$my18n"/>
        </xsl:call-template>

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
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>
		<head>
			<title>ChiMailMadmin.com</title>
      <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/combo?2.7.0/build/reset/reset-min.css"></link>
			<link rel="stylesheet" type="text/css" href="{$link_prefix}x-dynamic-css"></link>
			<link rel="stylesheet" type="text/css" href="{$path_prefix}s/css/droppy.css"></link>

			<script type="text/javascript" src="{$path_prefix}s/js/jquery/jquery.js" ></script>

			<script type="text/javascript" src="{$path_prefix}s/js/jquery/plugins/jquery.cookiejar.js" />
			<!-- <script type="text/javascript" src="{$link_prefix}x-dynamic-js"></script> -->
			<script type="text/javascript" src="{$link_prefix}x-common-js"></script>
			<script type="text/javascript" src="{$link_prefix}x-xhtml2dom-js"></script>
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
      <xsl:for-each select="//head_nodes">
				<xsl:sort select="priority" order="ascending"/>
				<xsl:apply-templates select="nodes/*"/>
			</xsl:for-each>
		</head>
	</xsl:template>
<xsl:template match="node()">
<xsl:element name="{name()}">
<xsl:apply-templates select="@*|node()"/>
</xsl:element>
</xsl:template>

<xsl:template match="@*|text()|comment()|processing-instruction()">
<xsl:copy/>
</xsl:template>
</xsl:stylesheet>
