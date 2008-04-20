<!--
Program: X Postfix Admin
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
<xsl:output method="html" indent="yes" encoding="UTF-8" omit-xml-declaration="no" 
doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
<xsl:template match="/">
<html>
<head>
    <title><xsl:value-of select="/__ROOT__/i18n/labels/label[key='default_page_title']/value"/></title>
    <link rel="stylesheet" type="text/css" href="{//link_prefix}themed-css" ></link>
    <script type="text/javascript" src="{//path_prefix}/s/js/jquery/jquery.js"></script>
    <script type="text/javascript" src="{//path_prefix}s/js/jquery/plugins/jquery.cookiejar.js"></script>
    <script type="text/javascript" src="{//path_prefix}/s/js/jquery/plugins/jquery.tablesorter.min.js"></script>
    <script type="text/javascript" src="{//path_prefix}/s/js/jquery/plugins/jquery.tablesorter.pager.js"></script>
    <script type="text/javascript" src="{//path_prefix}s/js/jquery/plugins/jquery.dimensions.js"></script>
    <script type="text/javascript" src="{//path_prefix}s/js/jquery/plugins/jquery.date_input.js"></script>
    <script type="text/javascript" src="{//path_prefix}s/js/jquery/plugins/jquery.cookie.js"></script>
    <script type="text/javascript" src="{//path_prefix}s/js/jquery/plugins/jquery.json.js"></script>
    <script type="text/javascript" src="{//path_prefix}s/js/jquery/plugins/jquery.tablesorter.cookie.js"></script>
<xsl:for-each select="//in_head">
    <xsl:sort select="priority"/>
    <xsl:value-of select="string" disable-output-escaping="yes"/>
</xsl:for-each>
</head>
<body>
<xsl:for-each select="//pre_body_content">
    <xsl:sort select="priority"/>
    <xsl:value-of select="string" disable-output-escaping="yes"/>
</xsl:for-each>


<div id="menu">
<ul>
    <li>
        <a target='_top' href='list-admin.php'>Admin List</a>
        <ul>
            <li>
                <a target='_top' href='list-admin.php'>Admin List</a>
            </li>
            <li>
                <a target='_top' href='create-admin.php'>New Admin</a>
            </li>
        </ul>
    </li>
    <li>
        <a target='_top' href='list-domain.php'>Domain List</a>
        <ul>
            <li>
                <a target='_top' href='list-domain.php'>Domain List</a>
            </li>
            <li>
                <a target='_top' href='create-domain.php'>New Domain</a>
            </li>
        </ul>
    <li>
        <a target='_top' href='list-virtual.php'>Virtual List</a>
        <ul>
            <li>
                <a target='_top' href='list-virtual.php'>Virtual List</a>
            </li>
            <li>
                <a target='_top' href='create-mailbox.php'>Add Mailbox</a>
            </li>
            <li>
                <a target='_top' href='create-alias.php'>Add Alias</a>
            </li>
        </ul>
    </li>
    <li>
        <a target='_top' href='fetchmail.php'>Fetch Email</a>
        <ul>
            <li>
                <a target='_top' href='fetchmail.php'>Fetch Email</a>
            </li>
            <li>
                <a target='_top' href='fetchmail.php?new=1'>New entry</a>
            </li>
        </ul>
    </li>
    <li>
        <a target='_top' href='sendmail.php'>Send Email</a>
        <ul>
            <li>
                <a target='_top' href='sendmail.php'>Send Email</a>
            </li>
            <li>
                <a target='_top' href='broadcast-message.php'>Broadcast message</a>
            </li>
        </ul>
    </li>
    <li>
        <a target='_top' href='password.php'>Password</a>
    </li>
    <li>
        <a target='_top' href='backup.php'>Backup</a>
    </li>
    <li>
        <a target='_top' href='viewlog.php'>View Log</a>
    </li>
    <li>
        <a target='_top' href='logout.php'>Logout</a>
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

</body>
</html>
</xsl:template>
</xsl:stylesheet>
