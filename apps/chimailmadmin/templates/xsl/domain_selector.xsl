<!--
Program: ChiMailMadmin.com
Component: domain_selector.xsl
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
	<xsl:template name="domain_selector">
		<div style="float: right">
			<form name="overview" method="get">
				<input type="hidden" name="nid" value="{//_get/nid}"/>
				<select name="my_domain_id" onchange="this.form.submit();">
          <option value="%">All</option>
					<xsl:for-each select="/_R_/domains_get_all/domains_get_all">
						<option value="{domain_id}">
              <xsl:if test="//_get/my_domain_id=domain_id">
                <xsl:attribute name="selected">selected</xsl:attribute>
              </xsl:if>
							<xsl:value-of select="domain"/>
						</option>
					</xsl:for-each>
				</select>
				<input class="button" type="submit" name="go" value="Go"/>
			</form>
		</div>
	</xsl:template>
</xsl:stylesheet>
