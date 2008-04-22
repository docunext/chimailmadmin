#
# Copyright (c) 2004-2006, NFG Net Facilities Group BV, support@nfg.nl
# Copyright (c) 2006 Aaron Stone, aaron@serendipity.cx
#
# This program is free software; you can redistribute it and/or 
# modify it under the terms of the GNU General Public License 
# as published by the Free Software Foundation; either 
# version 2 of the License, or (at your option) any later 
# version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
# 

# schema for innodb tables with added indexes and foreign keys
# for more speed. 
# This file was originally created by Paul Stevens and added
# to dbmail on August 27th, 2003.
# 
# 

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS dbmail_aliases;
CREATE TABLE dbmail_aliases (
	alias_idnr BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	alias VARCHAR(100) NOT NULL DEFAULT '',
	deliver_to VARCHAR(250) NOT NULL DEFAULT '',
	client_idnr BIGINT UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY (alias_idnr),
	INDEX alias_index (alias),
	INDEX client_idnr_index (client_idnr)	
) ENGINE InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS dbmail_users;
CREATE TABLE dbmail_users (
	user_idnr BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	userid VARCHAR(100) NOT NULL DEFAULT '',
	passwd VARCHAR(34) NOT NULL DEFAULT '',
	client_idnr BIGINT UNSIGNED NOT NULL DEFAULT '0',
	maxmail_size BIGINT UNSIGNED NOT NULL DEFAULT '0',
	curmail_size BIGINT UNSIGNED NOT NULL DEFAULT '0',
	maxsieve_size BIGINT UNSIGNED DEFAULT '0' NOT NULL,
	cursieve_size BIGINT UNSIGNED DEFAULT '0' NOT NULL,
	encryption_type VARCHAR(20) NOT NULL DEFAULT '',
	last_login DATETIME NOT NULL DEFAULT '1979-11-03 22:05:58',
	PRIMARY KEY  (user_idnr),
	UNIQUE INDEX userid_index (userid)
) ENGINE InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS dbmail_usermap;
CREATE TABLE dbmail_usermap (
  login VARCHAR(100) NOT NULL,
  sock_allow VARCHAR(100) NOT NULL,
  sock_deny VARCHAR(100) NOT NULL,
  userid VARCHAR(100) NOT NULL
) ENGINE InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX usermap_idx_1 ON dbmail_usermap(login, sock_allow, userid);

