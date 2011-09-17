<?php
/* <!--
Program: Chi Mail Madmin
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
or write to the Free Software Foundation, Inc., 51 Franklin Street,
Fifth Floor, Boston, MA 02110-1301 USA
--> */



$path = $_SERVER['SCRIPT_NAME'];
if ($_GET['nxrw_path']) {
    $path = $_GET['nxrw_path'];
}
$path_prefix = dirname($path).'/';
$link_prefix = $path.'?nid=';

$utcdate     = gmdate('Y-m-d H:i:s');


// Prefix is needed for Mozilla as its the 0 position.
$ua = '_' . $_SERVER['HTTP_USER_AGENT'];

if(strpos($ua,'Google') || strpos($ua,'Yahoo') || strpos($ua,'bot')) {
    $user_agent = 'bot';
} elseif(strpos($ua,'Mozilla') || strpos($ua,'Opera')) {
    $user_agent = 'gui_browser';
} elseif (strpos($ua,'Elinks') || strpos($ua,'w3m') || strpos($ua,'Lynx')) {
    $user_agent = 'text_browser';
} else {
    $user_agent = 'bot';
}


if(isset($_GET['domain_id'])) {
    $_SESSION['domain_id'] = $_GET['domain_id'];
} elseif (!$_SESSION['domain_id']) {
    $_SESSION['domain_id'] = '%';
}

$domain_id = $_SESSION['domain_id'];


$runtime = array(
    'path_prefix' => $path_prefix,
    'link_prefix' => $link_prefix,
    'user_agent'  => $user_agent,
    'domain_id'   => $domain_id,
    'utcdate'     => $utcdate
    );

Nexista_Flow::add('runtime',$runtime,false);


?>