/*
Navicat MySQL Data Transfer

Source Server         : localhost_3308
Source Server Version : 50559
Source Host           : localhost:3308
Source Database       : study

Target Server Type    : MYSQL
Target Server Version : 50559
File Encoding         : 65001

Date: 2021-06-15 12:15:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for agreerecord
-- ----------------------------
DROP TABLE IF EXISTS `agreerecord`;
CREATE TABLE `agreerecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `targetid` varchar(500) DEFAULT NULL,
  `commentator` varchar(500) DEFAULT NULL,
  `typename` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agreerecord
-- ----------------------------
INSERT INTO `agreerecord` VALUES ('8', '5', '2020042201', 'xinxi');
INSERT INTO `agreerecord` VALUES ('9', '10', '2020042201', 'xinxi');
INSERT INTO `agreerecord` VALUES ('10', '3', '13397991899', 'xinxi');
INSERT INTO `agreerecord` VALUES ('11', '4', '13677550732', 'xinxi');
INSERT INTO `agreerecord` VALUES ('12', '11', '13677550732', 'xinxi');
INSERT INTO `agreerecord` VALUES ('13', '4', '13677550733', 'xinxi');

-- ----------------------------
-- Table structure for billrecord
-- ----------------------------
DROP TABLE IF EXISTS `billrecord`;
CREATE TABLE `billrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(500) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `fee` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `xtype` int(11) DEFAULT NULL,
  `operdes` varchar(500) DEFAULT NULL,
  `zyid` int(11) DEFAULT NULL,
  `zytitle` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of billrecord
-- ----------------------------
INSERT INTO `billrecord` VALUES ('1', '13397991899', '刘晓庆', '0', '2020-12-28 12:54:33', '2', '视频扣款', '2', '计算机学习');
INSERT INTO `billrecord` VALUES ('2', '13677550732', '小马', '0', '2021-03-10 01:44:53', '2', '视频扣款', '1', '高级计算机');
INSERT INTO `billrecord` VALUES ('3', '13677550732', '小马', '0', '2021-03-11 22:53:00', '2', '视频扣款', '1', '高级计算机');
INSERT INTO `billrecord` VALUES ('4', '13677550732', '小马', '0', '2021-03-12 19:36:34', '2', '视频扣款', '1', '区块链概念');
INSERT INTO `billrecord` VALUES ('5', '13677550732', '小马', '0', '2021-03-12 19:37:00', '2', '视频扣款', '2', '人工智能基础');
INSERT INTO `billrecord` VALUES ('6', '13677550732', '小马', '0', '2021-03-12 19:40:00', '2', '视频扣款', '2', '人工智能基础');
INSERT INTO `billrecord` VALUES ('7', '13677550732', '小马', '0', '2021-03-12 19:40:08', '2', '视频扣款', '8', '金融');
INSERT INTO `billrecord` VALUES ('8', '13677550732', '小马', '0', '2021-03-12 19:40:20', '2', '视频扣款', '8', '金融');
INSERT INTO `billrecord` VALUES ('9', '13677550732', '小马', '0', '2021-03-12 21:00:57', '2', '视频扣款', '8', '金融');
INSERT INTO `billrecord` VALUES ('10', '13677550732', '小马', '0', '2021-03-22 15:43:11', '2', '视频扣款', '2', '人工智能基础');
INSERT INTO `billrecord` VALUES ('11', '13677550732', '小马', '0', '2021-03-22 15:43:19', '2', '视频扣款', '8', '金融');
INSERT INTO `billrecord` VALUES ('12', '13677550732', '小马', '0', '2021-03-22 15:48:09', '2', '视频扣款', '8', '金融');
INSERT INTO `billrecord` VALUES ('13', '13677550732', '小马', '0', '2021-03-31 20:58:57', '2', '视频扣款', '8', '金融');
INSERT INTO `billrecord` VALUES ('14', '13677550732', '小马', '0', '2021-03-31 21:11:35', '2', '视频扣款', '8', '金融');
INSERT INTO `billrecord` VALUES ('15', '13677550732', '小马', '0', '2021-05-17 14:55:35', '2', '视频扣款', '8', '金融');
INSERT INTO `billrecord` VALUES ('16', '13677550732', '小马', '0', '2021-05-17 14:58:43', '2', '视频扣款', '5', '数学对科技的影响');
INSERT INTO `billrecord` VALUES ('17', '13677550732', '小马', '0', '2021-05-17 14:58:53', '2', '视频扣款', '5', '数学对科技的影响');
INSERT INTO `billrecord` VALUES ('18', '13677550732', '小马', '0', '2021-05-17 15:35:27', '2', '视频扣款', '8', '金融');
INSERT INTO `billrecord` VALUES ('19', '13677550732', '小马', '0', '2021-05-17 16:31:52', '2', '视频扣款', '2', '人工智能基础');
INSERT INTO `billrecord` VALUES ('20', '13677550732', '小马', '0', '2021-05-17 16:32:07', '2', '视频扣款', '10', '云计算');
INSERT INTO `billrecord` VALUES ('21', '13677550732', '小马', '0', '2021-05-17 16:32:26', '2', '视频扣款', '8', '金融');
INSERT INTO `billrecord` VALUES ('22', '13677550732', '小马', '1', '2021-05-17 17:25:12', '2', '视频扣款', '11', '收费视频-浪潮之巅');
INSERT INTO `billrecord` VALUES ('23', '13677550732', '小马', '0', '2021-05-17 17:27:30', '2', '视频扣款', '11', '收费视频-浪潮之巅');
INSERT INTO `billrecord` VALUES ('24', '13677550732', '小马', '0', '2021-05-17 17:27:40', '2', '视频扣款', '2', '人工智能基础');
INSERT INTO `billrecord` VALUES ('25', '13677550732', '小马', '0', '2021-05-17 17:27:52', '2', '视频扣款', '8', '金融');
INSERT INTO `billrecord` VALUES ('26', '13677550732', '小马', '0', '2021-05-17 17:28:21', '2', '视频扣款', '11', '收费视频-浪潮之巅');
INSERT INTO `billrecord` VALUES ('27', '13677550732', '小马', '0', '2021-05-17 17:29:55', '2', '视频扣款', '11', '收费视频-浪潮之巅');
INSERT INTO `billrecord` VALUES ('28', '13677550732', '小马', '0', '2021-05-17 17:30:18', '2', '视频扣款', '11', '收费视频-浪潮之巅');
INSERT INTO `billrecord` VALUES ('29', '13677550732', '小马', '0', '2021-05-17 17:30:48', '2', '视频扣款', '11', '收费视频-浪潮之巅');
INSERT INTO `billrecord` VALUES ('30', '13677550732', '小马', '0', '2021-05-17 17:34:00', '2', '视频扣款', '12', '收费测试2-浪潮之巅');
INSERT INTO `billrecord` VALUES ('31', '13677550733', '小宋', '0', '2021-05-17 17:35:50', '2', '视频扣款', '12', '收费测试2-浪潮之巅');
INSERT INTO `billrecord` VALUES ('32', '13677550733', '小宋', '0', '2021-05-17 17:35:54', '2', '视频扣款', '11', '收费视频-浪潮之巅');
INSERT INTO `billrecord` VALUES ('33', '13677550733', '小宋', '0', '2021-05-17 17:37:26', '2', '视频扣款', '12', '收费测试2-浪潮之巅');
INSERT INTO `billrecord` VALUES ('34', '13677550733', '小宋', '0', '2021-05-17 17:48:27', '2', '视频扣款', '4', '大数据平台');
INSERT INTO `billrecord` VALUES ('35', '13677550733', '小宋', '0', '2021-05-17 17:48:34', '2', '视频扣款', '2', '人工智能基础');
INSERT INTO `billrecord` VALUES ('36', '13677550733', '小宋', '0', '2021-05-17 19:49:04', '2', '视频扣款', '8', '金融');
INSERT INTO `billrecord` VALUES ('37', '13677550733', '小宋', '0', '2021-05-17 20:27:21', '2', '视频扣款', '2', '人工智能基础');
INSERT INTO `billrecord` VALUES ('38', '13677550733', '小宋', '0', '2021-05-17 20:27:27', '2', '视频扣款', '8', '金融');
INSERT INTO `billrecord` VALUES ('39', '13677550733', '小宋', '0', '2021-05-17 20:45:24', '2', '视频扣款', '4', '大数据平台');
INSERT INTO `billrecord` VALUES ('40', '13677550733', '小宋', '0', '2021-05-17 20:45:38', '2', '视频扣款', '8', '金融');
INSERT INTO `billrecord` VALUES ('41', '13677550733', '小宋', '0', '2021-05-18 11:32:29', '2', '视频扣款', '8', '金融');
INSERT INTO `billrecord` VALUES ('42', '13677550733', '小宋', '0', '2021-05-18 15:33:51', '2', '视频扣款', '8', '金融');

-- ----------------------------
-- Table structure for ceshiti
-- ----------------------------
DROP TABLE IF EXISTS `ceshiti`;
CREATE TABLE `ceshiti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choicea` varchar(255) DEFAULT NULL,
  `choiceb` varchar(255) DEFAULT NULL,
  `choicec` varchar(255) DEFAULT NULL,
  `choiced` varchar(255) DEFAULT NULL,
  `daan` varchar(255) DEFAULT NULL,
  `kemu` varchar(255) DEFAULT NULL,
  `kmid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `difffact` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ceshiti
-- ----------------------------
INSERT INTO `ceshiti` VALUES ('1', 'Automatic Intelligence', 'Artifical Intelligence', 'Automatice Information', 'Artifical Information', 'B', '人工智能', '1', 'AI的英文缩写', '0.5');
INSERT INTO `ceshiti` VALUES ('2', '《中国区块链技术和应用发展白皮书（2016）》', '《软件和信息技术服务业发展规划（2016-2020年）》', '《国务院关于印发“十三五”国家信息化规划的通知》', '《2018中国区块链产业白皮书》', 'A', '区块链', '3', '2016年，工信部发布', '0.5');
INSERT INTO `ceshiti` VALUES ('3', '人工智能', '区块链', '云计算', '5G', 'D', '区块链', '3', '下列不属于新技术基础设施的是', '0.5');
INSERT INTO `ceshiti` VALUES ('4', '不变', '减少', '增加', '上下波动', 'C', '金融', '4', '中央银行增加黄金、外汇储备，货币供应量', '0.5');
INSERT INTO `ceshiti` VALUES ('5', '永真式', '包孕式', '空子句', '永假式', 'C', '人工智能', '1', '反演归结证明定理时，若当前归结式是时，则定理得证', '0.5');
INSERT INTO `ceshiti` VALUES ('6', '正向推理', '反向推理', '双向推理', '单向推理', 'A', '人工智能', '1', '从已知事实出发，通过规则库求得结论的产生式系统的推论方式是', '0.5');
INSERT INTO `ceshiti` VALUES ('7', '大规模存储与计算', '数据分析处理', '智能化', '以上三个选项都是', 'D', '大数据', '2', '大数据应用需依托的新技术有', '0.5');
INSERT INTO `ceshiti` VALUES ('8', '最一般合一', '最一般替换', '最一般谓词', '基替换', 'A', '人工智能', '1', 'MGU', '0.5');
INSERT INTO `ceshiti` VALUES ('9', '明斯基', '扎德', '图灵', '冯·诺依曼', 'C', '人工智能', '1', '人工智能的含义最早一位科学家于1950年提出，并且同时提出一个机器智能的测试模型，请问这个科学家是', '0.5');
INSERT INTO `ceshiti` VALUES ('10', '符号主义', '机会主义', '行为主义', '连接主义', 'B', '人工智能', '1', '不属于人工智能学派的', '0.5');
INSERT INTO `ceshiti` VALUES ('11', 'A.It doesn\'t matte', '.It\'s a pleasure', 'You\'re welcome', '.Don\'t say\"Sorry\" to me', 'A', '英语', '5', 'Someone say \"Sorry\" to you,you can answer\"_____\"', '0.5');
INSERT INTO `ceshiti` VALUES ('12', '专家系统', '机器学习', '神经网络', '模式识别', 'B', '人工智能', '1', '要想让机器具有智能，必须让机器具有知识。因此，在人工智能中有一个研究领域，主要研究计算机如何自动获取知识和技能，实现自我完善，这门研究分支学科叫。', '0.5');
INSERT INTO `ceshiti` VALUES ('13', '统计分析和数据挖掘', '任意查询和分析', '图形化展示', '企业报表', 'C', '大数据', '2', '下列哪一项不是大数据提供的用户交互方式:', '0.5');
INSERT INTO `ceshiti` VALUES ('14', '蓝牙', '云计算', '博弈论', 'WIFI', 'B', '大数据', '2', '与大数据密切相关的技术是', '0.5');
INSERT INTO `ceshiti` VALUES ('15', '数据很大', '很有价值', '构成简单', '时效性低', 'A', '人工智能', '1', '大数据作为一种数据集合，它的含义是', '0.5');
INSERT INTO `ceshiti` VALUES ('16', '互联网', '自动化', '云计算', '人机交互', 'A', '人工智能', '1', '20世纪中后期至今的媒体革命，以___的出现为标志', '0.5');
INSERT INTO `ceshiti` VALUES ('17', '2019年10月24日', '2018年10月24日', '2017年10月4日', '2018年10月4日', 'A', '区块链', '3', '中共中央政治局就区块链技术发展现状和趋势进行第十八次集体学习的时间是', '0.5');
INSERT INTO `ceshiti` VALUES ('18', '去中心化', '可自由篡改', '访问控制权', '不可篡改性', 'C', '区块链', '3', '关于区块链在数据共享方面的优势，下列表述不正确的是', '0.5');
INSERT INTO `ceshiti` VALUES ('19', '2008', '2009', '2010', '2011', 'B', '区块链', '3', '区块链第一个区块诞生的时间是', '0.5');
INSERT INTO `ceshiti` VALUES ('20', '2015', '2017', '2018', '2020', 'D', '区块链', '3', '区块链纳入“新基建”的时间是', '0.5');
INSERT INTO `ceshiti` VALUES ('21', 'M1，M2，M3', 'M1，M2', 'M0，M1', 'M3', 'C', '金融', '4', '我国央行首要调控的货币是', '0.5');
INSERT INTO `ceshiti` VALUES ('22', '国民收入', '工资收入', '名义收入', '恒久性收入', 'D', '金融', '4', '弗里德曼的货币需求函数中的Y表示', '0.5');
INSERT INTO `ceshiti` VALUES ('23', '制度现象', '经济现象', '心理现象', '社会现象', 'B', '金融', '4', '通货膨胀首先是一种', '0.5');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belongid` varchar(255) DEFAULT NULL,
  `commentcontent` varchar(255) DEFAULT NULL,
  `commentren` varchar(255) DEFAULT NULL,
  `commenttime` datetime DEFAULT NULL,
  `istopic` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `topicid` int(11) NOT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '6', '12344444444444444', '20201117001', '2020-11-17 11:33:04', '1', '/upload/temp/12345.jpg', '0', 'xinxi');
INSERT INTO `comment` VALUES ('2', '3', '123444444444444444', '13397991899', '2020-12-28 12:56:05', '1', '/upload/nopic.jpg', '0', 'xinxi');
INSERT INTO `comment` VALUES ('3', '7', '主旨清晰，学到了很多', '13677550732', '2021-03-22 15:39:26', '1', '/upload/nopic.jpg', '0', 'xinxi');
INSERT INTO `comment` VALUES ('4', '4', 'abc', '13677550732', '2021-03-31 20:37:55', '1', '/upload/nopic.jpg', '0', 'xinxi');
INSERT INTO `comment` VALUES ('5', '4', 'bcd', '13677550732', '2021-03-31 20:38:03', '1', '/upload/nopic.jpg', '0', 'xinxi');
INSERT INTO `comment` VALUES ('6', '4', '123', '13677550732', '2021-03-31 20:59:55', '1', '/upload/nopic.jpg', '0', 'xinxi');

-- ----------------------------
-- Table structure for courseware
-- ----------------------------
DROP TABLE IF EXISTS `courseware`;
CREATE TABLE `courseware` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `tupian` varchar(500) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `typename` varchar(500) DEFAULT NULL,
  `clickout` int(11) DEFAULT NULL,
  `dwcount` int(11) DEFAULT NULL,
  `pubren` varchar(500) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `fileurl` varchar(500) DEFAULT NULL,
  `des` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseware
-- ----------------------------
INSERT INTO `courseware` VALUES ('1', '计算机基础', '/upload/temp/u=2627079558,2486317762&fm=15&gp=0.jpg', '1', '人工智能', '25', '8', 'admin', '2020-11-17 08:55:09', '/upload/temp/测试下载包.zip', '<p>\r\n	123444444444444444444\r\n</p>');
INSERT INTO `courseware` VALUES ('2', '云计算', '/upload/temp/u=3858737616,1120839210&fm=26&gp=0.jpg', '2', '大数据', '39', '0', 'admin', '2020-11-17 08:55:09', '/upload/temp/t3.zip', '<p>\r\n	1234444444444444444444\r\n</p>');
INSERT INTO `courseware` VALUES ('3', '数据云', '/upload/temp/u=2637501238,494972682&fm=26&gp=0.jpg', '2', '大数据', '7', '1', 'admin', '2020-11-17 08:55:09', '/upload/temp/测试下载包.zip', '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;font-size:16px;line-height:24px;color:#333333;text-align:justify;font-family:arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<span class=\"bjh-p\">商场如战场。意外是商场竞争的常态，只是这次意外来得有点大。2019年底在武汉爆发的新冠病毒肺炎疫情已经蔓延到全国，由于疫情的强传染性，全国多数地区开始严控人员流动和聚集，这使得全国商业基本按下了“暂停键”，平时熙熙攘攘的商场被调整为“静音模式”。</span> \r\n</p>\r\n<p style=\"margin-top:22px;margin-bottom:0px;padding:0px;font-size:16px;line-height:24px;color:#333333;text-align:justify;font-family:arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<span class=\"bjh-p\">作为国内最大的家居综合服务零售商，红星美凯龙也难逃疫情带来的冲击，商户没法开业，红星美凯龙的收入来源自然就缺乏保障。但作为行业领袖，在危难时刻，如何行事，对于行业内其他机构，具有风向标的效果。同样，作为和所有人一样的市场竞争者，是否能在危机中，锤炼自身，并获得在下一轮竞争中的新优势，也是对红星美凯龙的考验。</span> \r\n</p>\r\n<p style=\"margin-top:22px;margin-bottom:0px;padding:0px;font-size:16px;line-height:24px;color:#333333;text-align:justify;font-family:arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<span class=\"bjh-p\"><span class=\"bjh-strong\" style=\"font-size:18px;font-weight:700;\">应急：能力越大 责任越大</span></span> \r\n</p>\r\n<p style=\"margin-top:22px;margin-bottom:0px;padding:0px;font-size:16px;line-height:24px;color:#333333;text-align:justify;font-family:arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<span class=\"bjh-p\">在危机时刻，对多数人来说，最重要的是活下来。在商场，在危机时刻，活下来的最重要基础是现金流。此次疫情对中小商户最大的考验也就是现金流。商场关门，商户直接带来的影响就是：收入为零，但租金、员工工资、社保、银行贷款利息等大头支出仍要支付。如果没有充足的现金流储备，中小商户将陷入困境，甚至倒闭。</span> \r\n</p>\r\n<p style=\"margin-top:22px;margin-bottom:0px;padding:0px;font-size:16px;line-height:24px;color:#333333;text-align:justify;font-family:arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<span class=\"bjh-p\">危难时刻，红星美凯龙发挥家居行业的龙头地位，提出了“1+1+1行业自救模式倡议”，即：卖场免一个月租金+工厂提供一个月的薪水+经销商自己再扛一个月。</span> \r\n</p>\r\n<p style=\"margin-top:22px;margin-bottom:0px;padding:0px;font-size:16px;line-height:24px;color:#333333;text-align:justify;font-family:arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<span class=\"bjh-p\">1月29日，红星美凯龙率先提出免除全国82家自营商场商户一个月的租金及管理费。据计算，仅此一项，红星美凯龙就让利近6亿元。</span> \r\n</p>\r\n<div class=\"img-container\" style=\"margin-top:30px;font-family:arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<img class=\"normal\" width=\"495px\" data-loadfunc=\"0\" src=\"https://pics0.baidu.com/feed/30adcbef76094b366f8f2060d3b948df8c109d9d.jpeg?token=ddf9b694f00c3a71b49c9cde5d7a0ffe&amp;s=F90AB0540E309CCE4A7736930300D089\" data-loaded=\"0\" style=\"display:block;margin:0px auto;\" /> \r\n</div>\r\n<p style=\"margin-top:26px;margin-bottom:0px;padding:0px;font-size:16px;line-height:24px;color:#333333;text-align:justify;font-family:arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<span class=\"bjh-p\">同时，红星美凯龙还积极和委管商场所有人和联营机构联系，商讨对租户免租事宜。据红星美凯龙副董事长兼董秘郭丙合，商讨非常顺利，多数委管所有人和联营机构也有望对商户免租一个月。</span> \r\n</p>\r\n<p style=\"margin-top:22px;margin-bottom:0px;padding:0px;font-size:16px;line-height:24px;color:#333333;text-align:justify;font-family:arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<span class=\"bjh-p\">在“1+1+1”行业自救模式的倡议下，整个行业将至少获得三个月的缓冲期，以备经销商们有充足的时间和空间将线下的获客能力转移到线上，以此最大程度的抵消此次疫情给行业所带来的冲击。</span> \r\n</p>\r\n<p style=\"margin-top:22px;margin-bottom:0px;padding:0px;font-size:16px;line-height:24px;color:#333333;text-align:justify;font-family:arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<span class=\"bjh-p\">据悉，在红星美凯龙“1+1+1行业自救模式倡议”下，全国各地大卖场和工厂纷纷的行动了起来。截至目前，已经有超过了45000个的经销商享受到了免一个月租金及免物业费的普惠政策。</span> \r\n</p>\r\n<p style=\"margin-top:22px;margin-bottom:0px;padding:0px;font-size:16px;line-height:24px;color:#333333;text-align:justify;font-family:arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<span class=\"bjh-p\">免租只是帮助经销商的一步。由于没有收入来源，经销商后续发展仍可能受困于资金缺乏。为此，红星美凯龙又主动对接金融机构，为全国经销商提供 “一揽子”金融支持，总计将能为全国经销商提供超40亿的金融助力。</span> \r\n</p>\r\n<p style=\"margin-top:22px;margin-bottom:0px;padding:0px;font-size:16px;line-height:24px;color:#333333;text-align:justify;font-family:arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<span class=\"bjh-p\">其中，中国农业银行上海分行和上海银行浦西分行与红星美凯龙旗下供应链金融平台合作，长期为红星美凯龙商户提供优惠利率的信用贷款支持，为商户提供小微经营贷款总授信额达25 亿元人民币。此外，红星美凯龙携手阿里巴巴、蚂蚁金服、网商银行为商家提供全方位的支持，包括线上销售支持、商家融资支持及利率优惠等，其中网商银行针对此次疫情专项提供15亿资金给予符合资格的商户流动资金支持。</span> \r\n</p>\r\n<p style=\"margin-top:22px;margin-bottom:0px;padding:0px;font-size:16px;line-height:24px;color:#333333;text-align:justify;font-family:arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<span class=\"bjh-p\">红星美凯龙集团执行总裁兼招商管理中心总经理朱家桂表示，这一套组合拳就是为了维护这个行业的生态，后面随着这几个措施落实推进，还会出台一系列的帮扶政策，能够协同好这个行业的上下游，共度难关。</span> \r\n</p>\r\n<p style=\"margin-top:22px;margin-bottom:0px;padding:0px;font-size:16px;line-height:24px;color:#333333;text-align:justify;font-family:arial;white-space:normal;background-color:#FFFFFF;\">\r\n	<span class=\"bjh-p\"><span class=\"bjh-strong\" style=\"font-size:18px;font-weight:700;\">谋远：播种待春来</span></span> \r\n</p>');
INSERT INTO `courseware` VALUES ('4', '混沌计算', '/upload/temp/u=1046690479,4139704673&fm=26&gp=0.jpg', '2', '大数据', '5', '0', 'admin', '2020-11-17 08:55:09', '/upload/temp/t3.zip', '1234444444444444444444444444444445555');
INSERT INTO `courseware` VALUES ('5', '人工智能', '/upload/temp/u=2898248360,3171115986&fm=15&gp=0.jpg', '1', '人工智能', '1', '0', 'admin', '2020-11-17 08:55:09', '/upload/temp/测试下载包 (1).zip', '1234444444444444444444444444444555');
INSERT INTO `courseware` VALUES ('6', '区块链', '/upload/temp/u=1273603838,3373309242&fm=15&gp=0.jpg', '3', '区块链', '1', '1', 'admin', '2020-11-17 08:55:09', '/upload/temp/测试下载包.zip', '123444444444444444444444444444533333');
INSERT INTO `courseware` VALUES ('7', 'AI', '/upload/temp/u=3496877662,4195779241&fm=15&gp=0.jpg', '3', '区块链', '8', '0', 'admin', '2020-11-17 08:55:09', '/upload/temp/测试下载包 (1).zip', '12344444444444444444444444');
INSERT INTO `courseware` VALUES ('8', '商务英语', '/upload/temp/u=3249912535,1318076148&fm=26&gp=0.jpg', '5', '英语', '3', '0', 'admin', '2020-11-17 08:55:09', '/upload/temp/测试下载包.zip', '123444444444444444444444444');
INSERT INTO `courseware` VALUES ('9', '数据交流', '/upload/temp/part-00229-4250.jpg', '2', '大数据', '1', '0', 'admin', '2020-11-17 08:55:09', '/upload/temp/测试下载包.zip', null);

-- ----------------------------
-- Table structure for dajuan
-- ----------------------------
DROP TABLE IF EXISTS `dajuan`;
CREATE TABLE `dajuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defen` int(11) DEFAULT NULL,
  `kemu` varchar(255) DEFAULT NULL,
  `shijuanid` int(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `testerid` int(11) DEFAULT NULL,
  `testername` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dajuan
-- ----------------------------
INSERT INTO `dajuan` VALUES ('1', '10', '英语', '7', '英语测试卷', '1', '4', '小宋', '2020-12-28 12:55:36');
INSERT INTO `dajuan` VALUES ('8', '10', '人工智能', '13', '人工智能1', '1', '5', '小马', '2021-05-17 14:54:47');
INSERT INTO `dajuan` VALUES ('9', '10', '人工智能', '13', '人工智能初级（一）', '1', '6', '小宋', '2021-05-17 18:13:33');
INSERT INTO `dajuan` VALUES ('10', '10', '人工智能', '13', '人工智能初级（一）', '1', '6', '小宋', '2021-05-17 20:28:08');
INSERT INTO `dajuan` VALUES ('11', '0', '人工智能', '14', '123', '1', '6', '小宋', '2021-05-17 20:51:17');
INSERT INTO `dajuan` VALUES ('12', '10', '人工智能', '13', '人工智能初级（一）', '1', '6', '小宋', '2021-05-18 15:35:05');

-- ----------------------------
-- Table structure for dajuanitem
-- ----------------------------
DROP TABLE IF EXISTS `dajuanitem`;
CREATE TABLE `dajuanitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daan` text,
  `dajuanid` int(11) DEFAULT NULL,
  `defen` int(11) DEFAULT NULL,
  `shijuanid` int(11) DEFAULT NULL,
  `tihao` int(11) DEFAULT NULL,
  `qtype` int(11) DEFAULT NULL,
  `fenshu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dajuanitem
-- ----------------------------
INSERT INTO `dajuanitem` VALUES ('1', 'B', '1', '0', '7', '1', '1', '0');
INSERT INTO `dajuanitem` VALUES ('2', 'A', '1', '0', '7', '2', '1', '0');
INSERT INTO `dajuanitem` VALUES ('3', 'A', '1', '0', '7', '3', '1', '0');
INSERT INTO `dajuanitem` VALUES ('4', 'A', '1', '0', '7', '4', '1', '0');
INSERT INTO `dajuanitem` VALUES ('5', 'A', '1', '0', '7', '5', '1', '0');
INSERT INTO `dajuanitem` VALUES ('6', null, '1', '0', '7', '6', '1', '0');
INSERT INTO `dajuanitem` VALUES ('7', 'C', '1', '0', '7', '7', '1', '0');
INSERT INTO `dajuanitem` VALUES ('8', 'C', '1', '0', '7', '8', '1', '0');
INSERT INTO `dajuanitem` VALUES ('9', 'C', '1', '0', '7', '9', '1', '0');
INSERT INTO `dajuanitem` VALUES ('10', 'C', '1', '0', '7', '10', '1', '0');
INSERT INTO `dajuanitem` VALUES ('11', 'C', '1', '0', '7', '11', '1', '0');
INSERT INTO `dajuanitem` VALUES ('12', '正确', '1', '5', '7', '9', '2', '0');
INSERT INTO `dajuanitem` VALUES ('13', '正确', '1', '0', '7', '10', '2', '0');
INSERT INTO `dajuanitem` VALUES ('14', '正确', '1', '5', '7', '11', '2', '0');
INSERT INTO `dajuanitem` VALUES ('15', '正确', '1', '0', '7', '12', '2', '0');
INSERT INTO `dajuanitem` VALUES ('16', '正确', '1', '0', '7', '13', '2', '0');
INSERT INTO `dajuanitem` VALUES ('17', '1234', '1', '0', '7', '4', '3', '0');
INSERT INTO `dajuanitem` VALUES ('18', '   12345                                    ', '1', '0', '7', '5', '4', '0');
INSERT INTO `dajuanitem` VALUES ('127', 'B', '8', '0', '13', '12', '1', '0');
INSERT INTO `dajuanitem` VALUES ('128', 'B', '8', '0', '13', '19', '1', '0');
INSERT INTO `dajuanitem` VALUES ('129', '正确', '8', '10', '13', '9', '2', '0');
INSERT INTO `dajuanitem` VALUES ('130', '连接主义', '8', '0', '13', '4', '3', '0');
INSERT INTO `dajuanitem` VALUES ('131', '                                人工智能      ', '8', '0', '13', '5', '4', '0');
INSERT INTO `dajuanitem` VALUES ('132', 'D', '9', '0', '13', '12', '1', '0');
INSERT INTO `dajuanitem` VALUES ('133', 'D', '9', '0', '13', '19', '1', '0');
INSERT INTO `dajuanitem` VALUES ('134', '正确', '9', '10', '13', '9', '2', '0');
INSERT INTO `dajuanitem` VALUES ('135', null, '9', '0', '13', '4', '3', '0');
INSERT INTO `dajuanitem` VALUES ('136', '                                       ', '9', '0', '13', '5', '4', '0');
INSERT INTO `dajuanitem` VALUES ('137', 'D', '10', '0', '13', '12', '1', '0');
INSERT INTO `dajuanitem` VALUES ('138', null, '10', '0', '13', '19', '1', '0');
INSERT INTO `dajuanitem` VALUES ('139', '正确', '10', '10', '13', '9', '2', '0');
INSERT INTO `dajuanitem` VALUES ('140', null, '10', '0', '13', '4', '3', '0');
INSERT INTO `dajuanitem` VALUES ('141', '                                       ', '10', '0', '13', '5', '4', '0');
INSERT INTO `dajuanitem` VALUES ('142', null, '11', '0', '14', '7', '1', '0');
INSERT INTO `dajuanitem` VALUES ('143', null, '11', '0', '14', '22', '1', '0');
INSERT INTO `dajuanitem` VALUES ('144', '正确', '11', '0', '14', '10', '2', '0');
INSERT INTO `dajuanitem` VALUES ('145', null, '11', '0', '14', '4', '3', '0');
INSERT INTO `dajuanitem` VALUES ('146', '                                       ', '11', '0', '14', '7', '4', '0');
INSERT INTO `dajuanitem` VALUES ('147', 'D', '12', '0', '13', '12', '1', '0');
INSERT INTO `dajuanitem` VALUES ('148', null, '12', '0', '13', '19', '1', '0');
INSERT INTO `dajuanitem` VALUES ('149', '正确', '12', '10', '13', '9', '2', '0');
INSERT INTO `dajuanitem` VALUES ('150', null, '12', '0', '13', '4', '3', '0');
INSERT INTO `dajuanitem` VALUES ('151', '                                       ', '12', '0', '13', '5', '4', '0');

-- ----------------------------
-- Table structure for downrecord
-- ----------------------------
DROP TABLE IF EXISTS `downrecord`;
CREATE TABLE `downrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gno` varchar(500) DEFAULT NULL,
  `gname` varchar(500) DEFAULT NULL,
  `zytitle` varchar(500) DEFAULT NULL,
  `zyid` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of downrecord
-- ----------------------------
INSERT INTO `downrecord` VALUES ('7', '2020042201', '宋大川', '计算机基础', '1', '2020-11-17 13:29:35');
INSERT INTO `downrecord` VALUES ('8', '2020042201', '宋大川', '计算机基础1', '1', '2020-11-17 13:32:04');
INSERT INTO `downrecord` VALUES ('9', '2020042201', '宋大川', '计算机基础2', '1', '2020-11-17 13:33:05');
INSERT INTO `downrecord` VALUES ('10', '2020042201', '宋大川', '计算机基础3', '1', '2020-11-17 13:36:15');
INSERT INTO `downrecord` VALUES ('11', '13677550732', '小马', '计算机基础4', '1', '2021-03-11 13:10:03');
INSERT INTO `downrecord` VALUES ('12', '13677550732', '小马', '人工智能', '6', '2021-03-12 19:36:27');
INSERT INTO `downrecord` VALUES ('13', '13677550732', '小马', '大数据', '3', '2021-03-22 15:40:21');
INSERT INTO `downrecord` VALUES ('14', '13677550733', '小宋', '计算机基础', '1', '2021-05-17 23:11:47');
INSERT INTO `downrecord` VALUES ('15', '13677550733', '小宋', '计算机基础', '1', '2021-05-18 11:33:17');
INSERT INTO `downrecord` VALUES ('16', '13677550733', '小宋', '计算机基础', '1', '2021-05-18 15:34:39');

-- ----------------------------
-- Table structure for fcomment
-- ----------------------------
DROP TABLE IF EXISTS `fcomment`;
CREATE TABLE `fcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belongid` varchar(255) DEFAULT NULL,
  `commentor` varchar(255) DEFAULT NULL,
  `commenttime` datetime DEFAULT NULL,
  `dcontent` varchar(255) DEFAULT NULL,
  `tablename` varchar(255) DEFAULT NULL,
  `totalscore` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fcomment
-- ----------------------------
INSERT INTO `fcomment` VALUES ('19', '1', '2020040701', '2020-04-19 14:07:40', '1234445555', 'yingpian', '8');
INSERT INTO `fcomment` VALUES ('20', '2', '2020041901', '2020-04-19 14:12:53', '1244444444444444', 'yingpian', '8');
INSERT INTO `fcomment` VALUES ('21', '4', '2020041902', '2020-04-19 17:42:13', '1234444444444444444', 'yingpian', '10');
INSERT INTO `fcomment` VALUES ('22', '4', '2020042102', '2020-04-21 18:03:19', '不错1234455', 'yingpian', '8');

-- ----------------------------
-- Table structure for friendlink
-- ----------------------------
DROP TABLE IF EXISTS `friendlink`;
CREATE TABLE `friendlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friendlink
-- ----------------------------
INSERT INTO `friendlink` VALUES ('1', '#', '龚老师');

-- ----------------------------
-- Table structure for huiyuan
-- ----------------------------
DROP TABLE IF EXISTS `huiyuan`;
CREATE TABLE `huiyuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `idcardno` varchar(255) DEFAULT NULL,
  `logtimes` int(11) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `paypwd` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `touxiang` varchar(255) DEFAULT NULL,
  `xtype` int(255) DEFAULT NULL,
  `yue` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of huiyuan
-- ----------------------------
INSERT INTO `huiyuan` VALUES ('1', '15797881233', null, null, '1156928778@qq.com', '360222199212088', '1', '15797881233', '小虎', '15797881233', '123456', '123456', '2020-12-28 12:39:15', '男', '1', '/upload/nopic.jpg', null, '0');
INSERT INTO `huiyuan` VALUES ('2', '18957881288', null, null, '1156928778@qq.com', '360121199212044', '0', '18957881288', '小明', '18957881288', '123456', '123456', '2020-12-28 12:40:36', '男', '1', '/upload/nopic.jpg', null, '0');
INSERT INTO `huiyuan` VALUES ('3', '15959591299', null, null, '1156928778@qq.com', '360222199212044', '0', '15959591299', '小黑', '15959591299', '123456', '123456', '2020-12-28 12:47:25', '男', '1', '/upload/nopic.jpg', null, '0');
INSERT INTO `huiyuan` VALUES ('4', '13397991899', null, null, '1156928778@qq.com', '360121199212044', '1', '13397991899', '杰克辣舞', '13397991899', '123456', '123456', '2020-12-28 12:53:34', '男', '1', '/upload/nopic.jpg', null, '0');
INSERT INTO `huiyuan` VALUES ('5', '13677550732', null, null, '13677550732@139.com', '411424199810056614', '16', '13677550732', '小马', '13677550732', '1234567890', '1234567890', '2021-03-10 01:41:25', '男', '1', '/upload/nopic.jpg', null, '2');
INSERT INTO `huiyuan` VALUES ('6', '13677550733', null, null, '1322727993@qq.com', '411424199810056614', '8', '13677550733', '小宋', '13677550733', '1234567890', '1234567890', '2021-05-17 17:35:34', '男', '1', '/upload/nopic.jpg', null, '0');

-- ----------------------------
-- Table structure for indexcolumns
-- ----------------------------
DROP TABLE IF EXISTS `indexcolumns`;
CREATE TABLE `indexcolumns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coldes` varchar(255) DEFAULT NULL,
  `colid` int(11) NOT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `showstyle` varchar(255) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indexcolumns
-- ----------------------------
INSERT INTO `indexcolumns` VALUES ('11', '教育资讯', '10', '2', '文本', '33%', '资讯');
INSERT INTO `indexcolumns` VALUES ('12', '学习方法', '18', '2', '文本', '33%', '资讯');
INSERT INTO `indexcolumns` VALUES ('13', '经验总结', '19', '1', '图片', '33%', '商品');
INSERT INTO `indexcolumns` VALUES ('14', '商务英语专区', '2', '1', '图片', '100%', '商品');
INSERT INTO `indexcolumns` VALUES ('15', '金融科技专区', '11', '1', '图片', '100%', '商品');

-- ----------------------------
-- Table structure for jianda
-- ----------------------------
DROP TABLE IF EXISTS `jianda`;
CREATE TABLE `jianda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daan` longtext,
  `kmid` int(11) DEFAULT NULL,
  `kemu` varchar(255) DEFAULT NULL,
  `title` longtext,
  `difffact` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jianda
-- ----------------------------
INSERT INTO `jianda` VALUES ('5', '<p style=\"font-size:14px;margin-top:0px;margin-bottom:0px;padding:0px;letter-spacing:1px;color:#333333;font-family:微软雅黑, Arial;white-space:normal;background-color:#F7F7F7;\">\r\n	答:对于图像、视频、、地理位置等类型多样的数据，难以用传统的结构化方式描述，因此需要使用由多维表组成的面向列存储的数据管理系统来组织和管理数据。也就是说，将数据按行排序，按列存储，将相同字段的数据作为一个列族来聚合存储。不同的列族对应数据的不同属性，这些属性可以根据需求动态增加，通过这样的分布式实时列式数据库对数据统一进行结构化存储和管理，避免了传统数据存储方式下的关联查询。\r\n</p>\r\n<p style=\"font-size:14px;margin-top:0px;margin-bottom:0px;padding:0px;letter-spacing:1px;color:#333333;font-family:微软雅黑, Arial;white-space:normal;background-color:#F7F7F7;\">\r\n	<br />\r\n</p>', '2', '大数据', '<h3>\r\n	简述大数据的数据管理方式。\r\n</h3>\r\n<div id=\"gtx-trans\" style=\"position:absolute;left:-103px;top:-21.4px;\">\r\n	<div class=\"gtx-trans-icon\">\r\n	</div>\r\n</div>', '0.5');
INSERT INTO `jianda` VALUES ('6', '人工智能是计算机科学的一个分支，它企图了解智能的实质，并生产出─种新的能以人类智能相似的方式做出反应的智能机器，该领域的研究包括机器人、语言识别、图像识别、自然语言处理和专家系统等。<br />\r\n<div>\r\n	<br />\r\n</div>', '1', '人工智能', '<h3>\r\n	简述你对人工智能的理解。\r\n</h3>\r\n<div id=\"gtx-trans\" style=\"position:absolute;left:-70px;top:-21.4px;\">\r\n	<div class=\"gtx-trans-icon\">\r\n	</div>\r\n</div>', '0.5');
INSERT INTO `jianda` VALUES ('7', '人工智能是计算机科学的一个分支，它企图了解智能的实质，并生产出─种新的能以人类智能相似的方式做出反应的智能机器，该领域的研究包括机器人、语言识别、图像识别、自然语言处理和专家系统等。<br />\r\n<div>\r\n	<br />\r\n</div>', '3', '区块链', '<h3>\r\n	简述区块链的含义。\r\n</h3>\r\n<div id=\"gtx-trans\" style=\"position:absolute;left:-50px;top:22px;\">\r\n	<div class=\"gtx-trans-icon\">\r\n	</div>\r\n</div>', '0.5');
INSERT INTO `jianda` VALUES ('8', '<span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">金融是</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B4%A7%E5%B8%81%E8%B5%84%E9%87%91/2408229\" data-lemmaid=\"2408229\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">货币资金</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">融通的</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%80%BB%E7%A7%B0/8996550\" data-lemmaid=\"8996550\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">总称</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">。主要指与</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B4%A7%E5%B8%81%E6%B5%81%E9%80%9A/9634953\" data-lemmaid=\"9634953\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">货币流通</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">和</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%93%B6%E8%A1%8C%E4%BF%A1%E7%94%A8/4824057\" data-lemmaid=\"4824057\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">银行信用</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">相关的各种活动。主要内容包括：货币的</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8F%91%E8%A1%8C/29820\" data-lemmaid=\"29820\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">发行</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%8A%95%E6%94%BE/115260\" data-lemmaid=\"115260\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">投放</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B5%81%E9%80%9A/2882183\" data-lemmaid=\"2882183\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">流通</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">和</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%9B%9E%E7%AC%BC/7707210\" data-lemmaid=\"7707210\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">回笼</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">；各种</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%AD%98%E6%AC%BE/943968\" data-lemmaid=\"943968\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">存款</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">的吸收和提取；各项贷款的发放和收回；银行</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BC%9A%E8%AE%A1/88436\" data-lemmaid=\"88436\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">会计</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%87%BA%E7%BA%B3/553038\" data-lemmaid=\"553038\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">出纳</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%BD%AC%E8%B4%A6/1994070\" data-lemmaid=\"1994070\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">转账</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%BB%93%E7%AE%97/1459851\" data-lemmaid=\"1459851\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">结算</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BF%9D%E9%99%A9/262\" data-lemmaid=\"262\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">保险</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%8A%95%E8%B5%84/211753\" data-lemmaid=\"211753\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">投资</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BF%A1%E6%89%98/221065\" data-lemmaid=\"221065\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">信托</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%A7%9F%E8%B5%81/633715\" data-lemmaid=\"633715\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">租赁</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B1%87%E5%85%91/10311808\" data-lemmaid=\"10311808\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">汇兑</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%B4%B4%E7%8E%B0/3404602\" data-lemmaid=\"3404602\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">贴现</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%8A%B5%E6%8A%BC/2467701\" data-lemmaid=\"2467701\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">抵押</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%AF%81%E5%88%B8/267\" data-lemmaid=\"267\" style=\"color:#136EC2;text-decoration-line:none;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#64451D;\">证券</span></a><span style=\"color:#64451D;font-family:arial, 宋体, sans-serif;font-size:14px;text-indent:28px;white-space:normal;background-color:#FFFFFF;\">买卖以及国际间的贸易和非贸易的结算、黄金白银买卖、输出、输入等</span>', '4', '金融', '<h3>\r\n	解释“金融”所具有含义。\r\n</h3>', '0.5');

-- ----------------------------
-- Table structure for jiaodiantu
-- ----------------------------
DROP TABLE IF EXISTS `jiaodiantu`;
CREATE TABLE `jiaodiantu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(255) DEFAULT NULL,
  `pindex` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tupian` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jiaodiantu
-- ----------------------------
INSERT INTO `jiaodiantu` VALUES ('1', 'http://localhost:8080/study/e/xinxiinfo.jsp?id=10', '0', '金融科技', '/upload/temp/u=3299922030,38222231&fm=26&gp=0.jpg', '站内');
INSERT INTO `jiaodiantu` VALUES ('2', 'http://localhost:8080/study/e/xinxiinfo.jsp?id=10', '0', '大数据', '/upload/temp/timg3333.jpg', '站内');
INSERT INTO `jiaodiantu` VALUES ('3', '#', '0', '区块链', '/upload/temp/tim333333344g.jpg', '站内');

-- ----------------------------
-- Table structure for kecheng
-- ----------------------------
DROP TABLE IF EXISTS `kecheng`;
CREATE TABLE `kecheng` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mingcheng` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kecheng
-- ----------------------------
INSERT INTO `kecheng` VALUES ('1', '人工智能');
INSERT INTO `kecheng` VALUES ('2', '大数据');
INSERT INTO `kecheng` VALUES ('3', '区块链');
INSERT INTO `kecheng` VALUES ('4', '金融');
INSERT INTO `kecheng` VALUES ('5', '商业英语');

-- ----------------------------
-- Table structure for lanmu
-- ----------------------------
DROP TABLE IF EXISTS `lanmu`;
CREATE TABLE `lanmu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `isleaf` int(11) NOT NULL,
  `parentid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lanmu
-- ----------------------------
INSERT INTO `lanmu` VALUES ('1', '2016-06-01 08:50:22', '', null, '0', '0', '学科频道');
INSERT INTO `lanmu` VALUES ('2', '2016-06-01 09:28:22', '', '<span style=\"white-space:nowrap;\">往届追朔</span>', '1', '1', '大数据专区');
INSERT INTO `lanmu` VALUES ('10', '2018-03-23 22:00:27', '', null, '1', '0', '教育资讯');
INSERT INTO `lanmu` VALUES ('11', '2020-11-17 09:23:24', null, null, '1', '1', '人工智能专区');
INSERT INTO `lanmu` VALUES ('12', '2020-11-17 09:23:43', null, null, '1', '1', '云计算专区');
INSERT INTO `lanmu` VALUES ('13', '2020-11-17 09:23:59', null, null, '1', '1', '区块链专区');
INSERT INTO `lanmu` VALUES ('18', '2020-11-17 10:47:37', null, null, '1', '0', '学习方法');
INSERT INTO `lanmu` VALUES ('19', '2020-11-17 10:47:43', null, null, '1', '0', '经验总结');

-- ----------------------------
-- Table structure for leaveword
-- ----------------------------
DROP TABLE IF EXISTS `leaveword`;
CREATE TABLE `leaveword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dcontent` varchar(255) DEFAULT NULL,
  `lwren` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `replycontent` varchar(255) DEFAULT NULL,
  `replyren` varchar(255) DEFAULT NULL,
  `replytime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leaveword
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clickcount` int(11) NOT NULL,
  `dcontent` text,
  `pubren` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '12', '<span style=\"white-space:nowrap;\">1、自我介绍：\r\n自我介绍作为答辩的开场白，包括姓名、学号、专业。介绍时要举止大方、态度从容、面带微笑，礼貌得体的介绍自己。&nbsp;</span>', 'admin', '2018-03-19 11:41:32', '公告：本科答辩');
INSERT INTO `notice` VALUES ('2', '1', '<span style=\"white-space:nowrap;\">发布系统公告测试了</span><span style=\"white-space:nowrap;\">发布系统公告测试了</span><span style=\"white-space:nowrap;\">发布系统公告测试了</span>', 'admin', '2018-03-19 11:41:32', '发布系统公告-测试一');
INSERT INTO `notice` VALUES ('3', '2', '<span style=\"white-space:nowrap;\">发布系统公告测试&nbsp;</span><span style=\"white-space:nowrap;\">发布系统公告测试&nbsp;</span><span style=\"white-space:nowrap;\">发布系统公告测试&nbsp;</span>', 'admin', '2018-03-19 11:41:32', '发布系统公告-测试二');

-- ----------------------------
-- Table structure for panduan
-- ----------------------------
DROP TABLE IF EXISTS `panduan`;
CREATE TABLE `panduan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daan` varchar(255) DEFAULT NULL,
  `kmid` int(11) DEFAULT NULL,
  `kemu` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `difffact` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of panduan
-- ----------------------------
INSERT INTO `panduan` VALUES ('9', '正确', '1', '人工智能', '唐纳德·赫布是普遍推广机器学习第一人', '0.5');
INSERT INTO `panduan` VALUES ('10', '错误', '1', '人工智能', '数据是发展人工智能的硬道理', '0.5');
INSERT INTO `panduan` VALUES ('11', '错误', '2', '大数据', '大数据仅仅是指数据的体量大', '0.5');
INSERT INTO `panduan` VALUES ('12', '正确', '2', '大数据', '大数据的本质是洞察', '0.5');
INSERT INTO `panduan` VALUES ('13', '错误', '3', '区块链', '2015年，我国培养了区块链领域的第一个博士毕业生', '0.5');
INSERT INTO `panduan` VALUES ('14', '正确', '3', '区块链', '私有链是非公开连，它比公有链的隐私性更好、安全性更高', '0.5');
INSERT INTO `panduan` VALUES ('15', '正确', '4', '金融', '借款人支付给贷款人使用贷款的代价是利息', '0.5');
INSERT INTO `panduan` VALUES ('16', '错误', '4', '金融', '中央银行发行货币、集中存款、准备金属是为了资产业务', '0.5');

-- ----------------------------
-- Table structure for playrecord
-- ----------------------------
DROP TABLE IF EXISTS `playrecord`;
CREATE TABLE `playrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(500) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `mname` varchar(500) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of playrecord
-- ----------------------------
INSERT INTO `playrecord` VALUES ('1', '13397991899', '杰克辣舞', '2', '高级计算机', '2020-12-28 12:54:33');
INSERT INTO `playrecord` VALUES ('2', '13677550732', '小马', '1', '计算机基础', '2021-03-10 01:44:53');
INSERT INTO `playrecord` VALUES ('3', '13677550732', '小马', '1', '计算机基础1', '2021-03-11 22:53:00');
INSERT INTO `playrecord` VALUES ('4', '13677550732', '小马', '1', '区块链概念', '2021-03-12 19:36:34');
INSERT INTO `playrecord` VALUES ('5', '13677550732', '小马', '2', '人工智能基础', '2021-03-12 19:37:00');
INSERT INTO `playrecord` VALUES ('6', '13677550732', '小马', '2', '人工智能基础', '2021-03-12 19:40:00');
INSERT INTO `playrecord` VALUES ('7', '13677550732', '小马', '8', '金融', '2021-03-12 19:40:08');
INSERT INTO `playrecord` VALUES ('8', '13677550732', '小马', '8', '金融', '2021-03-12 19:40:20');
INSERT INTO `playrecord` VALUES ('9', '13677550732', '小马', '8', '金融', '2021-03-12 21:00:57');
INSERT INTO `playrecord` VALUES ('10', '13677550732', '小马', '2', '人工智能基础', '2021-03-22 15:43:11');
INSERT INTO `playrecord` VALUES ('11', '13677550732', '小马', '8', '金融', '2021-03-22 15:43:19');
INSERT INTO `playrecord` VALUES ('12', '13677550732', '小马', '8', '金融', '2021-03-22 15:48:09');
INSERT INTO `playrecord` VALUES ('13', '13677550732', '小马', '8', '金融', '2021-03-31 20:58:57');
INSERT INTO `playrecord` VALUES ('14', '13677550732', '小马', '8', '金融', '2021-03-31 21:11:35');
INSERT INTO `playrecord` VALUES ('15', '13677550732', '小马', '8', '金融', '2021-05-17 14:55:35');
INSERT INTO `playrecord` VALUES ('16', '13677550732', '小马', '5', '数学对科技的影响', '2021-05-17 14:58:43');
INSERT INTO `playrecord` VALUES ('17', '13677550732', '小马', '5', '数学对科技的影响', '2021-05-17 14:58:52');
INSERT INTO `playrecord` VALUES ('18', '13677550732', '小马', '8', '金融', '2021-05-17 15:35:27');
INSERT INTO `playrecord` VALUES ('19', '13677550732', '小马', '2', '人工智能基础', '2021-05-17 16:31:52');
INSERT INTO `playrecord` VALUES ('20', '13677550732', '小马', '1', '区块链概念', '2021-05-17 16:31:58');
INSERT INTO `playrecord` VALUES ('21', '13677550732', '小马', '10', '云计算', '2021-05-17 16:32:07');
INSERT INTO `playrecord` VALUES ('22', '13677550732', '小马', '8', '金融', '2021-05-17 16:32:26');
INSERT INTO `playrecord` VALUES ('23', '13677550732', '小马', '11', '收费视频-浪潮之巅', '2021-05-17 17:25:12');
INSERT INTO `playrecord` VALUES ('24', '13677550732', '小马', '11', '收费视频-浪潮之巅', '2021-05-17 17:25:22');
INSERT INTO `playrecord` VALUES ('25', '13677550732', '小马', '11', '收费视频-浪潮之巅', '2021-05-17 17:27:30');
INSERT INTO `playrecord` VALUES ('26', '13677550732', '小马', '2', '人工智能基础', '2021-05-17 17:27:40');
INSERT INTO `playrecord` VALUES ('27', '13677550732', '小马', '1', '区块链概念', '2021-05-17 17:27:48');
INSERT INTO `playrecord` VALUES ('28', '13677550732', '小马', '8', '金融', '2021-05-17 17:27:52');
INSERT INTO `playrecord` VALUES ('29', '13677550732', '小马', '11', '收费视频-浪潮之巅', '2021-05-17 17:28:21');
INSERT INTO `playrecord` VALUES ('30', '13677550732', '小马', '11', '收费视频-浪潮之巅', '2021-05-17 17:29:55');
INSERT INTO `playrecord` VALUES ('31', '13677550732', '小马', '11', '收费视频-浪潮之巅', '2021-05-17 17:30:18');
INSERT INTO `playrecord` VALUES ('32', '13677550732', '小马', '11', '收费视频-浪潮之巅', '2021-05-17 17:30:48');
INSERT INTO `playrecord` VALUES ('33', '13677550732', '小马', '12', '收费测试2-浪潮之巅', '2021-05-17 17:34:00');
INSERT INTO `playrecord` VALUES ('34', '13677550733', '小宋', '12', '收费测试2-浪潮之巅', '2021-05-17 17:35:50');
INSERT INTO `playrecord` VALUES ('35', '13677550733', '小宋', '11', '收费视频-浪潮之巅', '2021-05-17 17:35:54');
INSERT INTO `playrecord` VALUES ('36', '13677550733', '小宋', '12', '收费测试2-浪潮之巅', '2021-05-17 17:37:26');
INSERT INTO `playrecord` VALUES ('37', '13677550733', '小宋', '12', '收费测试2-浪潮之巅', '2021-05-17 17:38:32');
INSERT INTO `playrecord` VALUES ('38', '13677550733', '小宋', '11', '收费视频-浪潮之巅', '2021-05-17 17:38:45');
INSERT INTO `playrecord` VALUES ('39', '13677550733', '小宋', '12', '收费测试2-浪潮之巅', '2021-05-17 17:43:43');
INSERT INTO `playrecord` VALUES ('40', '13677550733', '小宋', '11', '收费视频-浪潮之巅', '2021-05-17 17:43:46');
INSERT INTO `playrecord` VALUES ('41', '13677550733', '小宋', '12', '收费测试2-浪潮之巅', '2021-05-17 17:47:18');
INSERT INTO `playrecord` VALUES ('42', '13677550733', '小宋', '11', '收费视频-浪潮之巅', '2021-05-17 17:47:29');
INSERT INTO `playrecord` VALUES ('43', '13677550733', '小宋', '12', '收费测试2-浪潮之巅', '2021-05-17 17:47:44');
INSERT INTO `playrecord` VALUES ('44', '13677550733', '小宋', '4', '大数据平台', '2021-05-17 17:48:27');
INSERT INTO `playrecord` VALUES ('45', '13677550733', '小宋', '2', '人工智能基础', '2021-05-17 17:48:34');
INSERT INTO `playrecord` VALUES ('46', '13677550733', '小宋', '12', '收费测试2-浪潮之巅', '2021-05-17 19:48:37');
INSERT INTO `playrecord` VALUES ('47', '13677550733', '小宋', '12', '收费测试2-浪潮之巅', '2021-05-17 19:48:51');
INSERT INTO `playrecord` VALUES ('48', '13677550733', '小宋', '8', '金融', '2021-05-17 19:49:04');
INSERT INTO `playrecord` VALUES ('49', '13677550733', '小宋', '2', '人工智能基础', '2021-05-17 20:27:21');
INSERT INTO `playrecord` VALUES ('50', '13677550733', '小宋', '8', '金融', '2021-05-17 20:27:27');
INSERT INTO `playrecord` VALUES ('51', '13677550733', '小宋', '4', '大数据平台', '2021-05-17 20:45:24');
INSERT INTO `playrecord` VALUES ('52', '13677550733', '小宋', '8', '金融', '2021-05-17 20:45:38');
INSERT INTO `playrecord` VALUES ('53', '13677550733', '小宋', '8', '金融', '2021-05-18 11:32:29');
INSERT INTO `playrecord` VALUES ('54', '13677550733', '小宋', '8', '金融', '2021-05-18 15:33:51');

-- ----------------------------
-- Table structure for shijuan
-- ----------------------------
DROP TABLE IF EXISTS `shijuan`;
CREATE TABLE `shijuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `des` varchar(255) DEFAULT NULL,
  `kmid` int(11) DEFAULT NULL,
  `kemu` varchar(255) DEFAULT NULL,
  `state` int(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `zongfen` int(11) DEFAULT NULL,
  `zujuanren` varchar(255) DEFAULT NULL,
  `difffact` double DEFAULT NULL,
  `tupian` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shijuan
-- ----------------------------
INSERT INTO `shijuan` VALUES ('7', '1234444444444444444444455555', '5', '英语', '2', '英语测试卷', '100', 'admin', '0.5', '/upload/temp/u=1870420456,287636990&fm=26&gp=0.jpg');
INSERT INTO `shijuan` VALUES ('13', '初级人工智能试题', '1', '人工智能', '2', '人工智能初级（一）', '100', 'admin', '0.5', '/upload/nopic.jpg');
INSERT INTO `shijuan` VALUES ('14', null, '1', '人工智能', '2', '123', '100', 'admin', '0.5', '/upload/nopic.jpg');
INSERT INTO `shijuan` VALUES ('15', null, '1', '人工智能', '2', '测试1', '100', 'admin', '0.5', '/upload/nopic.jpg');
INSERT INTO `shijuan` VALUES ('16', null, '1', '人工智能', '2', '1', '100', 'admin', '0.5', '/upload/nopic.jpg');

-- ----------------------------
-- Table structure for shijuanitem
-- ----------------------------
DROP TABLE IF EXISTS `shijuanitem`;
CREATE TABLE `shijuanitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fenshu` int(11) DEFAULT NULL,
  `shijuanid` int(11) DEFAULT NULL,
  `tihao` int(11) DEFAULT NULL,
  `tixing` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shijuanitem
-- ----------------------------
INSERT INTO `shijuanitem` VALUES ('111', '5', '7', '1', '1');
INSERT INTO `shijuanitem` VALUES ('112', '5', '7', '2', '1');
INSERT INTO `shijuanitem` VALUES ('113', '5', '7', '3', '1');
INSERT INTO `shijuanitem` VALUES ('114', '5', '7', '4', '1');
INSERT INTO `shijuanitem` VALUES ('115', '5', '7', '5', '1');
INSERT INTO `shijuanitem` VALUES ('116', '5', '7', '6', '1');
INSERT INTO `shijuanitem` VALUES ('117', '5', '7', '7', '1');
INSERT INTO `shijuanitem` VALUES ('118', '5', '7', '8', '1');
INSERT INTO `shijuanitem` VALUES ('119', '5', '7', '9', '1');
INSERT INTO `shijuanitem` VALUES ('120', '5', '7', '10', '1');
INSERT INTO `shijuanitem` VALUES ('121', '5', '7', '11', '1');
INSERT INTO `shijuanitem` VALUES ('122', '5', '7', '9', '2');
INSERT INTO `shijuanitem` VALUES ('123', '5', '7', '10', '2');
INSERT INTO `shijuanitem` VALUES ('124', '5', '7', '11', '2');
INSERT INTO `shijuanitem` VALUES ('125', '5', '7', '12', '2');
INSERT INTO `shijuanitem` VALUES ('126', '5', '7', '13', '2');
INSERT INTO `shijuanitem` VALUES ('127', '5', '7', '4', '3');
INSERT INTO `shijuanitem` VALUES ('128', '15', '7', '5', '4');
INSERT INTO `shijuanitem` VALUES ('151', '30', '13', '12', '1');
INSERT INTO `shijuanitem` VALUES ('152', '30', '13', '19', '1');
INSERT INTO `shijuanitem` VALUES ('153', '10', '13', '9', '2');
INSERT INTO `shijuanitem` VALUES ('154', '10', '13', '4', '3');
INSERT INTO `shijuanitem` VALUES ('155', '20', '13', '5', '4');
INSERT INTO `shijuanitem` VALUES ('156', '20', '14', '7', '1');
INSERT INTO `shijuanitem` VALUES ('157', '20', '14', '22', '1');
INSERT INTO `shijuanitem` VALUES ('158', '20', '14', '10', '2');
INSERT INTO `shijuanitem` VALUES ('159', '20', '14', '4', '3');
INSERT INTO `shijuanitem` VALUES ('160', '20', '14', '7', '4');
INSERT INTO `shijuanitem` VALUES ('161', '20', '15', '2', '1');
INSERT INTO `shijuanitem` VALUES ('162', '20', '15', '17', '1');
INSERT INTO `shijuanitem` VALUES ('163', '20', '15', '9', '2');
INSERT INTO `shijuanitem` VALUES ('164', '20', '15', '6', '3');
INSERT INTO `shijuanitem` VALUES ('165', '20', '15', '6', '4');
INSERT INTO `shijuanitem` VALUES ('166', '20', '16', '5', '1');
INSERT INTO `shijuanitem` VALUES ('167', '20', '16', '9', '1');
INSERT INTO `shijuanitem` VALUES ('168', '20', '16', '13', '2');
INSERT INTO `shijuanitem` VALUES ('169', '20', '16', '4', '3');
INSERT INTO `shijuanitem` VALUES ('170', '20', '16', '6', '4');

-- ----------------------------
-- Table structure for shoucang
-- ----------------------------
DROP TABLE IF EXISTS `shoucang`;
CREATE TABLE `shoucang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `targetid` int(11) NOT NULL,
  `targetname` varchar(255) DEFAULT NULL,
  `hyid` int(255) DEFAULT NULL,
  `sctime` datetime DEFAULT NULL,
  `tupian` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoucang
-- ----------------------------
INSERT INTO `shoucang` VALUES ('1', '3', '高级计算机', '4', '2020-12-28 12:56:00', '/upload/temp/7.jpg', '/e/xinxiinfo.jsp?id=3', 'xinxi');
INSERT INTO `shoucang` VALUES ('2', '4', '身边的理财', '5', '2021-03-31 20:59:46', '/upload/temp/2.jpg', '/e/xinxiinfo.jsp?id=4', 'xinxi');
INSERT INTO `shoucang` VALUES ('3', '4', '云计算概述', '6', '2021-05-18 11:32:51', '/upload/temp/2.jpg', '/e/xinxiinfo.jsp?id=4', 'xinxi');

-- ----------------------------
-- Table structure for sitenav
-- ----------------------------
DROP TABLE IF EXISTS `sitenav`;
CREATE TABLE `sitenav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(255) DEFAULT NULL,
  `sindex` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sitenav
-- ----------------------------
INSERT INTO `sitenav` VALUES ('1', '/e/index.jsp', '1', '首页');
INSERT INTO `sitenav` VALUES ('27', '/e/shijuanlist.jsp', '2', '考试测试');
INSERT INTO `sitenav` VALUES ('29', '/e/coursewarelist.jsp', '1', '资料下载');
INSERT INTO `sitenav` VALUES ('30', '/e/yingpianlist.jsp', '1', '视频课程');
INSERT INTO `sitenav` VALUES ('31', '/e/lanmuinfo.jsp?lanmuid=1', '2', '博客交流');
INSERT INTO `sitenav` VALUES ('32', '/e/sysconfiginfo.jsp?id=1', '3', '常见问题');

-- ----------------------------
-- Table structure for sysconfig
-- ----------------------------
DROP TABLE IF EXISTS `sysconfig`;
CREATE TABLE `sysconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysconfig
-- ----------------------------
INSERT INTO `sysconfig` VALUES ('1', '网站介绍');

-- ----------------------------
-- Table structure for sysconfigitem
-- ----------------------------
DROP TABLE IF EXISTS `sysconfigitem`;
CREATE TABLE `sysconfigitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `dcontent` text,
  `cfgid` int(11) DEFAULT NULL,
  `cfgname` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysconfigitem
-- ----------------------------
INSERT INTO `sysconfigitem` VALUES ('32', '网站介绍', '<span style=\"white-space:nowrap;\"> \r\n<p style=\"text-indent:24.0000pt;\">\r\n	<span style=\"font-family:宋体;line-height:150%;font-size:12.0000pt;\">&nbsp; 恒生电子股份有限公司作为金融软件商业端的行业领域龙头，致力于开发高品质的金融类软件。</span> \r\n</p>\r\n<p style=\"text-indent:24.0000pt;\">\r\n	<span style=\"font-family:宋体;line-height:150%;font-size:12.0000pt;\">所谓知己知彼，百战不殆。</span> \r\n</p>\r\n<p style=\"text-indent:24.0000pt;\">\r\n	<span style=\"font-family:宋体;line-height:150%;font-size:12.0000pt;\">&nbsp; 如何成为行业顶端的公司，学习能力是非常重要的，如果开发者能够站在软件使用者的角度来</span>\r\n</p>\r\n<p style=\"text-indent:24.0000pt;\">\r\n	<span style=\"font-family:宋体;line-height:150%;font-size:12.0000pt;\">进行软件的设计与开发，那样必能使作品更为出色，更能贴合工作实际需求。</span><span style=\"font-family:Calibri;line-height:150%;font-size:12.0000pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:24.0000pt;\">\r\n	<span style=\"font-family:宋体;line-height:150%;font-size:12.0000pt;\">&nbsp; 由此工作时除了对每位开发工程师的软件开发能力有较高要求，并且还需要每位开发者能够具</span>\r\n</p>\r\n<p style=\"text-indent:24.0000pt;\">\r\n	<span style=\"font-family:宋体;line-height:150%;font-size:12.0000pt;\">有较为全面的金融及相关科技发展的知识掌握。因此开发一个金融科技教育服务平台，是极具</span><span style=\"text-indent:24pt;font-family:宋体;line-height:150%;font-size:12pt;\">现</span>\r\n</p>\r\n<p style=\"text-indent:24.0000pt;\">\r\n	<span style=\"text-indent:24pt;font-family:宋体;line-height:150%;font-size:12pt;\">实意义</span><span style=\"text-indent:24pt;font-family:宋体;line-height:150%;font-size:12pt;\">，而且也能对想进入该行业的人才进行教育培训。</span>\r\n</p>\r\n</span>', '1', '网站介绍');
INSERT INTO `sysconfigitem` VALUES ('33', '关于我们', '关于我们：新疆大学 软件学院 17-21 宋大川', '1', '网站介绍');
INSERT INTO `sysconfigitem` VALUES ('34', '联系方式', '<span style=\"white-space:nowrap;\">联系方式：13677550732</span>', '1', '网站介绍');

-- ----------------------------
-- Table structure for sysrole
-- ----------------------------
DROP TABLE IF EXISTS `sysrole`;
CREATE TABLE `sysrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysrole
-- ----------------------------
INSERT INTO `sysrole` VALUES ('1', '超级管理员');

-- ----------------------------
-- Table structure for tiankong
-- ----------------------------
DROP TABLE IF EXISTS `tiankong`;
CREATE TABLE `tiankong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daan` varchar(255) DEFAULT NULL,
  `kmid` int(11) DEFAULT NULL,
  `kemu` varchar(255) DEFAULT NULL,
  `title` longtext,
  `difffact` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tiankong
-- ----------------------------
INSERT INTO `tiankong` VALUES ('4', '进化主义 连接主义', '1', '人工智能', '<div class=\"topic__type-items\" style=\"box-sizing:border-box;margin:0px 10px 0px 0px;padding:0px;-webkit-tap-highlight-color:rgba(0, 0, 0, 0);position:relative;font-size:16px;color:#333333;line-height:32px;display:-webkit-flex;align-items:center;flex:0 0 auto;font-family:\" white-space:normal;background-color:#ffffff;\"=\"\"> <label style=\"box-sizing:border-box;margin-right:6px;\"><strong style=\"box-sizing:border-box;\"> <p style=\"margin-top:0px;margin-bottom:10px;padding:0px;font-size:16px;color:#333333;font-family:\" white-space:normal;background-color:#ffffff;\"=\"\">\r\n		目前人工智能的学派主要有三家：符号主义______________ 、______________ &nbsp;。\r\n	</p>\r\n</strong></label> \r\n		</div>\r\n<span style=\"color:#262626;font-family:\" white-space:normal;background-color:#ffffff;\"=\"\"></span>', '0.5');
INSERT INTO `tiankong` VALUES ('5', '不以盈利为目的的法人', '4', '金融', '<h3>\r\n	<strong>根据我国法律规定，我国的证券交易所是_______</strong>\r\n</h3>', '0.5');
INSERT INTO `tiankong` VALUES ('6', '密码学', '3', '区块链', '<h3>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\"><strong>从狭义上讲，区块链是指一种按照时间顺序将数据组合成特定数据结构，并以_________方式保证的不可篡改和不可伪造的去中心化共享总账。</strong></span>\r\n</h3>', '0.5');
INSERT INTO `tiankong` VALUES ('7', '大量化 多样化 快速化 价值密度低', '2', '大数据', '<h3>\r\n	大数据的4V特征是_____、_____、_____、_____。\r\n</h3>', '0.5');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `logtimes` int(11) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `rolename` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `xiangpian` varchar(255) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  `basicwage` int(11) DEFAULT NULL,
  `jixiao` double(11,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '2020-12-28 12:32:29', 'root', '13677550732@139.com', '320', 'admin', 'admin', '小宋', '系统管理员', '男', '13677550732', 'admin', '/upload/temp/12222.jpg', '1', '4000', '1800');

-- ----------------------------
-- Table structure for xinxi
-- ----------------------------
DROP TABLE IF EXISTS `xinxi`;
CREATE TABLE `xinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `againstcount` int(11) NOT NULL,
  `agreecount` int(11) NOT NULL,
  `clickcount` int(11) NOT NULL,
  `dcontent` longtext,
  `hot` int(11) NOT NULL,
  `laiyuan` varchar(255) DEFAULT NULL,
  `lanmuid` int(11) NOT NULL,
  `lanmuming` varchar(255) DEFAULT NULL,
  `pubren` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tuijian` int(11) NOT NULL,
  `tupian2` varchar(255) DEFAULT NULL,
  `zhaiyao` varchar(255) DEFAULT NULL,
  `zuixin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinxi
-- ----------------------------
INSERT INTO `xinxi` VALUES ('4', '1', '3', '23', '<dd style=\"list-style:none;margin-left:0px;padding-left:12px;line-height:38px;color:#444444;font-family:\" font-size:14px;white-space:normal;background-color:#ffffff;\"=\"\"> <span style=\"color:#007DBB;\"> <p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\"> <span style=\"box-sizing:border-box;font-weight:700;\"> </span>\r\n	</p>\r\n	<div class=\"para\" label-module=\"para\" style=\"font-size:14px;color:#333333;margin-bottom:15px;text-indent:28px;line-height:24px;zoom:1;font-family:arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:14px;\">云计算（cloud computing）是分布式计算的一种，指的是通过网络“云”将巨大的数据计算处理程序分解成无数个小程序，然后，通过多部服务器组成的系统进行处理和分析这些小程序得到结果并返回给用户。云计算早期，简单地说，就是简单的分布式计算，解决任务分发，并进行计算结果的合并。因而，云计算又称为网格计算。通过这项技术，可以在很短的时间内（几秒钟）完成对数以万计的数据的处理，从而达到强大的网络服务。</span><span class=\"sup--normal\" data-sup=\"1\" data-ctrmap=\":1,\" style=\"font-size:14px;line-height:0;position:relative;vertical-align:baseline;top:-0.5em;white-space:nowrap;margin-left:2px;color:#3366CC;cursor:pointer;padding:0px 2px;\"> </span> \r\n	</div>\r\n	<div class=\"para\" label-module=\"para\" style=\"font-size:14px;color:#333333;margin-bottom:15px;text-indent:28px;line-height:24px;zoom:1;font-family:arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:14px;\">现阶段所说的云服务已经不单单是一种分布式计算，而是分布式计算、效用计算、负载均衡、并行计算、网络存储、热备份冗杂和虚拟化等计算机技术混合演进并跃升的结果。</span> \r\n	</div>\r\n</span> \r\n	<p>\r\n		<br />\r\n	</p>\r\n<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\"><br />\r\n</p>\r\n	</dd>\r\n<dd class=\"bg-f7f7f7\" style=\"list-style:none;margin-left:0px;padding-left:12px;line-height:38px;color:#444444;font-family:\" font-size:14px;white-space:normal;background-color:#f4f4f4=\"\" !important;\"=\"\"><span style=\"color:#007DBB;\"></span><a href=\"http://c.biancheng.net/view/vip_1816.html\" style=\"border:none;text-decoration-line:none;color:#007DBB;\"></a> \r\n</dd>', '0', null, '12', '云计算专区', '2020040701', '2020-12-28 12:32:29', '云计算概述', '1', '/upload/temp/2.jpg', null, '0');
INSERT INTO `xinxi` VALUES ('5', '0', '0', '10', '<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\"> <span style=\"box-sizing:border-box;font-weight:700;\">\r\n<div class=\"para\" label-module=\"para\" style=\"font-size:14px;color:#333333;margin-bottom:15px;text-indent:28px;line-height:24px;zoom:1;font-family:arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#64451D;\">金融科技英译为</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/Fintech/19784768\" data-lemmaid=\"19784768\" style=\"color:#136EC2;text-decoration-line:none;\"><span style=\"color:#64451D;\">Fintech</span></a><span style=\"color:#64451D;\">， 是 Financial Technology 的缩写，可以简单理解成为Finance（金融）+Technology（科技），指通过利用各类科技手段创新传统金融行业所提供的产品和服务，提升效率并有效降低运营成本。</span>\r\n</div>\r\n<div class=\"para\" label-module=\"para\" style=\"font-size:14px;color:#333333;margin-bottom:15px;text-indent:28px;line-height:24px;zoom:1;font-family:arial, 宋体, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"color:#64451D;\">根据</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%87%91%E8%9E%8D%E7%A8%B3%E5%AE%9A%E7%90%86%E4%BA%8B%E4%BC%9A/8095010\" data-lemmaid=\"8095010\" style=\"color:#136EC2;text-decoration-line:none;\"><span style=\"color:#64451D;\">金融稳定理事会</span></a><span style=\"color:#64451D;\">（FSB）的定义，金融科技主要是指由</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%A7%E6%95%B0%E6%8D%AE/1356941\" data-lemmaid=\"1356941\" style=\"color:#136EC2;text-decoration-line:none;\"><span style=\"color:#64451D;\">大数据</span></a><span style=\"color:#64451D;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8C%BA%E5%9D%97%E9%93%BE/13465666\" data-lemmaid=\"13465666\" style=\"color:#136EC2;text-decoration-line:none;\"><span style=\"color:#64451D;\">区块链</span></a><span style=\"color:#64451D;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%91%E8%AE%A1%E7%AE%97/9969353\" data-lemmaid=\"9969353\" style=\"color:#136EC2;text-decoration-line:none;\"><span style=\"color:#64451D;\">云计算</span></a><span style=\"color:#64451D;\">、</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%BA%E5%B7%A5%E6%99%BA%E8%83%BD/9180\" data-lemmaid=\"9180\" style=\"color:#136EC2;text-decoration-line:none;\"><span style=\"color:#64451D;\">人工智能</span></a><span style=\"color:#64451D;\">等新兴前沿技术带动，对金融市场以及金融服务业务供给产生重大影响的新兴业务模式、新技术应用、新产品服务等。</span>\r\n</div>\r\n</span>\r\n	</p>\r\n<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\"><br />\r\n</p>', '1', null, '2', '英语专区', 'admin', '2020-12-28 12:32:29', '金融科技', '1', '/upload/temp/9.jpg', null, '0');
INSERT INTO `xinxi` VALUES ('6', '0', '0', '11', '<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;text-align:justify;\"=\"\"><br />\r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<div>\r\n		<p>\r\n			<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">作为 IT 类职业中的“大熊猫”，大数据工程师的收入待遇可以说达到了同类的顶级。</span>\r\n		</p>\r\n		<p>\r\n			<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">国内 IT、通讯、行业招聘中，有10％都是和大数据相关的，且比例还在上升。</span>\r\n		</p>\r\n		<p>\r\n			<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">不久前，清华大学经管学院发布了《中国经济的数字化转型：人才与就业》的报告，根据报告显示，当前我国大数据领域人才缺口高达150万，到2025年将达到200万。</span>\r\n		</p>\r\n	</div>\r\n	<p>\r\n		<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>\r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">细数现在国内的互联网产品，淘宝电商头部地位不可动摇；腾讯牢牢占据社交、游戏大部分市场份额；抖音、快手引领短视频风潮……</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这些公司除了占据行业先发优势之外，完备的数据也是它们成功的重要原因。</span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">首先，了解大数据所需技能要求</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大数据必须掌握的技能包括：Java核心技术、数据库关键技术、互联网核心框架、互联网流行技术以及大数据框架等。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;了解这些之后，进行具体的学习规划。</span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">学习规划第一阶段：</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">1．掌握Java开发环境基本配置&nbsp;</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\"></span><span style=\"font-size:14px;\">2．掌握运算符、表达式、流程控制语句、数组等的使用&nbsp;</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">3．熟练使用IDEA开发工具</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;4．掌握Java基本面向对象知识</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;5．掌握常用类String、ArrayList等的使用第二阶段：掌握javaSE课程常用类和常用方法，具备面向对象思想，承上启下，增强java基础知识，为学习JavaWeb 完成知识储备。</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">本阶段商业价值：具备JavaSE基本的开发能力，可以实现简单单机 应用程序，对企业JavaWeb开发又进一步，也为 JavaWeb学习提供基础。</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">第三阶段：以JDBC为工具，Mysql数据库为容器，结合 tomcat服务器，servlet和Json技术在B/S的环境下完成前后台数据的动态交互。</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">本阶段商业价值：掌握JavaWeb开发基本数据流转流程，熟悉Java 基本开发环境、熟悉项目管理工具使用及MySql数据库使用，满足Java软件开发行业的基本开发需求。</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">第四阶段：1．掌握使用JavaWeb三层架构实现项目的搭建及开发 2．掌握文件上传中的图片的上传 3．掌握ajax和jquery在前端页面的使用&nbsp; 4．掌握过滤器的基本用法</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">本阶段商业价值：本阶段学员具备自主独立开发商业项目的能力， 可快速搭建后端架构、熟悉前端服务的开发流程、后 期项目快速部署。</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">第五阶段：1．掌握MyBatis框架原理 2．熟练使用掌映射关系3．掌握Spring中IOC，DI，AOP的原理 、注解开发、Spring整合其他框架的使用技巧、SpringMVC框架的运行原理、文件配置&nbsp;</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">5．具备ssm框架整合，项目搭建的能力&nbsp;</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">6．熟练的对程序进行分析、测试与调试本阶段商业价值：掌握框架的使用，对企业项目的构建起着关键性的作用，框架规定了应用体系结构，构成了某类特定软件的可复用设计，可以使开发人员只关注软件的业务功能。</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">第六阶段：1．掌握Maven多模块开发 2．掌握分布式框架的架构 3．掌握分布式服务提供者和消费者开发 4．熟练应用ElementUI常用组件使用&nbsp;</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">5．掌握阿里云OSS存储服务的使用 6．掌握Spring Security框架的使用&nbsp;</span></span>\r\n	</p>\r\n	<p style=\"margin-top:1.4em;margin-bottom:1.4em;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"white-space:nowrap;\"><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">7．掌握ECharts的使用。本阶段商业价值：面向服务架构（SOA）是让开发人员更加关注于业务流程而非底层基础结构，从而获得比传统软件开发人员更具竞争力的优势。</span></span><br />\r\n<br />\r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>', '1', null, '19', '经验总结', 'admin', '2020-12-28 12:32:29', '如何掌握大数据框架？', '0', '/upload/temp/1.jpg', null, '0');
INSERT INTO `xinxi` VALUES ('7', '0', '0', '4', '<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\">杭州城市大脑的内核采用阿里云ET人工智能技术，可以对整个城市进行全局实时分析，自动调配公共资源，修正城市运行中的Bug。城市大脑项目的第一步，是将交通、能源、供水等基础设施全部数据化，连接散落在城市各个单元的数据资源，打通“神经网络”。\r\n	</p>\r\n<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\"><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;以交通为例，数以百亿计的城市交通管理数据、公共服务数据、运营商数据、互联网数据被集中输入杭州城市大脑。这些数据成为城市大脑智慧的起源。拥有数据资源后，城市大脑还需要五大系统才能高效运转——超大规模计算平台、数据采集系统、数据交换中心、开放算法平台、数据应用平台。\r\n</p>\r\n<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\"><br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;城市大脑计算平台采用飞天操作系统。城市大脑涉及的数据量巨大，仅视频摄像头就有5万多路。飞天(Apsara）是由阿里云自主研发的超大规模通用计算操作系统。结合手机地图、道路线圈记录的车辆行驶速度和数量，公交车、出租车等运行数据，城市大脑即可在一个虚拟的数字城市中构建算法模型，通过机器学习不断迭代优化，计算出更“聪明”的方案。<br />\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	2016年9月，城市大脑交通模块在萧山区市心路投入使用。初步试验数据显示:通过智能调节红绿灯，道路车辆通行速度平均提升了3%至5%，在部分路段有11%的提升，真正开始了用大规模数据改善交通的探索。\r\n</p>\r\n<p>\r\n	<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2017年10月，城市大脑接管杭州128个信号灯路口，试点区域通行时间减少15.3%，高架道路出行时间节省4.6分钟;在主城区，城市大脑日均事件报警500次以上，准确率达92%;在萧山，120救护车到达现场时间缩短一半。<br />\r\n	<div>\r\n		<br />\r\n	</div>\r\n</p>\r\n	</p>', '0', null, '2', '大数据专区', 'admin', '2020-12-28 12:32:29', '杭州市大数据-城市大脑', '1', '/upload/temp/8.jpg', null, '0');
INSERT INTO `xinxi` VALUES ('8', '0', '0', '7', '<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\">\r\n<p style=\"margin-top:0px;margin-bottom:17px;padding:0px;line-height:28px;color:#333333;font-family:&quot;font-size:16px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;\">（1）趣链</span>\r\n</p>\r\n<p style=\"margin-top:17px;margin-bottom:17px;padding:0px;line-height:28px;color:#333333;font-family:&quot;font-size:16px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;\">趣链区块链底层平台是趣链科技研发的国产自主可控区块链底层平台，以高性能、高可用、可扩展、易运维、强隐私保护、混合型存储等特性，配合数据共享与安全计算平台BitXMesh、区块链开放服务平台飞洛FiLoop、供应链金融平台飞洛供应链FiloLink、存证服务平台飞洛印FiloInk、智能合约安全研发平台MeshSec，能更好的支撑企业、政府、产业联盟等行业应用，促进多机构间价值高效流通。</span>\r\n</p>\r\n<div>\r\n	<p style=\"margin-top:17px;margin-bottom:17px;padding:0px;line-height:28px;color:#333333;font-family:&quot;font-size:16px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:14px;\">2）京东链</span>\r\n	</p>\r\n	<p style=\"margin-top:17px;margin-bottom:17px;padding:0px;line-height:28px;color:#333333;font-family:&quot;font-size:16px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:14px;\">智臻链（JDChain）是京东自主研发的企业级区块链底层框架，其诞生标志着京东全面开启基于区块链BaaS平台和“JDChain”底层链的“智臻生态”建设。京东智臻链服务平台依托多项优化实现的“一键部署”能力，做到了领先的秒级区块链节点部署。此外，它还具备开放兼容多种底层、企业级动态组网等成熟应用的核心优势。京东智臻链的适时推出，将有效提升各行业企业级区块链应用的大规模落地，推动中国及全球信任经济的建设。</span>\r\n	</p>\r\n	<p style=\"margin-top:17px;margin-bottom:17px;padding:0px;line-height:28px;color:#333333;font-family:&quot;font-size:16px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:14px;\">（3）迅雷链</span>\r\n	</p>\r\n	<p style=\"margin-top:17px;margin-bottom:17px;padding:0px;line-height:28px;color:#333333;font-family:&quot;font-size:16px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:14px;\">迅雷链（ThunderChain）是迅雷旗下网心科技自主研发的区块链应用项目，具备百万tps高并发、秒级确认能力。迅雷在研发高性能区块链产品的基础上，搭建了迅雷链开放平台，助力企业或个人开发者部署智能合约，轻松实现产品和服务上链，使得区块链应用开发更为便捷。</span>\r\n	</p>\r\n	<p style=\"margin-top:17px;margin-bottom:17px;padding:0px;line-height:28px;color:#333333;font-family:&quot;font-size:16px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:14px;\">（4）井通链</span>\r\n	</p>\r\n	<p style=\"margin-top:17px;margin-bottom:17px;padding:0px;line-height:28px;color:#333333;font-family:&quot;font-size:16px;white-space:normal;background-color:#FFFFFF;\">\r\n		<span style=\"font-size:14px;\">井通区块链是井通科技具有自主知识产权的区块链核心底层技术，它是基于区块链技术所构建的有效去中心化互享生态的互联网交易网络，采用分层设计（5层）的底层平台，以及多语言的智能合约体系，并已实现跨链功能。其具备私链、云链、联盟链等多层次、全方位、一站式服务能力，行业和区域生态的布局已初步成型。</span>\r\n	</p>\r\n<br />\r\n</div>\r\n	</p>', '0', null, '13', '区块链专区', 'admin', '2020-12-28 12:32:29', '区块链在生活中的使用', '1', '/upload/temp/u=312909675,394256143&fm=26&gp=0.jpg', null, '0');
INSERT INTO `xinxi` VALUES ('9', '0', '0', '4', '<div style=\"box-sizing:border-box;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;text-align:justify;\"=\"\">\r\n<p style=\"margin-top:0px;margin-bottom:17px;padding:0px;line-height:28px;color:#333333;font-family:&quot;font-size:16px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">我们经常可以看到或听到一些这样的报道：用计算机又实现了对什么什么过程的控制；用计算机驾驶飞机、跟踪导弹、监测卫星；用计算机给学生上课、给病人看病、与棋手下棋；用计算机辅助设计、辅助制造；用计算机辅助决策等等。计算机家族里的机器人还可以代替人类去干那些危险的、不适合人类干的活，到那些危险的、人类不能去的地方去探险。如此看来，计算机既聪明又勇敢，什么都行，什么都会，具有超人的智慧和力量。况且，在计算机技术飞速发展的今天，几乎天天有新东西出现；天天有更先进的计算机软、硬件新产品问世。照此发展下去，有一天，计算机的智力不是要超过人的智力了吗?为了找到这个问题的答案，让我们先来看看计算机的智力是从哪里来的。</span>\r\n</p>\r\n<p style=\"margin-top:17px;margin-bottom:0px;padding:0px;line-height:28px;color:#333333;font-family:&quot;font-size:16px;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-size:14px;\">实际上，一台只有硬设备的计算机，在给它配备上程序以前，只不过是一个聪明的傻瓜：反应灵敏，却不会动“脑筋”，什么也不会干。当人们想要用它干什么事时，必须把要它干的每一个极微小的步骤用编程序的方法告诉计算机，用编好的程序教给它干什么，应该怎么干。如果编程序的人稍微疏忽，忘记把某一个微小的细节编在程序里告诉它，它就会犯错误。因为计算机决没有能力主动发挥，去做人们没有教它做的事。比如说一个会走路的机器人。给它编制一个向前走20米的程序，它便严守向前走20米的命令。如果它站在一条不足20米的走廊上，即使撞了墙，它也会拼命向前走，决不会“想”到提前拐弯或停下来。只是在人们给它装上感知撞墙的传感器，并编好程序告诉它：在接到传感器撞到墙上的报告后立即拐弯。这时，它才具有撞墙以后拐弯的能力。这是计算机“笨”的一面。另一方面，由于计算机具有极高的反应速度，同时又有足够大的内存容量，还有更大的外存作为补充，它可以记忆大量信息，又可以在需要时快速反应。当人们给它装备上各种专家系统程序包时，它便成了这些方面的专家。每一种专家系统都是许多人智慧的结晶，系统里包括许多历史的经验和数据。当系统运行时，计算机凭借它的快速，迅速作出判断。它的记忆能力是人所不及的。记忆力再好的人也有记错和遗忘的时候，而计算机绝对准确无误。当这个专家系统是对抗系统时(比如下棋、打桥牌等)，由于系统集多人的智慧而成，所以一个人往往不是它的对手。从这一点上说，计算机比人要“聪明”。况且它还可以装备不止一种专家系统；而一个人的精力有限，不可能样样都精通。因此，计算机又显得比人有“学问”。但这里所说的人，都是指某一特定的个人。归根到底，计算机的一切程序都是人编制的，因此它的一切聪明和学问都是人赋予的，是人类总结了自身的经验让计算机记住，并把自己的思维方式和思想方法教给计算机，让它也这样地来思考。所以，计算机的“智力”永远不会超过人类的智力。人类所具有的思维方式，它也不会有。</span>\r\n</p>\r\n<span style=\"font-size:14px;\"></span><br />\r\n	</div>', '1', null, '10', '教育资讯', 'admin', '2020-12-28 12:32:29', '计算机会有思想吗？', '1', '/upload/temp/8.jpg', null, '1');
INSERT INTO `xinxi` VALUES ('10', '0', '1', '14', '<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\"><span style=\"font-size:14px;\">1、</span><span style=\"color:#333333;font-family:&quot;font-size:14px;text-align:justify;white-space:normal;background-color:#FFFFFF;\">提高生活效率。生活效率的提高是必然的，人工智能的出现，让人们的生活速度变得更快。</span>\r\n	</p>\r\n<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\"><span style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;white-space:normal;background-color:#FFFFFF;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\"><span style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;white-space:normal;background-color:#FFFFFF;\"><span style=\"font-size:14px;\">2、</span><span style=\"color:#333333;font-family:&quot;font-size:14px;text-align:justify;white-space:normal;background-color:#FFFFFF;\">节约成本。未来的人工智能将会拥有越来越多的功能，提供越来越多的服务，这样可以让人工智能帮你解决很多事情，这样可以在无形之中节约很多生活中的成本。</span></span>\r\n	</p>\r\n<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\"><span style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;white-space:normal;background-color:#FFFFFF;\"><br />\r\n</span></span>\r\n</p>\r\n<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\"><span style=\"color:#333333;font-family:&quot;font-size:14px;text-align:justify;white-space:normal;background-color:#FFFFFF;\">3、提</span><span style=\"color:#333333;font-family:&quot;font-size:14px;text-align:justify;white-space:normal;background-color:#FFFFFF;\">高生活质量。生活效率的提高，让你生活中的时间越来越充裕，你可以利用节约出的时间做很多其他想要做的事情，这样提高生活质量也是必然.</span>\r\n	</p>\r\n<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\"><span style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;white-space:normal;background-color:#FFFFFF;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\"><span style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;white-space:normal;background-color:#FFFFFF;\"><span style=\"font-size:14px;\">4、</span><span style=\"color:#333333;font-family:&quot;font-size:14px;text-align:justify;white-space:normal;background-color:#FFFFFF;\">做一些之前无法完成的事情。之前艾尔法狗打败了国际象棋大师，这是一件多么不可能的事情，人工智能的学习速度可以干一些之前人类无法完成的一些事情。</span></span>\r\n	</p>\r\n<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;\"=\"\"><br />\r\n</p>\r\n<h4>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;white-space:normal;background-color:#FFFFFF;\"></span>\r\n</h4>\r\n<span style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;white-space:normal;background-color:#FFFFFF;\"></span>\r\n<p>\r\n	<br />\r\n</p>', '1', null, '11', '人工智能专区', 'admin', '2020-12-28 12:32:29', '人工智能如何改变生活', '1', '/upload/temp/052600005E61C7401B76915399039638.jpg', null, '0');
INSERT INTO `xinxi` VALUES ('11', '0', '1', '1', '<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;background-color:#ffffff;\"=\"\"><span style=\"font-weight:600;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">01</span>\r\n	</p>\r\n<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;background-color:#ffffff;\"=\"\">我们在初次对知识进行主动学习时，是「短时记忆」。要想记得快记得牢记得久，一定要经过充分的、有一定深度的加工，把「短时记忆」转化为「长时记忆」。「长时记忆」没有容量限制，保存时间也更为长久，可以长达数年甚至终身。<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp;「加工」是什么意思呢?是指，对知识点加以自己的处理。对于记忆大段文字来说，「加工」的关键在于，用自己的语言叙述出来。\r\n</p>\r\n<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;background-color:#ffffff;\"=\"\"><span style=\"font-weight:600;color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:15px;white-space:normal;background-color:#FFFFFF;\">02</span>\r\n	</p>\r\n<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;background-color:#ffffff;\"=\"\">首先，在第一次记忆时，如果你用的是「机械复述」，书上的内容，按照作者的逻辑和语言系统进行表达，于我们是陌生的。这时我们记忆的东西包括知识本身、以及叙述方式。\r\n</p>\r\n<p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:0px;text-indent:30px;color:#343A3C;font-family:mp-quote, -apple-system-font, BlinkMacSystemFont, \" font-size:14px;white-space:normal;background-color:#ffffff;\"=\"\">两块儿都很陌生。但如果是用「精细复述」，转化为自己熟悉的语言系统，相对口语化，会更容易记住，首次记忆也未必比直接背诵来得慢。而且，记东西不是一次就能记住的，需要重复。「机械复述」的首次记忆效果并不牢靠，在第二次、第三次记忆时，依然需要耗费很多时间。<br />\r\n<br />\r\n<div>\r\n	<br />\r\n</div>\r\n	</p>', '0', null, '18', '学习方法', 'admin', '2020-12-28 12:32:29', '学习方法', '0', '/upload/nopic.jpg', null, '0');

-- ----------------------------
-- Table structure for yingpian
-- ----------------------------
DROP TABLE IF EXISTS `yingpian`;
CREATE TABLE `yingpian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clickcount` int(11) NOT NULL,
  `des` text,
  `pubren` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `remoteurl` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tupian` varchar(255) DEFAULT NULL,
  `xshowtype` int(11) NOT NULL,
  `ypcateid` int(11) NOT NULL,
  `ypcatename` varchar(255) DEFAULT NULL,
  `againstcount` int(11) DEFAULT NULL,
  `agreecount` int(11) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `alphabetindex` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `dlcount` int(11) DEFAULT NULL,
  `playcount` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `jifen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yingpian
-- ----------------------------
INSERT INTO `yingpian` VALUES ('1', '0', '区块链是什么，它在我们未来的生活会有什么样的影响？', 'T001', '2020-04-07 19:32:12', '/upload/temp/1.mp4\r\n						', '区块链概念', '/upload/temp/052600005FAA65D313EBAC086DD424F8.jpg', '2', '3', '区块链', '0', '0', '带你走入区块链', 'Q', '区块链', '0', '11', '2', '1');
INSERT INTO `yingpian` VALUES ('2', '0', '如何理解人工智能的发展方向？', 'T002', '2020-04-07 20:45:20', '/upload/temp/1.mp4\r\n						', '人工智能基础', '/upload/temp/052600005E4BF577859B5E620C08F57D.jpg', '2', '1', '人工智能', '2', '4', '浪潮之巅-AI', 'R', '人工智能', '0', '18', '2', '0');
INSERT INTO `yingpian` VALUES ('4', '0', '大数据影响我们的生活。', 'T001', '2020-04-19 14:17:38', '/upload/temp/1.mp4\r\n						', '大数据平台', '/upload/temp/u=2627079558,2486317762&fm=15&gp=0.jpg', '2', '2', '大数据', '0', '0', 'spark', 'D', '计算机课程', '0', '4', '2', '0');
INSERT INTO `yingpian` VALUES ('7', '0', '人工智能', 'T003', '2020-04-21 18:05:22', '/upload/temp/1.mp4\r\n						', '人工智能中阶', '/upload/temp/052600005E61C7401B76915399039638.jpg', '1', '2', '数学', '0', '0', '带你走进人工智能', 'A', '学习', '0', '2', '2', '0');
INSERT INTO `yingpian` VALUES ('8', '0', '金融科技', 'admin', '2020-04-22 09:44:59', '/upload/temp/1.mp4', '金融', '/upload/temp/052600005F8D0C0E13EBAC08442D67FA.jpg', '2', '4', '金融', '0', '1', '科技', 'J', '测试', '0', '18', '2', '0');
INSERT INTO `yingpian` VALUES ('10', '0', '云计算', '20201117001', '2020-11-17 11:28:24', '/upload/temp/1.mp4\r\n						', '云计算', '/upload/temp/052600005E4BEAF2859B5E5378004002.jpg', '2', '2', '大数据', '0', '0', '云计算', 'D', '数学', '0', '4', '2', '0');
INSERT INTO `yingpian` VALUES ('11', '10', '收费测试', 'admin', '2021-05-17 15:34:56', '/upload/temp/2.mp4					', '收费视频-浪潮之巅', '/upload/nopic.jpg', '2', '1', '人工智能', '0', '0', '浪潮之巅', 'R', '收费', '0', '11', '2', '1');
INSERT INTO `yingpian` VALUES ('12', '10', '收费测试2', 'admin', '2021-05-17 17:33:35', '/upload/temp/2.mp4				', '收费测试2-浪潮之巅', '/upload/nopic.jpg', '2', '2', '大数据', '10', '10', '浪潮之巅', 'D', '数据', '0', '9', '2', '10');
