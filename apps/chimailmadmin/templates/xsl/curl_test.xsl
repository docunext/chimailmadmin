<!--
Program: ChiMailMadmin.com
Component: welcome.xsl
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
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="xhtml"
  >
	<xsl:import href="html_main.xsl"/>
	<xsl:template name="content">
    <div class="tableframe">
      <xsl:apply-templates />
    </div>
  </xsl:template>

<xsl:template match="@*|node()">
  <xsl:if test="not(name()='_R_') and not(name()='html')">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:if>
  <xsl:if test="name()='_R_' or name()='html'">
    <xsl:apply-templates select="@*|node()"/>
  </xsl:if>
</xsl:template>


<xsl:template match="xhtml:div[@id='footer']">
</xsl:template>
<xsl:template match="xhtml:form">
</xsl:template>
<xsl:template match="xhtml:script">
</xsl:template>

<xsl:template match="xhtml:a">
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="node()">
  <xsl:if test="not(name()='_R_') and not(name()='html')">
      <xsl:element name="{name()}">
      <xsl:apply-templates select="@*|node()"/>
      </xsl:element>
  </xsl:if>
  <xsl:if test="name()='_R_' or name()='html'">
    <xsl:apply-templates select="@*|node()"/>
  </xsl:if>
</xsl:template>

<xsl:template match="@*|text()|comment()|processing-instruction()">
<xsl:if test="not(name()='lang') and not(name()='xml:lang')">
<xsl:copy/>
</xsl:if>
</xsl:template>






<xsl:template match="xhtml:head">
</xsl:template>
<xsl:template match="xhtml:body">
  <xsl:apply-templates select="@*|node()"/>
</xsl:template>
<xsl:template match="/_R_/*[not(name()='curl')]">
</xsl:template>





</xsl:stylesheet>
