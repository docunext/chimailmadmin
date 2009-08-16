<!--
Program: ChiMailMadmin
Component: dkimproxy_out.txt.xsl
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
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8" omit-xml-declaration="yes"/>
<xsl:template match="/">
# specify what address/port DKIMproxy should listen on
listen    127.0.0.1:10028

# specify what address/port DKIMproxy forwards mail to
relay     127.0.0.1:10029

# specify what domains DKIMproxy can sign for (comma-separated, no spaces)
# Note that this is set in /etc/init.d/dkimproxy in this Debian package
# unactivate it there if you want to use the config file
domain    <xsl:for-each select="/_R_/domains_get_all/domains_get_all"><xsl:value-of select="domain"/><xsl:if test="not(position()=last())"><xsl:text>,</xsl:text></xsl:if></xsl:for-each>

# specify what signatures to add
signature dkim(c=relaxed)
signature domainkeys(c=nofws)

# specify location of the private key
keyfile   /var/lib/dkimproxy/private.key

# specify the selector (i.e. the name of the key record put in DNS)
selector  dkim


</xsl:template>
</xsl:stylesheet>
