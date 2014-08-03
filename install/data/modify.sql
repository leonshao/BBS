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
-- Description: UC�û���pre_ucenter_members��pre_common_member���û����ֶ�username���ȸ�Ϊ32,
--
ALTER TABLE `pre_ucenter_members` SET `username` char(32) NOT NULL DEFAULT '';
ALTER TABLE `pre_common_member` SET `username` char(32) NOT NULL DEFAULT '';

--
-- Author: leonshao
-- Date: 2014-07-28
-- Description: 
--     1. ����ѧԺ��pre_common_college��רҵ��pre_common_profession
--     2. �޸�ע��ʱ��"��ס��"�ֶ���Ϊ"���ڵ���"
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

UPDATE `ultrax`.`pre_common_member_profile_setting` SET `title` = '���ڵ���' WHERE `pre_common_member_profile_setting`.`fieldid` = 'residecity';

INSERT INTO pre_common_college VALUES(1, '�Զ���ѧԺ');
INSERT INTO pre_common_college VALUES(2, '���繤��ѧԺ');
INSERT INTO pre_common_college VALUES(3, '�Ṥ����ѧԺ');
INSERT INTO pre_common_college VALUES(4, '��Ϣ����ѧԺ');
INSERT INTO pre_common_college VALUES(5, '��ľ�뽻ͨ����ѧԺ');
INSERT INTO pre_common_college VALUES(6, '����ѧԺ');
INSERT INTO pre_common_college VALUES(7, '�����ѧԺ');
INSERT INTO pre_common_college VALUES(15, '��������ԴѧԺ');
INSERT INTO pre_common_college VALUES(16, '������ѧ�빤��ѧԺ');
INSERT INTO pre_common_college VALUES(8, '�����ѧԺ');
INSERT INTO pre_common_college VALUES(17, 'Ӧ����ѧѧԺ'); 
INSERT INTO pre_common_college VALUES(9, '�������繤��ѧԺ');
INSERT INTO pre_common_college VALUES(10, '�������ѧԺ');
INSERT INTO pre_common_college VALUES(11, '����ѧԺ');
INSERT INTO pre_common_college VALUES(12, '��������й滮ѧԺ');
INSERT INTO pre_common_college VALUES(13, '������ó��ѧԺ');
INSERT INTO pre_common_college VALUES(14, '��ѧԺ');

