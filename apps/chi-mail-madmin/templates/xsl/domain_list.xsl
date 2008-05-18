<!--
Program: Chi Mail Madmin
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
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:include href="main.xsl"/>
<xsl:include href="pager.xsl"/>
<xsl:template name="content">
<xsl:call-template name="jquery-setup">
    <xsl:with-param name="my-table">admin_table</xsl:with-param>    
    <xsl:with-param name="my-table-div">myDomainsDiv</xsl:with-param>
    <xsl:with-param name="no-sort-column">,
        headers: { 
            5: {sorter: false},
            6: {sorter: false},
            7: {sorter: false}
        }
    </xsl:with-param>
</xsl:call-template>
<div id="myDomainsDiv">
<table id="admin_table" class="tablesorter">
    <thead>
    <tr>
        <th>Domain</th>
        <th>Description</th>
        <th>Aliases</th>
        <th>Mailboxes</th>
        <th>Backup MX</th>
        <th>Last Modified</th>
        <th>Active</th>
        <th colspan="2"></th>
    </tr>
    </thead>
    <tbody>
    <xsl:for-each select="//domains_get_all">
    <tr>
        <td>
            <a href="{//link_prefix}xpa-mailbox-list&amp;domain_id={domain_id}">
                <xsl:value-of select="domain"/>
            </a>
        </td>
        <td><xsl:value-of select="description"/></td>
        <td></td>
        <td></td>
        <td>
            <xsl:value-of select="backupmx"/>
        </td>
        <td>
            <xsl:value-of select="modified"/>
        </td>
        <td>
            <a href="{//link_prefix}">
                <xsl:value-of select="active"/>
            </a>
        </td>
        <td>
            <a href="{//link_prefix}xpa-domain-edit&amp;domain_id={domain_id}">edit</a>
        </td>
        <td>
            <a href="{//link_prefix}" 
            onclick="return confirm ('Do you really want to delete all records for this domain? This can not be undone!\nDomain: test.com')">del</a>
        </td>
    </tr>
    </xsl:for-each>
    </tbody>
</table>
</div>
<xsl:call-template name="pager">
    <xsl:with-param name="my-table">admin_table</xsl:with-param>
</xsl:call-template>

<div style="float: right">
<a class="button-basic-{//theme_color}" href="{//link_prefix}xpa-domain-edit">New Domain</a>
</div>
</xsl:template>
</xsl:stylesheet>
