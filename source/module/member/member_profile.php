<?php
/**
 *  Date: 2014-07-23
 *  Author: leonshao
 *  Description: CGI to get choices to selected fields in register page, return the data
 *  			 in json format
 */

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

define('NOROBOT', TRUE);

global $_G;

$callback = 'callback';
$result = 0;

// 获取用户各字段配置
if(empty($_G['cache']['profilesetting'])) {
	loadcache('profilesetting');
}

$data = array();
$all_fields = $_G['cache']['profilesetting'];
foreach ($all_fields as $field) {
	if($field['formtype']=='select' && $field['showinregister']) {
		$choices = explode("\n", $field['choices']);
		
		// json_encode会输出\u编码, 需要urlencode转成中文输出
		$choices_encoded = array();
		foreach ($choices as $choice) {
			array_push($choices_encoded, urlencode($choice));
		}
		
		$field_data = array('title' => urlencode($field['title']), 
							'choices' => $choices_encoded);
		array_push($data, $field_data);
	}
}

if(!count($data)) {
	$result = 1;
	$data = "没有学院, 专业等配置信息!";
}

$arr = array('result' => $result, 'data' => $data);
echo urldecode($callback.'('.json_encode($arr).')');
?>