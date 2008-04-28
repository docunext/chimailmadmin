<!--
Program: Yo Mailbox Admin
Component: main.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="html_shell.xsl"/>
<xsl:template name="main">
<div id="menu">
<ul>
    <li>
        <a href="{//link_prefix}xpa-domain-list">Domain List</a>
        <ul>
            <li>
                <a href="{//link_prefix}xpa-domain-list">Domain List</a>
            </li>
            <li>
                <a href="{//link_prefix}xpa-domain-edit">New Domain</a>
            </li>
        </ul>
    <li>
        <a href="{//link_prefix}xpa-mailbox-list">Address Lists</a>
        <ul>
            <li>
                <a href="{//link_prefix}xpa-mailbox-list">Address Lists</a>
            </li>
            <li>
                <a href="{//link_prefix}xpa-mailbox-edit">Add Mailbox</a>
            </li>
            <li>
                <a href="{//link_prefix}xpa-alias-list">Add Alias</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="{//link_prefix}">Logout</a>
    </li>
    </li>
</ul>

</div>

<br clear='all' />
<script type='text/javascript'>
sfHover = function() {
   var sfEls = document.getElementById("menu").getElementsByTagName("LI");
      for (var i=0; i &lt; sfEls.length; i++) {
         sfEls[i].onmouseover=function() {
            this.className+=" sfhover";
         }
         sfEls[i].onmouseout=function() {
            this.className=this.className.replace(new RegExp(" sfhover\\b"), "");
         }
   }
}
if (window.attachEvent) window.attachEvent("onload", sfHover);
</script>


    <xsl:call-template name="content"/>


<div id="footer">
    <a href="http://www.x-postfixadmin.docunext.com/blog/">Yo Mailbox Admin</a>
</div>
</xsl:template>
</xsl:stylesheet>
