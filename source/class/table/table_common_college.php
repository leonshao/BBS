<?php

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

class table_common_college extends discuz_table
{
	public function __construct() {
	
		$this->_table = 'common_college';
		$this->_pk    = 'collegeid';
	
		parent::__construct();
	}
	
	public function fetch_all_colleges() {
		return DB::fetch_all('SELECT * FROM %t ', array($this->_table));
	}
	
	public function fetch_by_id($id) {
		if(!empty($id)) {
			return DB::fetch_all('SELECT * FROM %t WHERE '.DB::field('collegeid', $id), array($this->_table));
		}
		return array();
	}
	
	
	public function fetch_by_name($name) {
		if(!empty($name)) {
			return DB::fetch_all('SELECT * FROM %t WHERE '.DB::field('collegename', $name), array($this->_table));
		}
		return array();
	}
}
?>