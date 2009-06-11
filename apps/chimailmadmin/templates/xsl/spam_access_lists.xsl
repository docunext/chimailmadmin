<!--
Program: ChiMailMadmin.com
Component: spam_access_lists.xsl
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
	<xsl:include href="domain_selector.xsl"/>
	<xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>
		<xsl:call-template name="jquery-setup">
			<xsl:with-param name="my-table">access_table</xsl:with-param>
			<xsl:with-param name="no-sort-column">,
        headers: {
            5: {sorter: false},
            6: {sorter: false},
            7: {sorter: false}
        }
			</xsl:with-param>
		</xsl:call-template>
		<script type="text/javascript">
		function access_delete(acl_id,row) {
				if(confirm('Are you sure?')){
				$.post("<xsl:value-of select="$link_prefix"/>x-access-delete&amp;acl_id="+acl_id,
				{
						'acl_id': acl_id
				},
				function (data){
				});
				}
		}
		</script>
		<div id="tableframe">
			<table id="access_table" class="tablesorter">
				<thead>
					<tr>
						<th>Key</th>
						<th>Value</th>
						<th>Type</th>
						<th>Date</th>
						<th>Notes</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="//acl_get/acl_get">
						<tr>
							<td>
								<a href="{$link_prefix}cma-access-edit&amp;acl_id={acl_id}">
									<xsl:value-of select="source"/>
								</a>
							</td>
							<td>
								<xsl:value-of select="access"/>
							</td>
							<td>
								<xsl:value-of select="type"/>
							</td>
							<td>
								<xsl:value-of select="created"/>
							</td>
							<td>
								<xsl:value-of select="notes"/>
							</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
    <div class="table_controls">
      <xsl:call-template name="pager">
        <xsl:with-param name="my-table">access_table</xsl:with-param>
      </xsl:call-template>
      <br/>
      <div style="float: right">
        <a class="button-basic-{//theme_color}">
        <xsl:attribute name="href">
        <xsl:value-of select="$link_prefix"/>
        <xsl:text>cma-access-edit</xsl:text>
          <xsl:if test="//_get/domain_id">
            <xsl:text>&amp;domain_id=</xsl:text>
            <xsl:value-of select="//_get/domain_id"/>
          </xsl:if>
        </xsl:attribute>
        Add Entry</a>
      </div>
      <xsl:call-template name="domain_selector"/>
    </div>
	</xsl:template>
</xsl:stylesheet>
