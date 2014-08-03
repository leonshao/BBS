--
-- Author: leonshao
-- Date: 2014-07-03
-- Description: 投票选项表pre_forum_polloption中增加投票备注字段optionremark,
--              该字段的信息在投票过期后才展现
--
ALTER TABLE `pre_forum_polloption` ADD `optionremark` varchar(40) NOT NULL DEFAULT '';

UPDATE `ultrax`.`pre_common_member_profile_setting` SET `title` = '姓名' WHERE `pre_common_member_profile_setting`.`fieldid` = 'realname';

--
-- Author: leonshao
-- Date: 2014-07-10
-- Description: UC用户表pre_ucenter_members中增加两字段: 真实姓名realname, 手机mobile
--              用户输入真实姓名和手机号登录时查询此表作验证
--
ALTER TABLE pre_ucenter_members ADD (
	`realname` varchar(128) NOT NULL DEFAULT '',
	`mobile` varchar(128) NOT NULL DEFAULT '',
	UNIQUE KEY `realname` (`realname`, `mobile`)
);

--
-- Author: leonshao
-- Date: 2014-07-18
-- Description: UC用户表pre_ucenter_members和pre_common_member中用户名字段username长度改为32,
--
ALTER TABLE `pre_ucenter_members` SET `username` char(32) NOT NULL DEFAULT '';
ALTER TABLE `pre_common_member` SET `username` char(32) NOT NULL DEFAULT '';