INSERT INTO pre_common_profession VALUES(1, '�Զ��������°ࣩ', 1);
INSERT INTO pre_common_profession VALUES(2, '�Զ�����׿Խ����ʦ�ࣩ', 1);
INSERT INTO pre_common_profession VALUES(3, '�Զ���', 1);
INSERT INTO pre_common_profession VALUES(4, '�������̼����Զ���(��������Ӽ�������', 1);
INSERT INTO pre_common_profession VALUES(5, '�������̼����Զ���(����ϵͳ�Զ�������)', 1);
INSERT INTO pre_common_profession VALUES(6, '����������', 1);
INSERT INTO pre_common_profession VALUES(7, '������Ϣ��ѧ�뼼��', 1);
INSERT INTO pre_common_profession VALUES(8, '��е������켰���Զ��������°ࣩ', 2);
INSERT INTO pre_common_profession VALUES(9, '��е������켰���Զ�����׿Խ����ʦ�ࣩ', 2);
INSERT INTO pre_common_profession VALUES(10, '��е������켰���Զ�������е���ӹ��̷���', 2);
INSERT INTO pre_common_profession VALUES(11, '��е������켰���Զ�����΢��������װ�����Զ�������', 2);
INSERT INTO pre_common_profession VALUES(12, '��������', 2);
INSERT INTO pre_common_profession VALUES(13, '��ҵ����', 2);
INSERT INTO pre_common_profession VALUES(14, '��װ����', 2);
INSERT INTO pre_common_profession VALUES(15, '����ý�弼��', 2);
INSERT INTO pre_common_profession VALUES(16, '��������ҩ��(���°�)', 3);
INSERT INTO pre_common_profession VALUES(17, '��ѧ�����빤�գ�׿Խ����ʦ�ࣩ', 3);
INSERT INTO pre_common_profession VALUES(18, '��ѧ�����빤��', 3);
INSERT INTO pre_common_profession VALUES(19, 'Ӧ�û�ѧ', 3);
INSERT INTO pre_common_profession VALUES(20, 'ʳƷ��ѧ�빤��', 3);
INSERT INTO pre_common_profession VALUES(21, '��ҩ����', 3);
INSERT INTO pre_common_profession VALUES(22, '���﹤��(���ﻯ����΢���﹤�̷���)', 3);
INSERT INTO pre_common_profession VALUES(23, '��Ϣ���̣�׿Խ����ʦ�ࣩ', 4);
INSERT INTO pre_common_profession VALUES(24, '', 4);
INSERT INTO pre_common_profession VALUES(25, '��Ϣ���̣�������Ϣ���̷���', 4);
INSERT INTO pre_common_profession VALUES(26, '��Ϣ���̣�Ӧ�õ��Ӽ�������', 4);
INSERT INTO pre_common_profession VALUES(27, 'ͨ�Ź���', 4);
INSERT INTO pre_common_profession VALUES(28, '��ؼ������������������ؼ�������', 4);
INSERT INTO pre_common_profession VALUES(29, '��ؼ����������������һ�廯����', 4);
INSERT INTO pre_common_profession VALUES(30, '��ľ����', 5);
INSERT INTO pre_common_profession VALUES(31, '��·������ɺӹ���', 5);
INSERT INTO pre_common_profession VALUES(32, '���̹���', 5);
INSERT INTO pre_common_profession VALUES(33, '����ˮ��ѧ�빤��', 5);
INSERT INTO pre_common_profession VALUES(34, '������������ԴӦ�ù���', 5);
INSERT INTO pre_common_profession VALUES(35, '��ͨ����', 5);
INSERT INTO pre_common_profession VALUES(36, '��湤��', 5);
INSERT INTO pre_common_profession VALUES(37, '���е��¿ռ乤��', 5);
INSERT INTO pre_common_profession VALUES(38, '�����ѧ(������Ʒ���)', 6);
INSERT INTO pre_common_profession VALUES(39, '��������', 6);
INSERT INTO pre_common_profession VALUES(40, '��Ϣ��������Ϣϵͳ', 6);
INSERT INTO pre_common_profession VALUES(41, '��������', 6);
INSERT INTO pre_common_profession VALUES(42, '���̹���', 6);
INSERT INTO pre_common_profession VALUES(43, '�г�Ӫ��', 6);
INSERT INTO pre_common_profession VALUES(44, '������Դ����', 6);
INSERT INTO pre_common_profession VALUES(45, '�������', 6);
INSERT INTO pre_common_profession VALUES(46, '���ѧ', 6);
INSERT INTO pre_common_profession VALUES(47, '������Դ����������Դ�뷿�ز���������', 6);
INSERT INTO pre_common_profession VALUES(48, '���ι���', 6);
INSERT INTO pre_common_profession VALUES(49, '������̣�׿Խ����ʦ�ࣩ', 7);
INSERT INTO pre_common_profession VALUES(50, '�������ѧ�뼼��', 7);
INSERT INTO pre_common_profession VALUES(51, '�������', 7);
INSERT INTO pre_common_profession VALUES(52, '���繤��', 7);
INSERT INTO pre_common_profession VALUES(53, 'Ӣ����뷽��', 8);
INSERT INTO pre_common_profession VALUES(54, 'Ӣ��Ƽ�����', 8);
INSERT INTO pre_common_profession VALUES(55, '����Ӣ��', 8);
INSERT INTO pre_common_profession VALUES(56, '����', 8);
INSERT INTO pre_common_profession VALUES(57, '���ӿ�ѧ�뼼��(׿Խ����ʦ��)', 9);
INSERT INTO pre_common_profession VALUES(58, '���ӿ�ѧ�뼼��', 9);
INSERT INTO pre_common_profession VALUES(59, '�����Ϣ��ѧ�빤��', 9);
INSERT INTO pre_common_profession VALUES(60, '��ҵ���', 10);
INSERT INTO pre_common_profession VALUES(61, '��Ʒ���', 10);
INSERT INTO pre_common_profession VALUES(62, '�Ӿ��������', 10);
INSERT INTO pre_common_profession VALUES(63, '��װ����빤��', 10);
INSERT INTO pre_common_profession VALUES(64, '��װ��������', 10);
INSERT INTO pre_common_profession VALUES(65, '��װ�������ƣ�����������װ���ݷ���', 10);
INSERT INTO pre_common_profession VALUES(66, '�������', 10);
INSERT INTO pre_common_profession VALUES(67, '����', 10);
INSERT INTO pre_common_profession VALUES(68, '����ý������', 10);
INSERT INTO pre_common_profession VALUES(69, '����ѧ', 10);
INSERT INTO pre_common_profession VALUES(70, '��ѧ', 11);
INSERT INTO pre_common_profession VALUES(71, '��Ṥ��', 11);
INSERT INTO pre_common_profession VALUES(72, '������ҵ����', 11);
INSERT INTO pre_common_profession VALUES(73, '����ѧ', 12);
INSERT INTO pre_common_profession VALUES(74, '����滮', 12);
INSERT INTO pre_common_profession VALUES(75, '�羰԰��', 12);
INSERT INTO pre_common_profession VALUES(76, '���ڹ���', 13);
INSERT INTO pre_common_profession VALUES(77, '����ѧ', 13);
INSERT INTO pre_common_profession VALUES(78, '���ʾ�����ó��', 13);
INSERT INTO pre_common_profession VALUES(79, '��չ���������', 13);
INSERT INTO pre_common_profession VALUES(80, 'Ͷ��ѧ', 13);
INSERT INTO pre_common_profession VALUES(81, '��������������ר�ƣ�', 14);
INSERT INTO pre_common_profession VALUES(82, '�г�Ӫ����������ר�ƣ�', 14);
INSERT INTO pre_common_profession VALUES(83, '���ʾ�����ó�ף�������ר�ƣ�', 14);
INSERT INTO pre_common_profession VALUES(84, '������ҵ����������ר�ƣ�', 14);
INSERT INTO pre_common_profession VALUES(85, '����Ӣ�������ר�ƣ�', 14);
INSERT INTO pre_common_profession VALUES(86, '���ϳ��ͼ����ƹ��̣�׿Խ����ʦ�ࣩ', 15);
INSERT INTO pre_common_profession VALUES(87, '�����ࣨ���°ࣩ', 15);
INSERT INTO pre_common_profession VALUES(88, '���ϳ��ͼ����ƹ���', 15);
INSERT INTO pre_common_profession VALUES(89, '�������Ϲ��̣����������Ʊ���ģ�߷���', 15);
INSERT INTO pre_common_profession VALUES(90, '�߷��Ӳ����빤��', 15);
INSERT INTO pre_common_profession VALUES(91, '��Դ�붯�����̣��ȵ繤�̷���', 15);
INSERT INTO pre_common_profession VALUES(92, '��Դ�붯�����̣�������յ�����', 15);
INSERT INTO pre_common_profession VALUES(93, '���ӿ�ѧ�뼼����������Ϣ���ϼ�Ԫ��������', 15);
INSERT INTO pre_common_profession VALUES(94, '΢���ӿ�ѧ�빤��', 15);
INSERT INTO pre_common_profession VALUES(95, '��������', 16);
INSERT INTO pre_common_profession VALUES(96, '������ѧ', 16);
INSERT INTO pre_common_profession VALUES(97, '���﹤�̣��������＼������', 16);
INSERT INTO pre_common_profession VALUES(98, '��ȫ����', 16);
INSERT INTO pre_common_profession VALUES(99, '��Ϣ������ѧ����Ϣ���㷽��', 17);
INSERT INTO pre_common_profession VALUES(100, '��Ϣ������ѧ����Ϣ��ȫ����', 17);
INSERT INTO pre_common_profession VALUES(101, 'Ӧ��ͳ��ѧ', 17);