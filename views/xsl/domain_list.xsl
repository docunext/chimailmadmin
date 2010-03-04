<!--
Program: http://www.chimailmadmin.com
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="/">

<div>


<script type="text/javascript"
src="x-tablesorter-setup-js&amp;selector=domain_table" />


<!-- 
return confirm ('Do you really want to delete all records for this domain? This can not be undone!\nDomain: test.com')
-->
<div class="tableframe">
  <table id="domain_table" class="tablesorter">
    <thead>
      <tr>
        <th>
          <span id="i18n-domain">Domain</span>
        </th>
        <th>
          <span id="i18n-description">Description</span>
        </th>
        <th>
          <span id="i18n-aliases">Aliases</span>
        </th>
        <th>
          <span id="i18n-mailboxes">Mailboxes</span>
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
      <xsl:for-each select="//domains/domain">
        <tr id="d_{@id}">
          <td>
            <a href="cma-mailbox-list/{@name}">
              <xsl:value-of select="@name"/>
            </a>
            <a href="http://www.labs.docunext.com/demo/doculabsappone/tools/digmx/{@name}.html">
            <xsl:text>Dig MX</xsl:text>
            </a>
          </td>
          <td>
            <xsl:value-of select="description"/>
          </td>
          <td></td>
          <td></td>
          <td>
            <xsl:value-of select="modified"/>
          </td>
          <td>
            <a href="">
              <xsl:value-of select="active"/>
            </a>
          </td>
          <td>
            <a href="cma-domain-edit&amp;my_domain_id={domain_id}">
              <span>edit</span>
            </a>
          </td>
          <td>
            <a href="#x-domain-delete&amp;my_domain_id={domain_id}"
            onclick="domain_delete({domain_id}); return false;">
              <span>del</span>
            </a>
          </td>
        </tr>
      </xsl:for-each>
    </tbody>
  </table>
</div>


<div style="float: right" class="button-basic-blue">
  <a href="cma-domain-edit">
    <span id="i18n-new_domain">New Domain</span>
  </a>
  <a href="x-domain-export">
    <span id="i18n-domain_export">Domain Export</span>
  </a>
  <a href="x-relay-export">
    <span id="i18n-relay_export">Relay Export</span>
  </a>
</div>
</div>
</xsl:template>
</xsl:stylesheet>
