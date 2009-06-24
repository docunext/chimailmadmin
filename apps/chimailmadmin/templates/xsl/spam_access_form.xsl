<!--
Program: ChiMailMadmin.com
Component: spam_access_form.xsl
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
	<xsl:import href="html_main.xsl"/>
	<xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>

		<div id="edit_form">
			<form name="access" method="post">
				<xsl:if test="//_get/domain_id">
					<input type="hidden" name="domain_id" value="{//_get/domain_id}"/>
				</xsl:if>
				<xsl:if test="//_get/acl_id and not(//_get/cloner) and not(//_get/acl_id='-10')">
					<input type="hidden" name="acl_id" value="{//_get/acl_id}"/>
				</xsl:if>
				<xsl:variable name="acl_get"
					select="//acl_get/acl_get"/>
				<table>
					<tr>
						<td>Source</td>
						<td>
							<input type="text" name="source" value="{$acl_get/source}"/>
						</td>
					</tr>
					<tr>
						<td>Access</td>
						<td>
							<input type="text" name="access" value="{$acl_get/access}"/>
						</td>
					</tr>
					<tr>
						<td>Type</td>
						<td>
              <select name="type">
                <option value="sender">sender</option>
                <option value="client">client</option>
                <option value="recipient">recipient</option>
              </select>
						</td>
					</tr>
					<tr>
						<td>Restriction Class</td>
						<td>
							<input type="text" name="restriction_class" value="{$acl_get/restriction_class}"/>
						</td>
					</tr>
					<tr>
						<td>Notes</td>
						<td>
							<input type="text" name="name" value="{$acl_get/notes}"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input class="button" type="submit" name="submit" value="{$i18n/submit}"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</xsl:template>
</xsl:stylesheet>
