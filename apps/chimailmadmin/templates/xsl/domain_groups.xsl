<!--
Program: ChiMailMadmin.com
Component: domain_list.xsl
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
	<xsl:include href="html_main.xsl"/>
	<xsl:include href="pager.xsl"/>
	<xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>
		<xsl:call-template name="jquery-setup">
			<xsl:with-param name="my-table">domain_table</xsl:with-param>
			<xsl:with-param name="no-sort-column">,
			headers: {
					5: {sorter: false},
					6: {sorter: false},
					7: {sorter: false}
			}
			</xsl:with-param>
		</xsl:call-template>
		<script type="text/javascript">
		function domain_group_delete(domain_group_id) {
				if(confirm('Are you sure?')){
				$.post("<xsl:value-of select="$link_prefix"/>x-domain-group-delete&amp;domain_group_id="+domain_group_id,
				{
						'domain_group_id': domain_group_id
				},
				function (data){
          $("#dg_"+domain_group_id).remove();
				});
				}
		}
		</script>
		<!-- 
		return confirm ('Do you really want to delete all records for this domain? This can not be undone!\nDomain: test.com')
		-->
		<div class="tableframe">
			<table id="domain_table" class="tablesorter">
				<thead>
					<tr>
						<th>Group Name</th>
						<th>Domains</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="/_R_/domains_get_all/domains_get_all">
						<tr id="dg_{domain_group_id}">
							<td></td>
							<td></td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
		<xsl:call-template name="pager">
			<xsl:with-param name="my-table">domain_table</xsl:with-param>
		</xsl:call-template>

	</xsl:template>
</xsl:stylesheet>
