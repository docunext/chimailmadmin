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
<xsl:import href="main.xsl"/>
<xsl:template name="content">
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
    <xsl:for-each select="//domains_get_all">
    <tr class="hilightoff" onMouseOver="className='hilighton';" onMouseOut="className='hilightoff';">
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

</table>
<p><a href="{//link_prefix}xpa-domain-edit">New Domain</a>
</p>

</xsl:template>
</xsl:stylesheet>
