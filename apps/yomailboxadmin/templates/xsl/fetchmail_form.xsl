<!--
Program: Yo Mailbox Admin
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
Fifth Floor, Boston, MA 02110-1301  USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:import href="main.xsl"/>
<xsl:template name="content">
<div id="edit_form">
    <form name="fetchmail" method="post">
    <table><tr><td colspan="3"><h3>Fetch Email</h3></td></tr><tr><td align="left" valign="top">
    <label style="width: 20em;">Mailbox:</label></td>
    <td align="left" style="padding-left:.25em;padding-right:.25em;background-color:white;">
    <select name="mailbox" id="1">
        <option>albert.lash@savonix.com</option>
        </select>
</td><td align=left valign=top><i>Local mailbox</i></td></tr>
<tr><td align=left valign=top><label for=2 style='width:20em;'>Server:</label></td><td align=left style='padding-left:.25em;padding-right:.25em;background-color:white;'><input type=text name=src_server id=2 value=''></td><td align=left valign=top><i>Remote Server</i></td></tr>
<tr><td align=left valign=top><label for=3 style='width:20em;'>Auth Type:</label></td><td align=left style='padding-left:.25em;padding-right:.25em;background-color:white;'><select name=src_auth id=3><option>password</option>

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
</td><td align=left valign=top><i>Mostly "password"</i></td></tr>
<tr><td align=left valign=top><label for=4 style="width:20em;">User:</label></td><td align=left style="padding-left:.25em;padding-right:.25em;background-color:white;"><input type=text name=src_user id=4 value=""></td><td align=left valign=top><i>Remote User</i></td></tr>
<tr><td align=left valign=top><label for=5 style="width:20em;">Password:</label></td><td align=left style="padding-left:.25em;padding-right:.25em;background-color:white;"><input type=password name=src_password id=5 value=""></td><td align=left valign=top><i>Remote Password</i></td></tr>
<tr><td align=left valign=top><label for=6 style="width:20em;">Folder:</label></td><td align=left style="padding-left:.25em;padding-right:.25em;background-color:white;"><input type=text name=src_folder id=6 value=""></td><td align=left valign=top><i>Remote Folder</i></td></tr>
<tr><td align=left valign=top><label for=7 style="width:20em;">Poll:</label></td><td align=left style="padding-left:.25em;padding-right:.25em;background-color:white;"><input type=text name=poll_time id=7 value="10"></td><td align=left valign=top><i>Poll every ... minutes</i></td></tr>

<tr><td align=left valign=top><label for=8 style="width:20em;">Fetch All:</label></td><td align=left style="padding-left:.25em;padding-right:.25em;background-color:white;"><input type=checkbox name=fetchall id=8></td><td align=left valign=top><i>Retrieve  both old (seen) and new messages</i></td></tr>
<tr><td align=left valign=top><label for=9 style="width:20em;">Keep:</label></td><td align=left style="padding-left:.25em;padding-right:.25em;background-color:white;"><input type=checkbox name=keep id=9></td><td align=left valign=top><i>Keep retrieved messages on the remote mailserver</i></td></tr>
<tr><td align=left valign=top><label for=10 style="width:20em;">Protocol:</label></td><td align=left style="padding-left:.25em;padding-right:.25em;background-color:white;"><select name=protocol id=10><option>POP3</option>
<option>IMAP</option>
<option>POP2</option>
<option>ETRN</option>

<option>AUTO</option>
</select>
</td><td align=left valign=top><i>Protocol to use</i></td></tr>
<tr><td align=center colspan=3>
      <input type=submit name=save value="Save"> 
      <input type=submit name=cancel value="Cancel">
   </td></tr>
</table>
<p />
</form>
</div>


</xsl:template>
</xsl:stylesheet>
