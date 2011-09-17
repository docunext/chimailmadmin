<!--
Program: ChiMailMadmin.com
Component: server_form.xsl
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
	<xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>


<form method="post">
  <xsl:if test="//_get/server_id">
    <input type="hidden" name="server_id" value="{//_get/server_id}"/>
  </xsl:if>
  <table>
  <tbody>
  <tr>
    <th>
      <span class="i18n-server_name">Server name</span>
    </th>
    <td>
      <input type="text" name="server" value="{//servers_get_all/server}"/>
    </td>
  </tr>
  <tr>
    <th>
      <span class="i18n-host_name">Host name</span>
    </th>
    <td>
      <input type="text" name="host_name" value="{//servers_get_all/host_name}"/>
    </td>
  </tr>
  <tr>
    <th>
      <span class="i18n-server_type">Server type</span>
    </th>
    <td>
      <select name="server_type_id">

        <xsl:for-each select="//server_type/server_type">
          <option value="{@id}">
            <xsl:if test="//servers_get_all/server_type_id=@id">
              <xsl:attribute name="selected">selected</xsl:attribute>
            </xsl:if>
            <xsl:value-of select="label"/>
          </option>
        </xsl:for-each>

      </select>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <input type="submit"/>
    </td>
  </tr>
  </tbody>
  </table>
</form>

	</xsl:template>
</xsl:stylesheet>
