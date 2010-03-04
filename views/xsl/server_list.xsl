<!--
Program: http://www.chimailmadmin.com
Component: server_list.xsl
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


<xsl:template match="/">

<div>


<script type="text/javascript"
src="x-tablesorter-setup-js&amp;selector=server_table" />


<div id="tableframe">
  <table id="server_table" class="tablesorter">
    <thead>
      <tr class="i18n_top">
        <th>ID</th>
        <th>
          <span id="i18n-server">Server</span>
        </th>
        <th>
          <span id="i18n-host_name">Host Name</span>
        </th>
        <th>
          <span id="i18n-type">Type</span>
        </th>
        <th>
          <span id="i18n-last_modified">Last Modified</span>
        </th>
        <th>
          <span id="i18n-active">Active</span>
        </th>
        <th colspan="2" class="{{sorter: false}}" />
      </tr>
    </thead>
    <tbody>
      <xsl:for-each select="//servers_get_all/servers_get_all">
        <tr id="srv_{server_id}">
          <td>
            <a href="cma-server-edit&amp;server_id={server_id}">
              <xsl:value-of select="server_id"/>
            </a>
          </td>
          <td>
            <xsl:value-of select="server"/>
          </td>
          <td>
            <xsl:value-of select="host_name"/>
          </td>
          <td>
            <xsl:value-of select="server_type_id"/>
          </td>
          <td>
            <xsl:value-of select="created"/>
          </td>
          <td />
          <td>
            <a href="cma-server-edit&amp;server_id={server_id}">
              <span class="i18n-edit">edit</span>
            </a>
          </td>
          <td>
            <a href="#" onclick="server_delete({server_id}); return false;">
              <span class="i18n-del">del</span>
            </a>
          </td>
        </tr>
      </xsl:for-each>
    </tbody>
  </table>
</div>


<div class="table_controls">
</div>


<div class="table_meta">
  <div style="float: right" class="button-basic-blue">
    <a href="cma-server-edit">
      <span id="i18n-add_server">Add Server</span>
    </a>
  </div>
</div>
</div>
</xsl:template>
</xsl:stylesheet>
