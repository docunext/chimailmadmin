<!--
Program: Chi Mail Madmin
Component: main_menu.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="html_shell.xsl"/>
	<xsl:template name="main_menu">
		<script type="text/javascript">
		$(document).ready(function()
		{
				$('#top-main-menu').clickMenu();
		});
		</script>
		<ul id="top-main-menu">
			<xsl:for-each select="//menu/item[not(@active=0)]">
				<xsl:call-template name="button">
					<xsl:with-param name="key">
						<xsl:value-of select="key"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
		</ul>
	</xsl:template>

	<xsl:template name="button">
		<xsl:param name="key"/>
		<li>
			<xsl:value-of select="//labels/label[key=$key]/value"/>
			<ul>
				<xsl:for-each select="//menu/item[key=$key]/item">
					<xsl:variable name="my_key">
						<xsl:value-of select="key"/>
					</xsl:variable>
					<li>
						<a href="{//runtime/link_prefix}{url}" id="{key}">
							<xsl:value-of select="//labels/label[key=$my_key]/value"/>
						</a>
					</li>
				</xsl:for-each>
			</ul>
		</li>
	</xsl:template>
</xsl:stylesheet>
