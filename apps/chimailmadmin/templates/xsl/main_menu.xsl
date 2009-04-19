<!--
Program: ChiMailMadmin.com
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
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
	<xsl:include href="html_shell.xsl"/>
	<xsl:template name="main_menu">
		<script type="text/javascript">
    $(document).ready(function()
    {
        $('#nav').droppy();
    });
		</script>
		<ul id="nav">
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
      <div><xsl:value-of select="/_R_/i18n/*[local-name()=$key]"/></div>
      <ul>
        <xsl:for-each select="/_R_/menu/item[key=$key]/item">
          <xsl:variable name="my_key" select="key"/>
          <li>
            <a href="{/_R_/runtime/link_prefix}{url}" id="{key}">
              <xsl:value-of select="/_R_/i18n/*[local-name()=$my_key]"/>
            </a>
          </li>
        </xsl:for-each>
      </ul>
    </li>
  </xsl:template>
</xsl:stylesheet>
