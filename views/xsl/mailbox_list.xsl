<!--
Program: http://www.chimailmadmin.com
Component: mailbox_list.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">


<xsl:template match="/">

<div>
<script type="text/javascript"
src="x-tablesorter-setup-js&amp;selector=mailbox_table" />

<h4>
  <span id="i18n-mailboxes_for">Mailboxes for </span>
  <xsl:value-of select="//@domain"/>
</h4>
<div id="tableframe">
  <table id="mailbox_table" class="tablesorter">
    <thead>
      <tr class="i18n_top">
        <th>
          <span id="i18n-email">Email</span>
        </th>
        <th>
          <span id="i18n-name">Name</span>
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
      <xsl:for-each select="//mailboxes/mailbox">
        <tr id="mb_{@id}">
          <td>
            <a href="../cma-mailbox-edit/{@address}@{//@domain}">
              <xsl:value-of select="@address"/>@<xsl:value-of select="//@domain"/>
            </a>
          </td>
          <td>
            <xsl:value-of select="@address"/>
          </td>
          <td>
            <xsl:value-of select="created"/>
          </td>
          <td/>
          <td>
            <a href="../cma-mailbox-edit/{@address}@{//@domain}">
              <span id="i18n_edit" class="i18n">edit</span>
            </a>
          </td>
          <td>
            <a href=""
            onclick="mailbox_delete({@id}); return false;">
              <span id="i18n_del" class="i18n">del</span>
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
    <a href="cma-mailbox-edit">
      <span id="i18n-add_mailbox" class="i18n">Add Mailbox</span>
    </a>

    <a href="cma-alias-edit">
      <span id="i18n-add_alias" class="i18n">Add Alias</span>
    </a>

    <a href="x-relay-recipients">
      <span id="i18n-recipient_export" class="i18n">Recipient Export</span>
    </a>
  </div>
</div>
</div>
</xsl:template>
</xsl:stylesheet>
