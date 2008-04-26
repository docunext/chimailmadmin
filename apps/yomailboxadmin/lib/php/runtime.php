<?php
/*
Program: X Postfix Admin
Component: runtime.php
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

*/




# This wacky path builder is required due to mod_rewrite situations
$request_uri = $_SERVER['REQUEST_URI'];
Nexista_Flow::add("request_uri",$request_uri);
$parse_uri = explode("?",$request_uri);
$app_prefix=$parse_uri[0];
$path_prefix = dirname($app_prefix);
$link_prefix = $app_prefix."?nid=";
$utcdate = gmdate('Y-m-d H:i:s');



$runtime = array('host_name'=>$_SERVER['SERVER_NAME'],
                'path_prefix'=>$path_prefix,
                'link_prefix'=>$link_prefix,
                'utcdate'=>$utcdate,
                'username'=>$_SESSION['NX_AUTH']['username'],
                'user_id'=>$_SESSION['NX_AUTH']['user_id'],
                'group_id'=>$_SESSION['NX_AUTH']['group_id'],
                'remote_ip'=>$_SERVER['REMOTE_ADDR'],
                'timestamp'=>time());

Nexista_Flow::add("runtime",$runtime,false);


?>