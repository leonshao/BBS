--
-- Author: leonshao
-- Date: 2014-07-03
-- Description: ͶƱѡ���pre_forum_polloption������ͶƱ��ע�ֶ�optionremark,
--              ���ֶε���Ϣ��ͶƱ���ں��չ��
--
ALTER TABLE `pre_forum_polloption` ADD `optionremark` varchar(40) NOT NULL DEFAULT '';


UPDATE `ultrax`.`pre_common_member_profile_setting` SET `title` = '����' WHERE `pre_common_member_profile_setting`.`fieldid` = 'realname';

--
-- Author: leonshao
-- Date: 2014-07-10
-- Description: UC�û���pre_ucenter_members���������ֶ�: ��ʵ����realname, �ֻ�mobile
--              �û�������ʵ�������ֻ��ŵ�¼ʱ��ѯ�˱�����֤
--
ALTER TABLE pre_ucenter_members ADD (
	`realname` varchar(128) NOT NULL DEFAULT '',
	`mobile` varchar(128) NOT NULL DEFAULT '',
	UNIQUE KEY `realname` (`realname`, `mobile`)
);

--
-- Author: leonshao
-- Date: 2014-07-18
-- Description: UC�û���pre_ucenter_members���û����ֶ�username���ȸ�Ϊ32,
--              
--
ALTER TABLE `pre_ucenter_members` SET `username` char(32) NOT NULL DEFAULT '';
ALTER TABLE `pre_common_member` SET `username` char(32) NOT NULL DEFAULT '';