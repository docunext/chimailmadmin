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
	<xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>


<script type="text/javascript"
src="{$link_prefix}x-tablesorter-setup-js&amp;selector=access_table" />

<script type="text/javascript">
function user_pref_delete(pref_id,row) {
    if(confirm('Are you sure?')){
    $.post("<xsl:value-of select="$link_prefix"/>x-cma-dspam-delete&amp;pref_id="+pref_id,
    {
        'pref_id': pref_id
    },
    function (data){
      $("#pref_"+pref_id).remove();
    });
    }
}
</script>
<div id="tableframe">
  <table id="access_table" class="tablesorter">
    <thead>
      <tr>
        <th>Email / Domain</th>
        <th>Preference</th>
        <th>Value</th>
        <th>Date</th>
        <th>Notes</th>
        <th>Delete</th>
      </tr>
    </thead>
    <tbody>
      <xsl:for-each select="//user_prefs_get_all/user_prefs_get_all">
        <tr id="pref_{pref_id}">
          <td>
            <a href="{$link_prefix}cma-dspam-edit&amp;pref_id={pref_id}">
              <xsl:value-of select="email_domain"/>
            </a>
          </td>
          <td>
            <xsl:value-of select="preference"/>
          </td>
          <td>
            <xsl:value-of select="value"/>
          </td>
          <td>
            <xsl:value-of select="created"/>
          </td>
          <td>
            <xsl:value-of select="notes"/>
          </td>
          <td>
            <a href="#{$link_prefix}x-cma-dspam-delete&amp;pref_id={pref_id}"
              onclick="user_pref_delete({pref_id}); return false;"
              >
            Delete
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

  <div style="float: right">
    <a class="button-basic-{//theme_color}" href="{$link_prefix}cma-dspam-edit">
    Add Entry</a>
  </div>
  <div style="float: right">
    <a class="button-basic-{//theme_color}" href="{$link_prefix}x-sender-user-prefs-export&amp;type=sender" title="Note: per-domain preferences may produce unpredictable results when not using SQL.">
      Preferences File Export
    </a>
  </div>
</div>
	</xsl:template>
</xsl:stylesheet>
