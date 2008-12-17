<!--
Program: Chi Mail Madmin
Component: alias_form.xsl
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
	<xsl:import href="html_main.xsl"/>
	<xsl:template name="content">
		<div id="edit_form">
			<form name="alias" method="post">
				<xsl:if test="//_get/alias_id">
					<input type="hidden" name="alias_id" value="{//_get/alias_id}"/>
				</xsl:if>
				<input type="hidden" name="domain_id" value="{//_get/domain_id}"/>
				<table>
					<tr>
						<td colspan="3">
							<h3>Create a new alias for your domain.</h3>
						</td>
					</tr>
					<tr>
						<td>Alias</td>
						<td>
							<input type="text" name="alias" value=""/>
						</td>
						<td>@<xsl:value-of select="//domains_get_all/domains_get_all/domain"/></td>
					</tr>
					<tr>
						<td>To:</td>
						<td>
							<input type="text" name="destination" value="{//alias_get_all/alias_get_all/destination}"/>
						</td>
						<td>Where the mail needs to be sent to.</td>
					</tr>
					<tr>
						<td colspan="3">
							<input class="button" type="submit" name="submit" value="Add Alias" />
						</td>
					</tr>
					<tr>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td colspan="3">To create a catch-all use an "*" as alias.<br />
						For domain to domain forwarding use "*@domain.tld" as to.
						</td>
					</tr>
				</table>
			</form>
		</div>
	</xsl:template>
</xsl:stylesheet>
