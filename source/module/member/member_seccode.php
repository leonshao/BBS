<?php
/**
 *  Date: 2014-07-21
 *  Author: leonshao
 *  Description: CGI to get secure code and image data by json format.
 */

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

define('NOROBOT', TRUE);

if(!in_array($_GET['action'], array('seccode'))) {
	showmessage('undefined_action');
}

global $_G;
$sechash = !isset($sechash) ? 'S'.($_G['inajax'] ? 'A' : '').$_G['sid'] : $sechash.random(3);
$idhash = 'c'.$sechash;

$callback = 'callback';
$result = 0;

$rand = random(5, 1);
$data = array('idhash'	=> $idhash,
			  'width' 	=> sprintf('%d', $_G['setting']['seccodedata']['width']),
			  'height'	=> sprintf('%d', $_G['setting']['seccodedata']['height']),
			  'src'		=> 'misc.php?mod=seccode&update='.$rand.'&idhash='.$idhash,
			  );
$arr = array('result' => $result, 'data_img' => $data);

echo $callback.'('.json_encode($arr).')';
?>