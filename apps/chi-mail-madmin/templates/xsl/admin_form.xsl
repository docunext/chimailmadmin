<!--
Program: Chi Mail Madmin
Component: admin_form.xsl
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
<div id="edit_form">
<form name="create_admin" method="post">
<table>
   <tr>
      <td colspan="3"><h3>Add a new domain admin</h3></td>
   </tr>
   <tr>
      <td>Admin:</td>
      <td><input type="text" name="username" value=""/></td>
      <td>Email address</td>
   </tr>
   <tr>
      <td>Password:</td>
      <td><input type="password" name="password" /></td>
      <td></td>
   </tr>

   <tr>
      <td>Password (again):</td>
      <td><input type="password" name="password2" /></td>
      <td></td>
   </tr>
   <tr>
      <td>Domain:</td>
      <td>

      <select name="fDomains[]" size="10" multiple="multiple">
        <xsl:for-each select="//domains_get_all">
            <option value="{domain}"><xsl:value-of select="domain_name"/></option>
        </xsl:for-each>
      </select>
      </td>
      <td></td>
   </tr>
   <tr>
      <td colspan="3"><input class="button" type="submit" name="submit" value="Add Admin" /></td>

   </tr>
</table>
</form>
</div>


</xsl:template>
</xsl:stylesheet>
