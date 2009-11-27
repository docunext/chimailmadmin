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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">
	<xsl:include href="html_main.xsl"/>
	<xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>


<script type="text/javascript"
src="{$link_prefix}x-tablesorter-setup-js&amp;selector=access_table" />

<div id="tableframe">
  <table id="access_table" class="tablesorter">
    <thead>
      <tr class="i18n_top">
        <th>
          <span id="i18n-key">Key</span>
        </th>
        <th>
          <span id="i18n-value">Value</span>
        </th>
        <th>
          <span id="i18n-type">Type</span>
        </th>
        <th>
          <span id="i18n-date">Date</span>
        </th>
        <th>
          <span id="i18n-notes">Notes</span>
        </th>
        <th>
          <span id="i18n-delete">Delete</span>
        </th>
      </tr>
    </thead>
    <tbody>
      <xsl:for-each select="//acl_get/acl_get">
        <tr id="acl_{acl_id}">
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
          <td>
            <a href="#{$link_prefix}cma-access-delete&amp;acl_id={acl_id}"
            onclick="acl_delete({acl_id}); return false;">
              <span id="i18n-delete">Delete</span>
            </a>
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
</div>
<div class="table_meta">

  <div style="float: right" class="button-basic-{//theme_color}">
    <a>
    <xsl:attribute name="href">
    <xsl:value-of select="$link_prefix"/>
    <xsl:text>cma-access-edit</xsl:text>&amp;acl_id=-10
      <xsl:if test="//_get/domain_id">
        <xsl:text>&amp;domain_id=</xsl:text>
        <xsl:value-of select="//_get/domain_id"/>
      </xsl:if>
    </xsl:attribute>
      <span id="i18n-add_entry">Add Entry</span>
    </a>

    <a href="{$link_prefix}x-sender-acl-export&amp;type=sender">
      <span id="i18n-postfix_sender_export">Postfix Sender Export</span>
    </a>

    <a href="{$link_prefix}x-sender-acl-export&amp;type=recipient">
      <span id="i18n-postfix_recipient_export">Postfix Recipient Export</span>
    </a>
  </div>
</div>


	</xsl:template>
</xsl:stylesheet>
