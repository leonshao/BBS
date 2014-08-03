<?php

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

class table_common_profession extends discuz_table
{
	public function __construct() {

		$this->_table = 'common_profession';
		$this->_pk    = 'professionid';

		parent::__construct();
	}

	public function fetch_all_professions() {
		return DB::fetch_all('SELECT * FROM %t ', array($this->_table));
	}

	public function fetch_by_id($id) {
		if(!empty($id)) {
			return DB::fetch_all('SELECT * FROM %t WHERE '.DB::field('professionid', $id), array($this->_table));
		}
		return array();
	}

	public function fetch_by_name($name) {
		if(!empty($name)) {
			return DB::fetch_all('SELECT * FROM %t WHERE '.DB::field('professionname', $name), array($this->_table));
		}
		return array();
	}
	
	public function fetch_by_collegeid($collegeid) {
		if(!empty($collegeid)) {
			return DB::fetch_all('SELECT * FROM %t WHERE '.DB::field('collegeid', $collegeid), array($this->_table));
		}
		return array();
	}
}
?>