<!--
Program: ChiMailMadmin.com
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
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
	<xsl:import href="html_main.xsl"/>
	<xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>
		<div id="edit_form">
			<form name="alias" method="post">
				<xsl:if test="//_get/alias_id">
					<input type="hidden" name="alias_id" value="{//_get/alias_id}"/>
				</xsl:if>
				<xsl:if test="//_get/domain_id">
					<input type="hidden" name="domain_id" value="{//_get/domain_id}"/>
				</xsl:if>
				<xsl:variable name="alias_get_by_id"
					select="//alias_get_all/alias_get_all"/>
				<table>
					<tr>
						<td colspan="3">
							<h3>Create a new alias for your domain.</h3>
						</td>
					</tr>
					<tr>
						<td>Alias</td>
						<td>
							<input type="text" name="alias" value="{$alias_get_by_id/alias}"/>
						</td>
						<td>
              @
							<xsl:if test="//_get/domain_id">
								<xsl:value-of select="//domains_get_all/domains_get_all[domain_id=//_get/domain_id]/domain"/>
							</xsl:if>
							<xsl:if test="not(//_get/domain_id) or //_get/domain_id=''">
								<select name="domain_id">
									<xsl:for-each select="//domains_get_all/domains_get_all">
										<option value="{domain_id}">
											<xsl:if test="$alias_get_by_id/domain_id=domain_id">
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
						<td>To:</td>
						<td>
							<input type="text" name="destination" value="{$alias_get_by_id/destination}"/>
						</td>
						<td>Where the mail needs to be sent to.</td>
					</tr>
					<tr>
						<td colspan="3">
							<input class="button" type="submit" name="submit" value="Add Alias" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</xsl:template>
</xsl:stylesheet>
