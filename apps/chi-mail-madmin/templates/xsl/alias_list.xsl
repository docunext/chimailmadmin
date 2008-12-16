<!--
Program: Chi Mail Madmin
Component: alias_list.xsl
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
	<xsl:include href="main.xsl"/>
	<xsl:include href="pager.xsl"/>
	<xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>
		<xsl:call-template name="jquery-setup">
			<xsl:with-param name="my-table">alias_table</xsl:with-param>
			<xsl:with-param name="my-table-div">myAliasDiv</xsl:with-param>
			<xsl:with-param name="no-sort-column">,
			headers: {
					5: {sorter: false},
					6: {sorter: false},
					7: {sorter: false}
			}
			</xsl:with-param>
		</xsl:call-template>
		<div style="float: right">
			<form name="overview" method="post">
				<select name="fDomain" onChange="this.form.submit();">
					<xsl:for-each select="//domains_get_all/domains_get_all">
						<option value="{domain}">
							<xsl:value-of select="domain"/>
						</option>
					</xsl:for-each>
				</select>
				<input class="button" type="submit" name="go" value="Go" />
			</form>
		</div>
		<h4>Alias List for <xsl:value-of
			select="//domains_get_all/domains_get_all[domain_id=//_get/domain_id]/domain"/>
		</h4>
		<div if="myAliasDiv">
			<table id="alias_table" class="tablesorter">
				<thead>
					<tr>
						<th>Alias</th>
						<th>Destination</th>
						<th>Last Modified</th>
						<th>Active</th>
						<th colspan="3"></th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="//alias_get_all/alias_get_all">
						<tr>
							<td>
								<xsl:value-of select="alias_address"/>
							</td>
							<td></td>
							<td></td>
							<td>
								<a href="{$link_prefix}"></a>
							</td>
							<td>
								<a href="{$link_prefix}">edit</a>
							</td>
							<td>
								<a href="{$link_prefix}" onclick="">del</a>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
		<xsl:call-template name="pager">
			<xsl:with-param name="my-table">alias_table</xsl:with-param>
		</xsl:call-template>
		<div style="float: right">
			<a class="button-basic-blue" href="{$link_prefix}xpa-mailbox-edit&amp;domain_id={//_get/domain_id}">Add Mailbox</a>
		</div>
		<div style="float: right">
			<a class="button-basic-blue" href="{$link_prefix}xpa-alias-edit&amp;domain_id={//_get/domain_id}">Add Alias</a>
		</div>
	</xsl:template>
</xsl:stylesheet>
