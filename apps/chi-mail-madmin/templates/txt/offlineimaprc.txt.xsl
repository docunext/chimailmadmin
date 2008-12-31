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

  <xsl:for-each select="/_R_/mailboxes_get_all/mailboxes_get_all">
    <xsl:value-of select="address"/><xsl:text>&#160;OK</xsl:text>
    <xsl:text>&#10;</xsl:text>
  </xsl:for-each>
[general]
accounts = docunextstaff

[Account docunextstaff]
localrepository = docunextstafflocal
remoterepository = docunextstaffremote
ignore-readonly = yes

[Repository docunextstafflocal]
type = Maildir
localfolders = /home/docunext.com/home/docunextstaff/.maildir

[Repository docunextstaffremote]
type = IMAP
#preauthtunnel = nc 192.168.8.12 9132
preauthtunnel = ssh -q 192.168.8.12 '/usr/bin/imapd /home/docunext.com/home/docunextstaff/.maildir'
#preauthtunnel = echo "/usr/bin/imapd /home/docunext.com/home/docunextstaff/.maildir" | nc 192.168.8.12 9132
#preauthtunnel = ssh 192.168.8.12 "netcat -v -l -p 9132 -c '/usr/bin/imapd /home/docunext.com/home/docunextstaff/.maildir'"; nc 192.168.8.12 9132
maxconnections = 1
holdconnectionopen = no
nametrans = lambda foldername: re.sub('^INBOX\.*', '.', foldername)

</xsl:template>
</xsl:stylesheet>
