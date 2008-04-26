<!--
Program: X Postfix Admin
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
	<form  method="post">
    <table cellpadding="2" cellspacing="0" width="100%">
            <tr>
                <td>
                    ID
                </td>
                <td>
                    Name
                </td>
                <td>
                    Username
                </td>
                <td>
                    Email
                </td>
                <td>
                    Home
                </td>
                <td>
                    Mail
                </td>
                <td>
                    Impersonate
                </td>
                <td>
                    Edit
                </td>
                <td>
                    Delete
                </td>
            </tr>
        <xsl:for-each select="//get_client_account_users">
            <tr class="row{position() mod 2}">
                <td>
                    <xsl:value-of select="user_id"/>
                </td>
                <td>
                    <xsl:value-of select="first_name"/>&#160; <xsl:value-of select="last_name"/>
                </td>
                <td>
                    <xsl:value-of select="user_name"/>
                </td>
                <td>
                    <xsl:value-of select="email"/>
                </td>
                <td>
                    <xsl:value-of select="homedir"/>
                </td>
                <td>
                    <xsl:value-of select="maildir"/>
                </td>
                <td>
                <a href="/impersonate/&amp;user_id={user_id}">impersonate</a> 
                </td>
                <td>
                    <a href="/admin/security/acc/view/users/edit/&amp;user_id={user_id}">
                        Edit
                    </a>
                </td>
                <td>
                    <a href="/admin/security/acc/view/users/delete/&amp;user_id={user_id}" 
                        onclick="return confirm('Are you sure you want to delete this user?')">
                        Delete
                    </a>
                </td>
            </tr>
        </xsl:for-each>
    </table>

	</form>


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
<h4>Overview for wowzer.com</h4>
<p>Aliases: 0 / 10</p>
<p>Mailboxes: 1 / 10</p>
<form name="search" method="post" action="search.php">search:
<input type="textbox" name="search" size="10" />
</form>
</div>

<p><a href="create-alias.php?domain=wowzer.com">Add Alias</a></p>

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
