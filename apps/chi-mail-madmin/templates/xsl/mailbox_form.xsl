<!--
Program: Chi Mail Madmin
Component: mailbox_form.xsl
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
	<xsl:import href="main.xsl"/>
	<xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>

		<div id="edit_form">
			<form name="mailbox" method="post">
				<input type="hidden" name="domain_id" value="{//_get/domain_id}"/>
				<table>
					<tr>
						<td colspan="3">
							<h3></h3>
						</td>
					</tr>
					<tr>
						<td>Email Address</td>
						<td>
							<input type="text" name="email_address" value=""/>
						</td>
						<td>
							@<xsl:value-of select="//domains_get_all/domains_get_all/domain"/>
							<select name="fDomain"></select>
						</td>
					</tr>
					<tr>
						<td>Password</td>
						<td>
							<input type="password" name="password"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="password" name="password2"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>Name</td>
						<td>
							<input type="text" name="fName" value=""/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>Active</td>
						<td>
							<input type="checkbox" name="active"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>Welcome mail</td>
						<td>
							<input type="checkbox" name="mail"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<label for="maildir">Create {maildir}</label>
						</td>
						<td>
							<input id="maildir" name="create_mail_directory" value="1" type="radio"/>Yes
							<input id="maildir" name="create_mail_directory" value="0" type="radio"/>No
						</td>
					</tr>
					<tr>
						<td>
							<label for="default_filters">Create default filters</label>
						</td>
						<td>
							<input id="default_filters" name="create_default_filters" value="1" checked="checked" type="checkbox"/>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input class="button" type="submit" name="submit" value="{$i18n/submit}"/>
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
