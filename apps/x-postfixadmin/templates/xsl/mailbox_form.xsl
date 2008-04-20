<!--
Program: X Postfix Admin
Component: mailbox_form.xsl
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
<form name="mailbox" method="post">
<table>
   <tr>
      <td colspan="3"><h3></h3></td>
   </tr>
   <tr>
      <td>Username</td>
      <td><input class="flat" type="text" name="fUsername" value="" autocomplete="off"/></td>
      <td>
      <select name="fDomain">
      </select>
      </td>
   </tr>
   <tr>
      <td>Password</td>
      <td><input class="flat" type="password" name="fPassword" /></td>
      <td></td>
   </tr>
   <tr>
      <td></td>
      <td><input class="flat" type="password" name="fPassword2" /></td>
      <td></td>
   </tr>
   <tr>
      <td>Name</td>
      <td><input class="flat" type="text" name="fName" value="" /></td>
      <td></td>
   </tr>
   <tr>
      <td>Active</td>
      <td><input class="flat" type="checkbox" name="fActive" /></td>
      <td></td>
   </tr>
   <tr>
      <td>Welcome mail</td>
      <td><input class="flat" type="checkbox" name="fMail" /></td>
      <td></td>
   </tr>
   <tr>
      <td colspan="3" class="hlp_center">
        <input class="button" type="submit" name="submit" value="" />
    </td>
   </tr>
   <tr>
      <td colspan="3" class="standout"></td>
   </tr>
</table>
</form>
</div>

</xsl:template>
</xsl:stylesheet>
