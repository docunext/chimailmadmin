<!--
Program: Chi Mail Madmin
Component: layout.css.xsl
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
<xsl:template name="layout">

#page {
    padding: 0;
		width: 100%;
}
#content {
    padding: 1em;
    min-height: 30em;
}

#footer {
    width: 100%;
		position: absolute;
		bottom: 0;
}


#nav li div {
padding: 2px 8px;
height: 24px;
cursor: default;
}
.nav_selected {
background-color: #AAA; color: white;
}
#tableframe
{
  position: absolute;
  top: 60px;
  left: 20px;
  right: 20px;
  bottom: 50px;
  border: 1px solid #999999;
  background-color: #F9F9F9;
  overflow: auto;
  <xsl:if test="//browser='msie'">
  width: expression((parseInt(document.documentElement.clientWidth)-230)+'px');
  height: expression((parseInt(document.documentElement.clientHeight)-125)+'px');
  </xsl:if>
}

.table_controls {
  position: absolute;
  bottom: 40px;
}

.table_meta {
  position: absolute;
  right: 100px;
  bottom: 40px;
}
</xsl:template>
</xsl:stylesheet>
