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
html, body {
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
#footer {
    text-align: center;
    font-size: small;
    width: 100%;
    background-color: #ddd;
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
	background-image: url(<xsl:value-of select="//path_prefix"/>/s/css/blue/bg.gif);
	background-repeat: no-repeat;
	background-position: center right;
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
	background-image: url(<xsl:value-of select="//path_prefix"/>/s/css/blue/asc.gif);
}
table.tablesorter thead tr .headerSortDown {
	background-image: url(<xsl:value-of select="//path_prefix"/>/s/css/blue/desc.gif);
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




/* This file is from Postfix Admin */


body {
	background: #ffffff;
	color: #000000;
	font-family: "BitStream Vera Sans", Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	text-align: center;
}

a {
	text-decoration: none;
	color: #888888;
}

a:hover {
	text-decoration: underline;
	color: #888888;
}

a:visited, a:active {
	color: #888888;
}

table {
	/* border-spacing: 0; */
	/* padding: 0; */
	border-collapse: collapse; /* for IE */
}

.button {
	border: 1px solid #aaaaaa;
	color: #777777;
	background: #dddddd;
	padding: 3px 3px 3px 3px;
	font-size: 11px;
}

.button:hover {
	background: #BCFF36;
	color: #888888;
}

.flat {
	border: 1px solid #888888;
}

.error_msg {
	color: #d01313;
}

.standout {
	color: maroon;
	padding: 3px 3px 3px 3px;
	text-align: center;
}

#login_header {
	width: 750px;
	margin: 0 auto;
	padding-bottom: 10px;
	text-align: left;
}

#login {
	width: 750px;
	margin: 0 auto;
}

#login_table {
	border-left: 8px solid gray;
	border-right: 8px solid gray;
	background: #eeeeee;
	width: 350px;
	margin: 0 auto;
	border-collapse: separate;
	border-spacing: 10px;
}

#login_table h4 {
	font-size: 13px;
}

#menu {
	width: 750px;
	margin: 0 auto;
	padding-top: 10px;
	white-space: nowrap;
}

#menu ul {
	padding: 0;
	margin: 0;
	margin-left:auto;
	margin-right:auto;
	list-style: none;
}

#menu li {
	float: left;
	background: #efefef;
	margin-right: 3px;
	border-top: 4px solid #aaaaaa;
}

#menu li:hover, #menu li.sfhover {
	background: #BFFF00;
}

#menu li ul {
	position: absolute;
	width: auto;
	left: -999em;
	border:2px solid white;
	border-top:none;
}
#menu li:hover ul, #menu li.sfhover ul {
   left: auto;
}


#menu li ul li {
    float: none;
	margin-right: 0px;
	border-top:2px solid white;;
	text-align:left;
}




#menu a {
	display: block;
	width: auto;
	padding: 20px 5px 5px 5px;
	color: #888888;
}

#menu a:hover {
	color: #888888;
}



#menu li ul li a {
	padding: 5px 5px 5px 5px;
}



#main_menu, #edit_form {
	width: 750px;
	margin: 0 auto;
}

#edit_form table {
	margin: 0 auto;
	padding-top: 10px;
	text-align: left;
	width: 500px;
	border: 1px solid #efefef;
}

#edit_form h3  {
	text-align: center;
	font-size: 12px;
	margin: 0;
	background: #AFE1A6; /*#b4004a;*/
	border: 1px solid #bbb;
	line-height: 25px;
	color: #555555;
}

.hlp_center {
	text-align: center;
}

.help_text {
	background: #efefef;
	border-left: 1px solid #bbbbbb;
	border-right: 1px solid #bbbbbb;
	text-align: center;
	padding-top: 5px;
	padding-bottom: 5px;
}

#main_menu table {
	margin: 0 auto;
	text-align: left;
	padding-top: 20px;
	padding-bottom: 20px;
}

#main_menu table td {
	padding-left: 30px;
	padding-bottom: 5px;
}

#main_menu a {
	color: #888888;
	padding-left: 8px;
}

#main_menu a:hover {
	color: #40B33C; /*#CD6A6A;*/
	text-decoration: none;
	padding-left: 4px;
	border-bottom: 1px solid #40B33C;
	border-left: 4px solid #40B33C;
}

#overview, #admin_domains, #admin_virtual {
	width: 750px;
	margin: 0 auto;
	background: #AFE1A6; /*#9ACD32;*/
	border: 1px solid #bbb;
}

#overview h4, #overview P, #overview FORM, #admin_virtual h4, #admin_virtual P, #admin_virtual FORM {
	display: inline;
	padding-right: 10px;
	line-height: 30px;
}

#nav_bar {
	text-align: right;
	width: 750px;
	margin: 0 auto;
}

#alias_table, #mailbox_table, #overview_table, #log_table, #admin_table {
	width: 750px;
	margin: 0px auto;
	border: 1px solid #efefef;
}

#alias_table .header, #mailbox_table .header, #overview_table .header, #log_table .header, #admin_table .header {
	line-height: 20px;
	background: #efefef;
	color: black;
}

#alias_table .hilightoff, #mailbox_table .hilightoff, #overview_table .hilightoff, #log_table .hilightoff, #admin_table .hilighoff {
	background: white;
}

#alias_table .hilighton, #mailbox_table .hilighton, #overview_table .hilighton, #log_table .hilighton, #admin_table .hilighton {
	background: #D9FF43; /*#D6FF85;*/ /*#ffdddd;*/
}

#alias_table tr:hover, #mailbox_table tr:hover, #overview_table tr:hover, #log_table tr:hover, #admin_table tr:hover {
        background: #D9FF43; /*#D6FF85;*/ /*#ffdddd;*/
}


#alias_table h3, #mailbox_table h3, #overview_table h3, #log_table h3, #admin_table h3 {
	background: silver;
	text-align: left;
	font-size: 12px;
	font-weight: bold;
	padding-left: 20px;
	line-height: 25px;
	margin: 0;
}

#footer {
	width: 750px;
	margin: 20px auto;
	border-top: 1px solid #bbbbbb;
	background: #efefef;
	color: #999999;
	line-height: 20px;
	text-align: left;
	padding-left: 15px;
	font-size: 9px;
}

#footer a {
	text-decoration: none;
	color: #999999;
}

#footer a:hover {
	text-decoration: underline;
	color: #777777;
}

div.setup {
	width:700px;
	margin-left:auto;
	margin-right:auto;
	text-align: left;
}

div.setup li {
	padding-bottom:1em;
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
