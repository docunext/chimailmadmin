<!--
Program: Yo Mailbox Admin
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
or write to the Free Software Foundation,Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:import href="main.xsl"/>
<xsl:template name="content">
<div id="overview">
<form name="overview" method="post">
<select name="fDomain" onChange="this.form.submit();">
    <xsl:for-each select="//domains_get_all">
    <option value="{domain}"><xsl:value-of select="domain"/></option>
    </xsl:for-each>
</select>
<input type="hidden" name="limit" value="0" />

<input class="button" type="submit" name="go" value="Go" />
</form>
<h4>Overview for <xsl:value-of select="//domains_get_all[domain_id=//_get/domain_id]/domain"/></h4>

</div>

<p><a href="{//link_prefix}xpa-alias-edit&amp;domain_id={//_get/domain_id}">Add Alias</a></p>

<table id="mailbox_table">
   <tr>
      <td colspan="9"><h3>:: Mailboxes</h3></td>
  </tr>
  <tr class="header">
      <td>Email</td>
      <td>Name</td>
      <td>Last Modified</td>
      <td>Active</td>
      <td colspan="3"></td>
   </tr>
   <xsl:for-each select="//mailboxes_get_all">
   <tr class="hilightoff" onMouseOver="className='hilighton';" onMouseOut="className='hilightoff';">
      <td><xsl:value-of select="email_address"/></td>

      <td></td>
      <td>2008-04-22 22:46:18</td>
      <td><a href="">YES</a></td>
      <td><a href="">edit</a></td>
      <td><a href="" onclick="">del</a></td>
   </tr>
   </xsl:for-each>
</table>

<p><a href="{//link_prefix}xpa-mailbox-edit&amp;domain_id={//_get/domain_id}">Add Mailbox</a></p>


    
</xsl:template>
</xsl:stylesheet>