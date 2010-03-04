<!--
Program: http://www.chimailmadmin.com
Component: spamassassin_prefs.xsl
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
      <xsl:for-each select="//spamassassin/preferences">
        <tr id="pref_{pref_id}">
          <td>
            <a href="cma-spamassassin-edit&amp;pref_id={pref_id}">
              <xsl:value-of select="email_domain"/>
            </a>
          </td>
          <td>
            <xsl:value-of select="@key"/>
          </td>
          <td>
            <xsl:value-of select="@value"/>
          </td>
          <td>
            <xsl:value-of select="created"/>
          </td>
          <td>
            <xsl:value-of select="notes"/>
          </td>
          <td>
            <a href="#x-cma-sa-delete&amp;pref_id={pref_id}"
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
</div>

<div class="table_meta">
  <div style="float: right" class="button-basic-blue">
    <a href="cma-spamassassin-edit">
    Add Entry</a>
    <a class="button-basic-blue" href="x-sender-user-prefs-export&amp;type=sender" title="Note: per-domain preferences may produce unpredictable results when not using SQL.">
      Preferences File Export
    </a>
  </div>
</div>
</div>
</xsl:template>
</xsl:stylesheet>
