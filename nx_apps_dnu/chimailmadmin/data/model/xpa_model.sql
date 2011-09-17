
CREATE TABLE IF NOT EXISTS `xpa_admin` (
  `user_id` int(11) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `xpa_alias` (
  `alias_id` int(11) NOT NULL auto_increment,
  `alias` varchar(255) NOT NULL default '',
  `destination` text NOT NULL,
  `domain_id` int(11) NOT NULL,
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`alias_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `xpa_config` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL default '',
  `value` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;


CREATE TABLE IF NOT EXISTS `xpa_domain` (
  `domain_id` int(11) NOT NULL auto_increment,
  `domain` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
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


CREATE TABLE IF NOT EXISTS `xpa_domain_admins` (
  `username` varchar(255) NOT NULL default '',
  `domain` varchar(255) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL default '1',
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ;


CREATE TABLE IF NOT EXISTS `xpa_mailbox` (
  `mailbox_id` int(11) NOT NULL auto_increment,
  `email_address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `maildir` varchar(255) NOT NULL default '',
  `quota` int(10) NOT NULL default '0',
  `domain_id` int(11) NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`mailbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `xpa_vacation` (
  `email` varchar(255) NOT NULL default '',
  `subject` varchar(255) NOT NULL default '',
  `body` text NOT NULL,
  `cache` text NOT NULL,
  `domain` varchar(255) NOT NULL default '',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ;

ALTER TABLE `xpa_alias`
  ADD CONSTRAINT `xpa_alias_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `xpa_domain` (`domain_id`) ON DELETE CASCADE;

ALTER TABLE `xpa_mailbox`
  ADD CONSTRAINT `xpa_mailbox_ibfk_1` FOREIGN KEY (`domain_id`) REFERENCES `xpa_domain` (`domain_id`);