DROP TABLE IF EXISTS dbmail_mailboxes;
CREATE TABLE dbmail_mailboxes (
	mailbox_idnr BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	owner_idnr BIGINT UNSIGNED NOT NULL DEFAULT '0',
	name VARCHAR(100) NOT NULL DEFAULT '',
	seen_flag TINYINT UNSIGNED NOT NULL DEFAULT '0',
	answered_flag TINYINT UNSIGNED NOT NULL DEFAULT '0',
	deleted_flag TINYINT UNSIGNED NOT NULL DEFAULT '0',
	flagged_flag TINYINT UNSIGNED NOT NULL DEFAULT '0',
	recent_flag TINYINT UNSIGNED NOT NULL DEFAULT '0',
	draft_flag TINYINT UNSIGNED NOT NULL DEFAULT '0',
	no_inferiors TINYINT UNSIGNED NOT NULL DEFAULT '0',
	no_select TINYINT UNSIGNED NOT NULL DEFAULT '0',
	permission TINYINT UNSIGNED DEFAULT '2',
	PRIMARY KEY  (mailbox_idnr),
	INDEX name_index (name),
	INDEX owner_idnr_index (owner_idnr),
	UNIQUE INDEX owner_idnr_name_index (owner_idnr, name),
	FOREIGN KEY owner_idnr_fk (owner_idnr) 
		REFERENCES dbmail_users (user_idnr) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS dbmail_subscription;
CREATE TABLE dbmail_subscription (
	user_id BIGINT UNSIGNED NOT NULL DEFAULT '0',
	mailbox_id BIGINT UNSIGNED NOT NULL,
	primary key (user_id, mailbox_id),
	index user_id_index (user_id),
	index mailbox_id_index (mailbox_id),
	FOREIGN KEY user_id_fk (user_id) 
		REFERENCES dbmail_users (user_idnr) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY mailbox_id_fk (mailbox_id) 
		REFERENCES dbmail_mailboxes (mailbox_idnr) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS dbmail_acl;
CREATE TABLE dbmail_acl (
	user_id BIGINT UNSIGNED NOT NULL,
	mailbox_id BIGINT UNSIGNED NOT NULL,
	lookup_flag TINYINT UNSIGNED DEFAULT '0' NOT NULL,
	read_flag TINYINT UNSIGNED DEFAULT '0' NOT NULL,
	seen_flag TINYINT UNSIGNED DEFAULT '0' NOT NULL,
	write_flag TINYINT UNSIGNED DEFAULT '0' NOT NULL,
	insert_flag TINYINT UNSIGNED DEFAULT '0' NOT NULL,	
	post_flag TINYINT UNSIGNED DEFAULT '0' NOT NULL,
	create_flag TINYINT UNSIGNED DEFAULT '0' NOT NULL,	
	delete_flag TINYINT UNSIGNED DEFAULT '0' NOT NULL,	
	administer_flag TINYINT UNSIGNED DEFAULT '0' NOT NULL,	
	PRIMARY KEY(user_id, mailbox_id),
	INDEX user_id_index (user_id),
	INDEX mailbox_id_index (mailbox_id),
	FOREIGN KEY user_id_fk (user_id) 
		REFERENCES dbmail_users (user_idnr) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY mailbox_id_fk (mailbox_id) 
		REFERENCES dbmail_mailboxes (mailbox_idnr) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8;
	
DROP TABLE IF EXISTS dbmail_physmessage;
CREATE TABLE dbmail_physmessage (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	messagesize BIGINT UNSIGNED NOT NULL DEFAULT '0',
	rfcsize BIGINT UNSIGNED NOT NULL DEFAULT '0',
	internal_date DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (id)
) ENGINE InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS dbmail_messages;
CREATE TABLE dbmail_messages (
	message_idnr BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	mailbox_idnr BIGINT UNSIGNED NOT NULL DEFAULT '0',
	physmessage_id BIGINT UNSIGNED NOT NULL DEFAULT '0',
	seen_flag TINYINT UNSIGNED NOT NULL DEFAULT '0',
	answered_flag TINYINT UNSIGNED NOT NULL DEFAULT '0',
	deleted_flag TINYINT UNSIGNED NOT NULL DEFAULT '0',
	flagged_flag TINYINT UNSIGNED NOT NULL DEFAULT '0',
	recent_flag TINYINT UNSIGNED NOT NULL DEFAULT '0',
	draft_flag TINYINT UNSIGNED NOT NULL DEFAULT '0',
	unique_id VARCHAR(70) NOT NULL DEFAULT '',
	status TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY  (message_idnr),
	INDEX physmessage_id_index (physmessage_id),		
	INDEX mailbox_idnr_index (mailbox_idnr),
	INDEX seen_flag_index (seen_flag),
	INDEX unique_id_index (unique_id),
	INDEX status_index (status),
	INDEX mailbox_status (mailbox_idnr, status),
	FOREIGN KEY physmessage_id_fk (physmessage_id) 
		REFERENCES dbmail_physmessage (id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY mailbox_idnr_fk (mailbox_idnr) 
		REFERENCES dbmail_mailboxes (mailbox_idnr) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS dbmail_messageblks;
CREATE TABLE dbmail_messageblks (
	messageblk_idnr BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	physmessage_id BIGINT UNSIGNED NOT NULL DEFAULT '0',
	messageblk longblob NOT NULL,
	blocksize BIGINT UNSIGNED NOT NULL DEFAULT '0',
	is_header TINYINT UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY (messageblk_idnr),
	INDEX physmessage_id_index (physmessage_id),
	INDEX physmessage_id_is_header_index (physmessage_id, is_header),
	FOREIGN KEY physmessage_id_fk (physmessage_id) 
		REFERENCES dbmail_physmessage (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS dbmail_auto_notifications;
CREATE TABLE dbmail_auto_notifications (
 	user_idnr BIGINT UNSIGNED NOT NULL,
	notify_address VARCHAR(100) NOT NULL,
	INDEX user_idnr_index (user_idnr),
	FOREIGN KEY user_idnr_fk (user_idnr) 
		REFERENCES dbmail_users (user_idnr) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS dbmail_auto_replies;
CREATE TABLE dbmail_auto_replies (
   	user_idnr BIGINT UNSIGNED DEFAULT '0' NOT NULL,
	start_date DATETIME NOT NULL,
	stop_date DATETIME NOT NULL,
   	reply_body MEDIUMTEXT,
	INDEX user_idnr_index (user_idnr),
	FOREIGN KEY user_idnr_fk (user_idnr) 
		REFERENCES dbmail_users (user_idnr) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS dbmail_pbsp;
CREATE TABLE dbmail_pbsp (
   idnr BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
   since DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
   ipnumber VARCHAR(40) NOT NULL,
   PRIMARY KEY (idnr),
   UNIQUE INDEX ipnumber_index (ipnumber),
   INDEX since_index (since)
) ENGINE InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS dbmail_sievescripts;
CREATE TABLE dbmail_sievescripts (
  owner_idnr BIGINT UNSIGNED DEFAULT '0' NOT NULL,
  name VARCHAR(100) NOT NULL,
  script TEXT,
  active TINYINT UNSIGNED DEFAULT '0' NOT NULL,
  INDEX (name),
  INDEX (owner_idnr),
  INDEX (owner_idnr, name),
  FOREIGN KEY owner_idnr_fk (owner_idnr)
    REFERENCES dbmail_users (user_idnr) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8;


#
# store all headers by storing all headernames and headervalues in separate
# tables.
#

DROP TABLE IF EXISTS dbmail_headername;
CREATE TABLE dbmail_headername (
	id		BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	headername	VARCHAR(100) NOT NULL DEFAULT '',
	PRIMARY KEY (id),
	UNIQUE (headername)
) ENGINE InnoDB DEFAULT CHARSET=utf8 ;

DROP TABLE IF EXISTS dbmail_headervalue;
CREATE TABLE dbmail_headervalue (
	headername_id	BIGINT UNSIGNED NOT NULL,
        physmessage_id	BIGINT UNSIGNED NOT NULL,
	id		BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	headervalue	TEXT NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (physmessage_id, id),
	UNIQUE (physmessage_id, headername_id, headervalue(255)),
	INDEX (headername_id),
	INDEX (physmessage_id),
	FOREIGN KEY (headername_id)
		REFERENCES dbmail_headername(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (physmessage_id)
		REFERENCES dbmail_physmessage(id) ON UPDATE CASCADE ON DELETE CASCADE
	
		
) ENGINE InnoDB DEFAULT CHARSET=utf8 ;

# Provide separate storage of commonly used headers

# These fields will typically be preparsed as specified by 
# http://www.ietf.org/internet-drafts/draft-ietf-imapext-sort-17.txt

# Threading

# support fast threading by breaking out In-Reply-To/References headers
# these fields contain zero or more Message-Id values that determine the message
# threading

DROP TABLE IF EXISTS dbmail_subjectfield;
CREATE TABLE dbmail_subjectfield (
        physmessage_id  BIGINT UNSIGNED NOT NULL,
	id		BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	subjectfield	VARCHAR(255) NOT NULL DEFAULT '',
	PRIMARY KEY (id),
	UNIQUE (physmessage_id, subjectfield),
	FOREIGN KEY (physmessage_id)
			REFERENCES dbmail_physmessage(id)
			ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8 ;

DROP TABLE IF EXISTS dbmail_datefield;
CREATE TABLE dbmail_datefield (
        physmessage_id  BIGINT UNSIGNED NOT NULL,
	id		BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	datefield	DATETIME NOT NULL DEFAULT '1970-01-01 00:00:00',
	PRIMARY KEY (id),
	UNIQUE (physmessage_id, datefield),
	FOREIGN KEY (physmessage_id)
			REFERENCES dbmail_physmessage(id)
			ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8 ;

DROP TABLE IF EXISTS dbmail_referencesfield;
CREATE TABLE dbmail_referencesfield (
        physmessage_id  BIGINT UNSIGNED NOT NULL,
	id		BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	referencesfield	VARCHAR(255) NOT NULL DEFAULT '',
	PRIMARY KEY (id),
	UNIQUE (physmessage_id, referencesfield),
	FOREIGN KEY (physmessage_id)
			REFERENCES dbmail_physmessage(id)
			ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8 ;

# Searching and Sorting

# support fast sorting by breaking out and preparsing the fields most commonly used
# in searching and sorting: Subject, From, To, Reply-To, Cc. 

DROP TABLE IF EXISTS dbmail_fromfield;
CREATE TABLE dbmail_fromfield (
        physmessage_id  BIGINT UNSIGNED NOT NULL,
	id		BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	fromname	VARCHAR(100) NOT NULL DEFAULT '',
	fromaddr	VARCHAR(100) NOT NULL DEFAULT '',
	PRIMARY KEY (id),
	UNIQUE (physmessage_id, id),
	FOREIGN KEY (physmessage_id)
			REFERENCES dbmail_physmessage(id)
			ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8 ;
CREATE INDEX dbmail_fromfield_1 ON dbmail_fromfield(fromname);
CREATE INDEX dbmail_fromfield_2 ON dbmail_fromfield(fromaddr);

DROP TABLE IF EXISTS dbmail_tofield;
CREATE TABLE dbmail_tofield (
        physmessage_id  BIGINT UNSIGNED NOT NULL,
	id		BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	toname		VARCHAR(100) NOT NULL DEFAULT '',
	toaddr		VARCHAR(100) NOT NULL DEFAULT '',
	PRIMARY KEY (id),
	UNIQUE (physmessage_id, id),
	FOREIGN KEY (physmessage_id)
			REFERENCES dbmail_physmessage(id)
			ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8 ;
CREATE INDEX dbmail_fromfield_1 ON dbmail_tofield(toname);
CREATE INDEX dbmail_fromfield_2 ON dbmail_tofield(toaddr);

DROP TABLE IF EXISTS dbmail_replytofield;
CREATE TABLE dbmail_replytofield (
        physmessage_id  BIGINT UNSIGNED NOT NULL,
	id		BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	replytoname	VARCHAR(100) NOT NULL DEFAULT '',
	replytoaddr	VARCHAR(100) NOT NULL DEFAULT '',
	PRIMARY KEY (id),
	UNIQUE (physmessage_id, id),
	FOREIGN KEY (physmessage_id)
			REFERENCES dbmail_physmessage(id)
			ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8 ;
CREATE INDEX dbmail_replytofield_1 ON dbmail_replytofield(replytoname);
CREATE INDEX dbmail_replytofield_2 ON dbmail_replytofield(replytoaddr);

DROP TABLE IF EXISTS dbmail_ccfield;
CREATE TABLE dbmail_ccfield (
        physmessage_id  BIGINT UNSIGNED NOT NULL,
	id		BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	ccname		VARCHAR(100) NOT NULL DEFAULT '',
	ccaddr		VARCHAR(100) NOT NULL DEFAULT '',
	PRIMARY KEY (id),
	UNIQUE (physmessage_id, id),
	FOREIGN KEY (physmessage_id)
			REFERENCES dbmail_physmessage(id)
			ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8 ;
CREATE INDEX dbmail_ccfield_1 ON dbmail_ccfield(ccname);
CREATE INDEX dbmail_ccfield_2 ON dbmail_ccfield(ccaddr);

COMMIT;

-- Table structure for table `dbmail_replycache`

DROP TABLE IF EXISTS dbmail_replycache;
CREATE TABLE dbmail_replycache (
  to_addr VARCHAR(100) NOT NULL DEFAULT '',
  from_addr VARCHAR(100) NOT NULL DEFAULT '',
  handle VARCHAR(100) NOT NULL DEFAULT '',
  lastseen DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY replycache_1 (to_addr,from_addr, handle)
) ENGINE InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS dbmail_usermap;
CREATE TABLE dbmail_usermap (
  login VARCHAR(100) NOT NULL,
  sock_allow VARCHAR(100) NOT NULL,
  sock_deny VARCHAR(100) NOT NULL,
  userid VARCHAR(100) NOT NULL
) ENGINE InnoDB DEFAULT CHARSET=utf8;

CREATE UNIQUE INDEX usermap_idx_1 ON dbmail_usermap(login, sock_allow, userid);

DROP TABLE IF EXISTS dbmail_envelope;
CREATE TABLE dbmail_envelope (
	physmessage_id	BIGINT UNSIGNED NOT NULL,
	id		BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	envelope	TEXT NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (physmessage_id, id),
	FOREIGN KEY (physmessage_id)
			REFERENCES dbmail_physmessage(id)
			ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS=1;
# create the user for the delivery chain
INSERT INTO dbmail_users (userid, passwd, encryption_type) 
	VALUES ('__@!internal_delivery_user!@__', '', 'md5');
# create the 'anyone' user for ACLs
INSERT INTO dbmail_users (userid, passwd, encryption_type) 
	VALUES ('anyone', '', 'md5');
# create the user to own #Public mailboxes
INSERT INTO dbmail_users (userid, passwd, encryption_type) 
	VALUES ('__public__', '', 'md5');





