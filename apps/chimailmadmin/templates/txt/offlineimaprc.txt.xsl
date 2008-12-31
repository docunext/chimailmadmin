<!--
Program: ChiMailMadmin
Component: mailbox_export.txt.xsl
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
<xsl:output method="text" encoding="UTF-8" omit-xml-declaration="yes"/>
<xsl:template match="/">


[general]
<xsl:text>accounts = </xsl:text>
  <xsl:for-each select="/_R_/mailboxes_get_all/mailboxes_get_all">
    <xsl:value-of select="name"/>&#160;
  </xsl:for-each>


<xsl:for-each select="/_R_/mailboxes_get_all/mailboxes_get_all">
[Account <xsl:value-of select="name"/>]
localrepository = <xsl:value-of select="name"/>local
remoterepository = <xsl:value-of select="name"/>remote
ignore-readonly = yes

[Repository <xsl:value-of select="name"/>local]
type = Maildir
localfolders = /home/docunext.com/home/<xsl:value-of select="name"/>/.maildir

[Repository <xsl:value-of select="name"/>remote]
type = IMAP
preauthtunnel = ssh -q 192.168.8.12 '/usr/bin/imapd /home/docunext.com/home/<xsl:value-of select="name"/>/.maildir'
maxconnections = 1
holdconnectionopen = no
nametrans = lambda foldername: re.sub('^INBOX\.*', '.', foldername)
</xsl:for-each>

</xsl:template>
</xsl:stylesheet>
