<!--
Program: ChiMailMadmin.com
Component: domain_form.xsl
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
		<div id="edit_form">
			<form name="create_domain" method="post">
				<xsl:if test="//_get/my_domain_id">
					<input type="hidden" name="domain_id" value="{//_get/my_domain_id}"/>
				</xsl:if>
				<xsl:variable name="domain_get_by_id"
					select="/_R_/domain_get_by_id/domain_get_by_id"/>
				<table>
					<tr>
						<td colspan="3">
							<h3>Add/Edit Domain</h3>
						</td>
					</tr>
					<tr>
						<td>Domain:</td>
						<td>
							<input type="text" name="domain" value="{$domain_get_by_id/domain}"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>Description:</td>
						<td>
							<input type="text" name="description" value="{$domain_get_by_id/description}"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>Recipient Restriction Class:</td>
						<td>
							<input type="text" name="description" value="{$domain_get_by_id/restriction_class}"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>Aliases:</td>
						<td>
							<input type="text" name="aliases" value="{$domain_get_by_id/aliases}"/>
						</td>
						<td>-1 = disable | 0 = unlimited</td>
					</tr>
					<tr>
						<td>Mailboxes:</td>
						<td>
							<input type="text" name="mailboxes" value="{$domain_get_by_id/mailboxes}"/>
						</td>
						<td>-1 = disable | 0 = unlimited</td>
					</tr>
					<tr>
						<td>Transport:</td>
						<td>
							<input type="text" name="transport" value="{$domain_get_by_id/transport}"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>Add default mail aliases:</td>
						<td>
							<input type="checkbox" name="defaultaliases"/>
						</td>

						<td></td>
					</tr>
					<tr>
						<td>Mail server is backup MX:</td>
						<td>
							<input type="checkbox" name="backupmx"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3">
							<input class="button" type="submit" name="submit" value="Add Domain"/>
						</td>
					</tr>
					<tr>
						<td colspan="3"></td>
					</tr>
				</table>
			</form>
		</div>
	</xsl:template>
</xsl:stylesheet>
