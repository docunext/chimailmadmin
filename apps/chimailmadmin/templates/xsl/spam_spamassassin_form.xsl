<!--
Program: ChiMailMadmin.com
Component: spam_spamassassin_form.xsl
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
	xmlns="http://www.w3.org/1999/xhtml">
	<xsl:import href="html_main.xsl"/>
	<xsl:template name="content">
    <xsl:param name="link_prefix"/>
    <xsl:param name="path_prefix"/>
    <xsl:param name="i18n"/>
    <xsl:variable name="acl_get" select="//preference_get/preference_get"/>

<div id="edit_form">
  <form name="preference" method="post">
    <table>
      <tbody>
      <tr>
        <th>
          <label for="email_domain">
            <span id="i18n-user_emain_domain">User-Email / Domain</span>
          </label>
        </th>
        <td>
          <input type="text" name="email_domain" id="email_domain"
          value="{$acl_get/email_domain}"/>
        </td>
      </tr>
      <tr>
        <th>
          <label for="preference">
            <span id="i18n-preference" class="i18n">Preference</span>
          </label>
        </th>
        <td>
          <input type="text" name="preference" id="preference"
          value="{$acl_get/preference}"/>
        </td>
      </tr>
      <tr>
        <th>
          <label for="value">
            <span id="i18n-value" class="i18n">Value</span>
          </label>
        </th>
        <td>
          <input type="text" name="value" id="value"
          value="{$acl_get/value}"/>
        </td>
      </tr>
      <tr>
        <th>
          <label for="notes">
            <span id="i18n-notes" class="i18n">Notes</span>
          </label>
        </th>
        <td>
          <input type="text" name="notes" id="notes"
          value="{$acl_get/notes}"/>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input class="button" type="submit" name="submit"
          value="{$i18n/submit}"/>
        </td>
      </tr>
      </tbody>
    </table>
  </form>
</div>


	</xsl:template>
</xsl:stylesheet>
