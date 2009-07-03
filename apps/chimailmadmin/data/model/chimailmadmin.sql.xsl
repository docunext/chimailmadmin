<!--
Program: YoDNSConf
Component: chimailmadmin.sql.xsl
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
Fifth Floor, Boston, MA 02110-1301 USA
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
<xsl:template match="/">

CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>admin` (
  `user_id` int(11) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>alias` (
  `alias_id` int(11) NOT NULL auto_increment,
  `alias` varchar(255) NOT NULL default '',
  `destination` text NOT NULL,
  `domain_id` int(11) NOT NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`alias_id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>config` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL default '',
  `value` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>domain` (
  `domain_id` int(11) NOT NULL auto_increment,
  `domain` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `restriction_class` varchar(255) NOT NULL default '',
  `aliases` int(10) NOT NULL default '0',
  `mailboxes` int(10) NOT NULL default '0',
  `maxquota` int(10) NOT NULL default '0',
  `quota` int(10) NOT NULL default '0',
  `transport` varchar(255) default NULL,
  `backupmx` tinyint(1) NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`domain_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>domain_admins` (
  `username` varchar(255) NOT NULL default '',
  `domain` varchar(255) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL default '1',
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>mailbox` (
  `mailbox_id` int(11) NOT NULL auto_increment,
  `email_address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `maildir` varchar(255) NOT NULL default '',
  `quota` int(10) NOT NULL default '0',
  `domain_id` int(11) NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `active` varchar(2) default NULL,
  PRIMARY KEY  (`mailbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>vacation` (
  `email` varchar(255) NOT NULL default '',
  `subject` varchar(255) NOT NULL default '',
  `body` text NOT NULL,
  `cache` text NOT NULL,
  `domain` varchar(255) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ;


<!-- thanks http://wiki.apache.org/spamassassin/UsingSQL -->
CREATE TABLE `<xsl:value-of select="//table_prefix"/>user_prefs` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `username` varchar(128) NOT NULL default '',
  `preference` varchar(64) NOT NULL default '',
  `value` varchar(128) default NULL,
  `descript` varchar(128) default NULL,
  `added` datetime NOT NULL default '2003-01-01 00:00:00',
  `added_by` varchar(128) NOT NULL default '',
  `modified` timestamp(14) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `type` (`preference`),
  KEY `added_by` (`added_by`),
  KEY `preference` (`preference`),
  KEY `username` (`username`)
) TYPE=MyISAM COMMENT='Spamassassin Preferences';

<!-- thanks http://www.marlow.dk/site.php/tech/postfix -->
CREATE TABLE <xsl:value-of select="//table_prefix"/>access_lists (
  acl_id int(10) unsigned NOT NULL auto_increment,
  source varchar(128) NOT NULL default '',
  access varchar(128) NOT NULL default '',
  created <xsl:value-of select="//dbe/engine_default_timestamp"/>,
  notes varchar(255) NOT NULL default '',
  restriction_class varchar(128) NOT NULL default '',
  domain_id int(11) NOT NULL default '0',
  postfix_check enum('header','permit') NOT NULL default 'header',
  type enum('recipient','sender','client') NOT NULL default 'recipient',
  PRIMARY KEY  (id)
) TYPE=MyISAM;



<!-- Thanks to Roundcube, probably needs adjusting. -->
CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>contacts` (
  `contact_id` int(10) unsigned NOT NULL auto_increment,
  `changed` datetime NOT NULL default '0000-00-00 00:00:00',
  `del` tinyint(1) NOT NULL default '0',
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `firstname` varchar(128) NOT NULL,
  `surname` varchar(128) NOT NULL,
  `vcard` text,
  `user_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`contact_id`),
  KEY `user_id_fk_contacts` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;



CREATE TABLE IF NOT EXISTS `<xsl:value-of select="//table_prefix"/>identities` (
  `identity_id` int(10) unsigned NOT NULL auto_increment,
  `del` tinyint(1) NOT NULL default '0',
  `standard` tinyint(1) NOT NULL default '0',
  `name` varchar(128) NOT NULL,
  `organization` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `reply-to` varchar(128) NOT NULL,
  `bcc` varchar(128) NOT NULL,
  `signature` text NOT NULL,
  `html_signature` tinyint(1) NOT NULL default '0',
  `user_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`identity_id`),
  KEY `user_id_fk_identities` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;



ALTER TABLE `xpa_alias`
  ADD CONSTRAINT `xpa_alias_ibfk_1` FOREIGN KEY (`alias_id`) REFERENCES `xpa_domain` (`domain_id`) ON DELETE CASCADE;

ALTER TABLE `xpa_mailbox`
  ADD CONSTRAINT `xpa_mailbox_ibfk_1` FOREIGN KEY (`mailbox_id`) REFERENCES `xpa_domain` (`domain_id`);
</xsl:template>
</xsl:stylesheet>
