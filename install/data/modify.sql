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
-- Description: UC用户表pre_ucenter_members中用户名字段username长度改为32,
--              
--
ALTER TABLE `pre_ucenter_members` SET `username` char(32) NOT NULL DEFAULT '';
ALTER TABLE `pre_common_member` SET `username` char(32) NOT NULL DEFAULT '';