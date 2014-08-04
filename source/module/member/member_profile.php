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

$data = get_return_data();
echo urldecode($callback.'('.json_encode($data).')');


// 获取地域, 学历, 学院专业等可供选择的数据. 如果出错, 返回错误提示
function get_return_data() {
	$district_data = get_district();
	if ($district_data === false) {
		$return_data['result'] = -1;
		$return_data['msg'] = urlencode("没有地域信息可供选择");
		return $return_data;
	}
	
	$education_data = get_education();
	if ($education_data === false) {
		$return_data['result'] = -2;
		$return_data['msg'] = urlencode("没有学历信息可供选择, 或者学历信息格式不正确");
		return $return_data;
	}
	
	$college_data = get_college_and_profession();
	if ($college_data === false) {
		$return_data['result'] = -3;
		$return_data['msg'] = urlencode("没有学院专业信息可供选择");
		return $return_data;
	}
	
	$return_data['result'] = 0;
	$return_data['data'] = array('district_data' 	=> $district_data,
								 'education_data'	=> $education_data,
								 'college_data'		=> $college_data);
	return $return_data;
}


// 获取性别选项
function get_gender() {
}

// 获取地域
function get_district() {
	$upid = 291;	// 深圳市
	$result = C::t('common_district')->fetch_all_by_upid($upid, 'displayorder', 'ASC');
	if (!count($result))
		return false;
	
	$title = '所在地域';
	$city = '深圳市';
	$district = '区';
	$district_array = array();
	foreach ($result as $value) {
		array_push($district_array, urlencode($value['name']));
	}
	
	$district_data['title'] 	= urlencode($title);
	$district_data['city'] 		= urlencode($city);
	$district_data['district']	= $district_array;
	return $district_data;
}

// 获取学院和专业
function get_college_and_profession() {
	$colleges = C::t('common_college')->fetch_all_colleges();
	if (!count($colleges))
		return false;
	
	$title ='学院专业';
	$college_array = array();
	$table_obj = C::t('common_profession');
	foreach ($colleges as $college) {
		$data['college'] = urlencode($college['collegename']);
		
		// 从学院id获取专业
		$professions = $table_obj->fetch_by_collegeid($college['collegeid']);
		$professions_array = array();
		foreach ($professions as $profession) {
			array_push($professions_array, urlencode($profession['professionname']));
		}
		$data['professions'] = $professions_array;
		array_push($college_array, $data);
	}
	
	return $college_array;
}

// 获取学历
function get_education() {
	global $_G;

	// 学历字段的存储格式如下, 需要用explode函数分割各值
	// 博士\n硕士\n本科\n专科\n中学\n小学\n其它
	$choices = $_G['cache']['profilesetting']['education']['choices'];
	if (!count($choices)) {
		return false;
	}
	
	$values = explode("\n", $choices);
	if (!count($values)) {
		return false;
	}
	
	$education_array = array();
	foreach ($values as $value) {
		array_push($education_array, urlencode($value));
	}
	
	$title = '学历';
	$education_data['title']		= urlencode($title);
	$education_data['education']	= $education_array;
	
	return $education_data;
}

// 从官网获取所有学院的专业, 并生成sql语句
function crawl_professions() {
	$profession_data = array ();
	$sql_profession = array ();
	$profession_id = 1;
	for($i = 1; $i != 18; ++ $i) {
		$url = "http://zsb.gdut.edu.cn/base/major!majorlist.action?academyId=$i";
		$handle = fopen ( $url, "r" );
		if ($handle) {
			$content = stream_get_contents ( $handle, 1024 * 1024 );
			$profession_array = json_decode ( $content, true );
			$professions = array ();
			foreach ( $profession_array as $profession ) {
				
				array_push ( $professions, urlencode ( $profession ['name'] ) );
				$profession_name = urlencode ( $profession ['name'] );
				$sql_exp = "INSERT INTO pre_common_profession VALUES($profession_id, '$profession_name', $i);";
				echo urldecode ( $sql_exp . "</br>" );
				++ $profession_id;
			}
		}
		$profession_data ["$i"] = $professions;
	}
}

?>