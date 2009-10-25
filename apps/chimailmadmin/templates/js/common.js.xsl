<!--
Program: Chimailmadmin.com
Component: common.js.xsl
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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output method="text" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
	<xsl:template match="/">
function mailbox_delete(mailbox_id) {
    if(confirm('Are you sure?')){
    $.post("<xsl:value-of select="//link_prefix"/>x-mailbox-delete&amp;mailbox_id="+mailbox_id,
    {
        'mailbox_id': mailbox_id
    },
    function (data){
      $("#mb_"+mailbox_id).remove();
    });
    }
}
function server_delete(server_id) {
  if(confirm('Are you sure?')){
  $.post("<xsl:value-of select="//link_prefix"/>x-server-delete&amp;server_id="+server_id,
  {
      'server_id': server_id
  },
  function (data){
    $("#srv_"+server_id).remove();
  });
  }
}
function acl_delete(acl_id,row) {
    if(confirm('Are you sure?')){
    $.post("<xsl:value-of select="//link_prefix"/>x-cma-access-delete&amp;acl_id="+acl_id,
    {
        'acl_id': acl_id
    },
    function (data){
      $("#acl_"+acl_id).remove();
    });
    }
}
function domain_group_delete(domain_group_id) {
    if(confirm('Are you sure?')){
    $.post("<xsl:value-of select="//link_prefix"/>x-domain-group-delete&amp;domain_group_id="+domain_group_id,
    {
        'domain_group_id': domain_group_id
    },
    function (data){
      $("#dg_"+domain_group_id).remove();
    });
    }
}
function domain_delete(domain_id) {
    if(confirm('Are you sure?')){
    $.post("<xsl:value-of select="//link_prefix"/>x-domain-delete&amp;domain_id="+domain_id,
    {
        'domain_id': domain_id
    },
    function (data){
      $("#d_"+domain_id).remove();
    });
    }
}
function alias_delete(alias_id) {
    if(confirm('Are you sure?')){
    $.post("<xsl:value-of select="//link_prefix"/>x-alias-delete&amp;alias_id="+alias_id,
    {
        'alias_id': alias_id
    },
    function (data){
      $("#a_"+alias_id).remove();
    });
    }
}
function user_pref_delete(pref_id) {
    if(confirm('Are you sure?')){
    $.post("<xsl:value-of select="//link_prefix"/>x-cma-dspam-delete&amp;pref_id="+pref_id,
    {
        'pref_id': pref_id
    },
    function (data){
      $("#pref_"+pref_id).remove();
    });
    }
}
function user_pref_delete(pref_id,row) {
  if(confirm('Are you sure?')){
  $.post("<xsl:value-of select="//link_prefix"/>x-cma-spamassassin-delete&amp;pref_id="+pref_id,
  {
      'pref_id': pref_id
  },
  function (data){
    $("#pref_"+pref_id).remove();
  });
  }
}
$(document).ready(function()
{
    $('#nav').droppy();
});
	</xsl:template>
</xsl:stylesheet>
