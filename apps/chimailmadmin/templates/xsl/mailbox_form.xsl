<!--
Program: ChiMailMadmin.com
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
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
	<xsl:import href="html_main.xsl"/>
	<xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>
    <script type="text/javascript" src="{$path_prefix}s/js/common_functions.js"/>

		<div id="edit_form">
			<form name="mailbox" method="post">
				<xsl:if test="//_get/my_domain_id">
					<input type="hidden" name="domain_id" value="{//_get/domain_id}"/>
				</xsl:if>
				<xsl:if test="//_get/mailbox_id">
					<input type="hidden" name="mailbox_id" value="{//_get/mailbox_id}"/>
				</xsl:if>
				<xsl:variable name="mailbox_get_by_id"
					select="//mailbox_get_by_id/mailbox_get_by_id"/>
				<table>
					<tr>
						<td>Email Address</td>
						<td>
							<input type="text" name="email_address" id="email_address" value="{$mailbox_get_by_id/email_address}" onkeyup="copyValue('email_address','username')"/>
						</td>
						<td>
							<xsl:if test="//_get/my_domain_id">
								@<xsl:value-of select="//domains_get_all/domains_get_all[domain_id=//_get/domain_id]/domain"/>
							</xsl:if>
							<xsl:if test="not(//_get/my_domain_id)">
								@<select name="domain_id">
									<xsl:for-each select="//domains_get_all/domains_get_all">
										<option value="{domain_id}">
											<xsl:if test="$mailbox_get_by_id/domain_id=domain_id">
												<xsl:attribute name="selected">selected</xsl:attribute>
											</xsl:if>
											<xsl:value-of select="domain"/>
										</option>
									</xsl:for-each>
								</select>
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td>Username</td>
						<td>
							<input type="test" name="username" id="username"/>
						</td>
					</tr>
					<xsl:if test="not(//_get/mailbox_id)">
					<tr>
						<td>Password</td>
						<td>
							<input type="password" name="password"/>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="password" name="password2"/>
						</td>
					</tr>
					<tr>
						<td>Welcome mail</td>
						<td>
							<input type="checkbox" name="mail"/>
						</td>
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
					</xsl:if>
					<tr>
						<td>Name</td>
						<td>
							<input type="text" name="name" value="{$mailbox_get_by_id/name}"/>
						</td>
					</tr>
					<tr>
						<td>Active</td>
						<td>
							<input type="checkbox" name="active" id="{active}">
								<xsl:if test="$mailbox_get_by_id/active='on'">
									<xsl:attribute name="checked">checked</xsl:attribute>
								</xsl:if>
							</input>
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
