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
<xsl:output method="text" encoding="UTF-8" omit-xml-declaration="yes"/>
<xsl:include href="base.css.xsl"/>
<xsl:include href="colors.css.xsl"/>
<xsl:include href="layout.css.xsl"/>
<xsl:include href="typography.css.xsl"/>
<xsl:template match="/">

<xsl:call-template name="base"/>
<xsl:call-template name="typography"/>
<xsl:call-template name="layout"/>
<xsl:call-template name="colors"/>
body {
	color: black;
	background: white;
	margin: 0;
	padding: 0;
	border: 0;
	min-height: 50em;
	font-family: sans-serif;
}





#banner h1 {
    color: #aa3f31;
    padding: .2em;
    margin-top: 0;
}

table.tablesorter {
	background-color: #CDCDCD;
	margin:10px 0pt 15px;
	font-size: 9pt;
	width: 100%;
	text-align: left;
}
table.tablesorter thead tr th, table.tablesorter tfoot tr th {
	background-color: #e6EEEE;
	border: 1px solid #FFF;
	font-size: 9pt;
	padding: 4px;
}
table.tablesorter thead tr .header {
	background-image: url(data:image/gif;base64,R0lGODlhFQAJAIAAACMtMP///yH5BAEAAAEALAAAAAAVAAkAAAIXjI+AywnaYnhUMoqt3gZXPmVg94yJVQAAOw==);
	background-repeat: no-repeat;
	background-position: center right;
	cursor: pointer;
}
.pointer {
	cursor: pointer;
}

table.tablesorter tbody td {
	color: #3D3D3D;
	padding: 4px;
	background-color: #FFF;
	vertical-align: top;
}
table.tablesorter tbody tr.odd td {
	background-color:#F0F0F6;
}
table.tablesorter thead tr .headerSortUp {
	background-image: url(data:image/gif;base64,R0lGODlhFQAEAIAAACMtMP///yH5BAEAAAEALAAAAAAVAAQAAAINjB+gC+jP2ptn0WskLQA7);
}
table.tablesorter thead tr .headerSortDown {
	background-image: url(data:image/gif;base64,R0lGODlhFQAEAIAAACMtMP///yH5BAEAAAEALAAAAAAVAAQAAAINjI8Bya2wnINUMopZAQA7);
}
table.tablesorter thead tr .headerSortDown, table.tablesorter thead tr .headerSortUp {
background-color: #8dbdd8;
}



<xsl:call-template name="thematic-button">
    <xsl:with-param name="button-name">basic-blue</xsl:with-param>
    <xsl:with-param name="background-color">#F1F1F1</xsl:with-param>
    <xsl:with-param name="color">#0066B9</xsl:with-param>
</xsl:call-template>
<xsl:call-template name="thematic-button">
    <xsl:with-param name="button-name">basic-green</xsl:with-param>
    <xsl:with-param name="background-color">#66FF99</xsl:with-param>
    <xsl:with-param name="color">#009900</xsl:with-param>
</xsl:call-template>
<xsl:call-template name="thematic-button">
    <xsl:with-param name="button-name">basic-black</xsl:with-param>
    <xsl:with-param name="background-color">grey</xsl:with-param>
    <xsl:with-param name="color">black</xsl:with-param>
</xsl:call-template>




table {
	/* border-spacing: 0; */
	/* padding: 0; */
	border-collapse: collapse; /* for IE */
}


</xsl:template>



<xsl:template name="thematic-button">
<xsl:param name="button-name"/>
<xsl:param name="background-color"/>
<xsl:param name="color"/>
.button-<xsl:value-of select="$button-name"/>
{
    padding: .2em .4em;
    background-color: <xsl:value-of select="$background-color"/>;
    color: <xsl:value-of select="$color"/>;
    font-weight: bold;
    border-style: solid;
    border-width: 1px;
    border-color: <xsl:value-of select="$color"/>;
    margin: .5em;
    cursor: pointer;
}

</xsl:template>
</xsl:stylesheet>
