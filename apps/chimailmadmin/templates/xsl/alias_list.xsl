<!--
Program: ChiMailMadmin.com
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
<xsl:stylesheet version="1.0"	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">
	<xsl:include href="html_main.xsl"/>
	<xsl:include href="pager.xsl"/>
	<xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>


<script type="text/javascript"
src="{$link_prefix}x-tablesorter-setup-js&amp;selector=alias_table" />


<h4>Alias List for <xsl:value-of
  select="//domains_get_all/domains_get_all[domain_id=//_get/domain_id]/domain"/>
</h4>
<div id="tableframe">
  <table id="alias_table" class="tablesorter">
    <thead>
      <tr>
        <th>
          <span id="i18n-alias">Alias</span>
        </th>
        <th>
          <span id="i18n-destination">Destination</span>
        </th>
        <th>
          <span id="i18n-last_modified">Last Modified</span>
        </th>
        <th>
          <span id="i18n-active">Active</span>
        </th>
        <th colspan="3" />
      </tr>
    </thead>
    <tbody>
      <xsl:for-each select="//alias_get_all/alias_get_all">
        <tr id="a_{alias_id}">
          <td>
            <a href="{$link_prefix}cma-alias-edit&amp;alias_id={alias_id}">
              <xsl:value-of select="alias"/>@<xsl:value-of select="domain"/>
            </a>
          </td>
          <td>
            <a href="{$link_prefix}cma-alias-edit&amp;alias_id={alias_id}">
              <xsl:if test="string-length(destination) &gt; 40">
                <xsl:attribute name="title">
                  <xsl:value-of select="destination"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:value-of select="substring(destination,0,40)"/>
              <xsl:if test="string-length(destination) &gt; 40">
                <xsl:text>...</xsl:text>
              </xsl:if>
            </a>
          </td>
          <td>
            <xsl:value-of select="modified"/>
          </td>
          <td>
            <a href="{$link_prefix}cma-alias-edit&amp;alias_id={alias_id}">
              <xsl:value-of select="active"/>
            </a>
          </td>
          <td>
            <a href="{$link_prefix}cma-alias-edit&amp;alias_id={alias_id}">
              <span id="i18n-edit">edit</span>
            </a>
          </td>
          <td>
            <a href="{$link_prefix}cma-alias-delete&amp;alias_id={alias_id}"
            onclick="alias_delete({alias_id}); return false;">
              <span id="i18n-del">del</span>
            </a>
          </td>
        </tr>
      </xsl:for-each>
    </tbody>
  </table>
</div>
<div class="table_meta">
  <div style="float: right" class="button-basic-blue">
    <a href="{$link_prefix}cma-mailbox-edit&amp;domain_id={//runtime/domain_id}">Add Mailbox</a>
    <a class="button-basic-blue" href="{$link_prefix}cma-alias-edit&amp;domain_id={//runtime/domain_id}">Add Alias</a>
    <a class="button-basic-blue" href="{$link_prefix}x-alias-export&amp;domain_id={//runtime/domain_id}">Export Aliases</a>
  </div>
</div>
<div class="table_controls">
<xsl:call-template name="pager">
  <xsl:with-param name="my-table">alias_table</xsl:with-param>
</xsl:call-template>
</div>


	</xsl:template>
</xsl:stylesheet>