--
-- Author: leonshao
-- Date: 2014-07-28
-- Description: 
--     1. 创建学院表pre_common_college和专业表pre_common_profession
--     2. 修改注册时的"居住地"字段名为"所在地域"
-- 
CREATE TABLE `pre_common_college` (
  `collegeid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `collegename` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (collegeid),
  UNIQUE KEY collegename (collegename)
) ENGINE=MyISAM;

CREATE TABLE `pre_common_profession` (
  `professionid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `professionname` char(64) NOT NULL DEFAULT '',
  `collegeid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (professionid),
  UNIQUE KEY professionname (professionname)
) ENGINE=MyISAM;

UPDATE `ultrax`.`pre_common_member_profile_setting` SET `title` = '所在地域' WHERE `pre_common_member_profile_setting`.`fieldid` = 'residecity';

INSERT INTO pre_common_college VALUES(1, '自动化学院');
INSERT INTO pre_common_college VALUES(2, '机电工程学院');
INSERT INTO pre_common_college VALUES(3, '轻工化工学院');
INSERT INTO pre_common_college VALUES(4, '信息工程学院');
INSERT INTO pre_common_college VALUES(5, '土木与交通工程学院');
INSERT INTO pre_common_college VALUES(6, '管理学院');
INSERT INTO pre_common_college VALUES(7, '计算机学院');
INSERT INTO pre_common_college VALUES(15, '材料与能源学院');
INSERT INTO pre_common_college VALUES(16, '环境科学与工程学院');
INSERT INTO pre_common_college VALUES(8, '外国语学院');
INSERT INTO pre_common_college VALUES(17, '应用数学学院'); 
INSERT INTO pre_common_college VALUES(9, '物理与光电工程学院');
INSERT INTO pre_common_college VALUES(10, '艺术设计学院');
INSERT INTO pre_common_college VALUES(11, '政法学院');
INSERT INTO pre_common_college VALUES(12, '建筑与城市规划学院');
INSERT INTO pre_common_college VALUES(13, '经济与贸易学院');
INSERT INTO pre_common_college VALUES(14, '商学院');

INSERT INTO pre_common_profession VALUES(1, '自动化（创新班）', 1);
INSERT INTO pre_common_profession VALUES(2, '自动化（卓越工程师班）', 1);
INSERT INTO pre_common_profession VALUES(3, '自动化', 1);
INSERT INTO pre_common_profession VALUES(4, '电气工程及其自动化(电气与电子技术方向）', 1);
INSERT INTO pre_common_profession VALUES(5, '电气工程及其自动化(电力系统自动化方向)', 1);
INSERT INTO pre_common_profession VALUES(6, '物联网工程', 1);
INSERT INTO pre_common_profession VALUES(7, '电子信息科学与技术', 1);
INSERT INTO pre_common_profession VALUES(8, '机械设计制造及其自动化（创新班）', 2);
INSERT INTO pre_common_profession VALUES(9, '机械设计制造及其自动化（卓越工程师班）', 2);
INSERT INTO pre_common_profession VALUES(10, '机械设计制造及其自动化（机械电子工程方向）', 2);
INSERT INTO pre_common_profession VALUES(11, '机械设计制造及其自动化（微电子制造装备及自动化方向）', 2);
INSERT INTO pre_common_profession VALUES(12, '车辆工程', 2);
INSERT INTO pre_common_profession VALUES(13, '工业工程', 2);
INSERT INTO pre_common_profession VALUES(14, '包装工程', 2);
INSERT INTO pre_common_profession VALUES(15, '数字媒体技术', 2);
INSERT INTO pre_common_profession VALUES(16, '化工与制药类(创新班)', 3);
INSERT INTO pre_common_profession VALUES(17, '化学工程与工艺（卓越工程师班）', 3);
INSERT INTO pre_common_profession VALUES(18, '化学工程与工艺', 3);
INSERT INTO pre_common_profession VALUES(19, '应用化学', 3);
INSERT INTO pre_common_profession VALUES(20, '食品科学与工程', 3);
INSERT INTO pre_common_profession VALUES(21, '制药工程', 3);
INSERT INTO pre_common_profession VALUES(22, '生物工程(生物化工、微生物工程方向)', 3);
INSERT INTO pre_common_profession VALUES(23, '信息工程（卓越工程师班）', 4);
INSERT INTO pre_common_profession VALUES(24, '', 4);
INSERT INTO pre_common_profession VALUES(25, '信息工程（电子信息工程方向）', 4);
INSERT INTO pre_common_profession VALUES(26, '信息工程（应用电子技术方向）', 4);
INSERT INTO pre_common_profession VALUES(27, '通信工程', 4);
INSERT INTO pre_common_profession VALUES(28, '测控技术与仪器（计算机测控技术方向）', 4);
INSERT INTO pre_common_profession VALUES(29, '测控技术与仪器（光机电一体化方向）', 4);
INSERT INTO pre_common_profession VALUES(30, '土木工程', 5);
INSERT INTO pre_common_profession VALUES(31, '道路桥梁与渡河工程', 5);
INSERT INTO pre_common_profession VALUES(32, '工程管理', 5);
INSERT INTO pre_common_profession VALUES(33, '给排水科学与工程', 5);
INSERT INTO pre_common_profession VALUES(34, '建筑环境与能源应用工程', 5);
INSERT INTO pre_common_profession VALUES(35, '交通运输', 5);
INSERT INTO pre_common_profession VALUES(36, '测绘工程', 5);
INSERT INTO pre_common_profession VALUES(37, '城市地下空间工程', 5);
INSERT INTO pre_common_profession VALUES(38, '管理科学(金融理财方向)', 6);
INSERT INTO pre_common_profession VALUES(39, '物流管理', 6);
INSERT INTO pre_common_profession VALUES(40, '信息管理与信息系统', 6);
INSERT INTO pre_common_profession VALUES(41, '电子商务', 6);
INSERT INTO pre_common_profession VALUES(42, '工商管理', 6);
INSERT INTO pre_common_profession VALUES(43, '市场营销', 6);
INSERT INTO pre_common_profession VALUES(44, '人力资源管理', 6);
INSERT INTO pre_common_profession VALUES(45, '财务管理', 6);
INSERT INTO pre_common_profession VALUES(46, '会计学', 6);
INSERT INTO pre_common_profession VALUES(47, '土地资源管理（国土资源与房地产开发方向）', 6);
INSERT INTO pre_common_profession VALUES(48, '旅游管理', 6);
INSERT INTO pre_common_profession VALUES(49, '软件工程（卓越工程师班）', 7);
INSERT INTO pre_common_profession VALUES(50, '计算机科学与技术', 7);
INSERT INTO pre_common_profession VALUES(51, '软件工程', 7);
INSERT INTO pre_common_profession VALUES(52, '网络工程', 7);
INSERT INTO pre_common_profession VALUES(53, '英语（翻译方向）', 8);
INSERT INTO pre_common_profession VALUES(54, '英语（科技方向）', 8);
INSERT INTO pre_common_profession VALUES(55, '商务英语', 8);
INSERT INTO pre_common_profession VALUES(56, '日语', 8);
INSERT INTO pre_common_profession VALUES(57, '电子科学与技术(卓越工程师班)', 9);
INSERT INTO pre_common_profession VALUES(58, '电子科学与技术', 9);
INSERT INTO pre_common_profession VALUES(59, '光电信息科学与工程', 9);
INSERT INTO pre_common_profession VALUES(60, '工业设计', 10);
INSERT INTO pre_common_profession VALUES(61, '产品设计', 10);
INSERT INTO pre_common_profession VALUES(62, '视觉传达设计', 10);
INSERT INTO pre_common_profession VALUES(63, '服装设计与工程', 10);
INSERT INTO pre_common_profession VALUES(64, '服装与服饰设计', 10);
INSERT INTO pre_common_profession VALUES(65, '服装与服饰设计（形象设计与服装表演方向）', 10);
INSERT INTO pre_common_profession VALUES(66, '环境设计', 10);
INSERT INTO pre_common_profession VALUES(67, '动画', 10);
INSERT INTO pre_common_profession VALUES(68, '数字媒体艺术', 10);
INSERT INTO pre_common_profession VALUES(69, '美术学', 10);
INSERT INTO pre_common_profession VALUES(70, '法学', 11);
INSERT INTO pre_common_profession VALUES(71, '社会工作', 11);
INSERT INTO pre_common_profession VALUES(72, '公共事业管理', 11);
INSERT INTO pre_common_profession VALUES(73, '建筑学', 12);
INSERT INTO pre_common_profession VALUES(74, '城乡规划', 12);
INSERT INTO pre_common_profession VALUES(75, '风景园林', 12);
INSERT INTO pre_common_profession VALUES(76, '金融工程', 13);
INSERT INTO pre_common_profession VALUES(77, '经济学', 13);
INSERT INTO pre_common_profession VALUES(78, '国际经济与贸易', 13);
INSERT INTO pre_common_profession VALUES(79, '会展经济与管理', 13);
INSERT INTO pre_common_profession VALUES(80, '投资学', 13);
INSERT INTO pre_common_profession VALUES(81, '电子商务（三年制专科）', 14);
INSERT INTO pre_common_profession VALUES(82, '市场营销（三年制专科）', 14);
INSERT INTO pre_common_profession VALUES(83, '国际经济与贸易（三年制专科）', 14);
INSERT INTO pre_common_profession VALUES(84, '工商企业管理（三年制专科）', 14);
INSERT INTO pre_common_profession VALUES(85, '商务英语（三年制专科）', 14);
INSERT INTO pre_common_profession VALUES(86, '材料成型及控制工程（卓越工程师班）', 15);
INSERT INTO pre_common_profession VALUES(87, '材料类（创新班）', 15);
INSERT INTO pre_common_profession VALUES(88, '材料成型及控制工程', 15);
INSERT INTO pre_common_profession VALUES(89, '金属材料工程（金属材料制备及模具方向）', 15);
INSERT INTO pre_common_profession VALUES(90, '高分子材料与工程', 15);
INSERT INTO pre_common_profession VALUES(91, '能源与动力工程（热电工程方向）', 15);
INSERT INTO pre_common_profession VALUES(92, '能源与动力工程（制冷与空调方向）', 15);
INSERT INTO pre_common_profession VALUES(93, '电子科学与技术（电子信息材料及元器件方向）', 15);
INSERT INTO pre_common_profession VALUES(94, '微电子科学与工程', 15);
INSERT INTO pre_common_profession VALUES(95, '环境工程', 16);
INSERT INTO pre_common_profession VALUES(96, '环境科学', 16);
INSERT INTO pre_common_profession VALUES(97, '生物工程（环境生物技术方向）', 16);
INSERT INTO pre_common_profession VALUES(98, '安全工程', 16);
INSERT INTO pre_common_profession VALUES(99, '信息与计算科学（信息计算方向）', 17);
INSERT INTO pre_common_profession VALUES(100, '信息与计算科学（信息安全方向）', 17);
INSERT INTO pre_common_profession VALUES(101, '应用统计学', 17);