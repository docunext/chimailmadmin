<!--
Program: Chi Mail Madmin
Component: fetchmail_form.xsl
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
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:import href="main.xsl"/>
<xsl:template name="content">
<div id="edit_form">
    <form name="fetchmail" method="post">
    <table><tr><td colspan="3"><h3>Fetch Email</h3></td></tr>
    <tr>
        <td>
        <label>Mailbox:</label>
        </td>
        <td align="left">
        <select name="mailbox" id="1">
            <xsl:for-each select="placeholder-replace-this">
            <option><xsl:value-of select="email"/></option>
            </xsl:for-each>
        </select>
        </td>
        <td><i>Local mailbox</i></td>
    </tr>
    <tr>
        <td>Server:</td>
        <td>
        <input type="text" name="src_server"/></td>
        <td><i>Remote Server</i>
        </td>
    </tr>
    <tr>
        <td><label>Auth Type:</label></td>
        <td>
            <select name="src_auth">
                <option>password</option>
                <option>kerberos_v5</option>
                <option>kerberos</option>
                <option>kerberos_v4</option>
                <option>gssapi</option>
                <option>cram-md5</option>
                <option>otp</option>
                <option>ntlm</option>
                <option>msn</option>
                <option>ssh</option>
                <option>any</option>
            </select>
        </td>
        <td>
            <i>Mostly "password"</i>
        </td>
    </tr>
    <tr><td><label>User:</label></td><td><input type="text" name="src_user"/></td><td><i>Remote User</i></td></tr>
    <tr><td><label>Password:</label></td><td><input type="password" name="src_password"/></td><td><i>Remote Password</i></td></tr>
    <tr><td><label>Folder:</label></td><td><input type="text" name="src_folder"/></td><td><i>Remote Folder</i></td></tr>
    <tr><td><label>Poll:</label></td><td><input type="text" name="poll_time" value="10"/></td><td><i>Poll every ... minutes</i></td></tr>
    <tr><td><label>Fetch All:</label></td><td><input type="checkbox" name="fetchall"/></td><td><i>Retrieve  both old (seen) and new messages</i></td></tr>
    <tr><td><label>Keep:</label></td><td><input type="checkbox" name="keep"/></td><td><i>Keep retrieved messages on the remote mailserver</i></td></tr>
    <tr><td><label>Protocol:</label></td><td><select name="protocol"><option>POP3</option>
    <option>IMAP</option>
    <option>POP2</option>
    <option>ETRN</option>
    <option>AUTO</option>
    </select>
    </td><td><i>Protocol to use</i></td></tr>
<tr><td align=center colspan=3>
      <input type="submit" name="save" value="Save"/> 
      <input type="submit" name="cancel" value="Cancel"/>
   </td></tr>
</table>
<p/>
</form>
</div>


</xsl:template>
</xsl:stylesheet>
