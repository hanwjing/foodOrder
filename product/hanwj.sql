/*
SQLyog Professional v12.08 (32 bit)
MySQL - 5.6.12-log : Database - hanwj
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hanwj` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hanwj`;

/*Table structure for table `food_detail` */

DROP TABLE IF EXISTS `food_detail`;

CREATE TABLE `food_detail` (
  `fid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `fhot` int(11) DEFAULT NULL,
  `fsell_num` int(11) DEFAULT NULL,
  `forigin_price` int(11) DEFAULT NULL,
  `fprice` int(11) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `fdescript` longtext,
  `fclass` varchar(255) DEFAULT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `food_detail` */

insert  into `food_detail`(`fid`,`sid`,`fhot`,`fsell_num`,`forigin_price`,`fprice`,`fname`,`url`,`img`,`img_url`,`fdescript`,`fclass`,`add_time`) values (21,4,1,37800,138,108,'精品北京烤鸭','/upload/newImage/1quan/noon1.jpg','/upload/newImage/1quan/noon2.jpg','','料为优质肉食鸭北京鸭，果木炭火烤制，色泽红润，肉质肥而不腻','荤菜','2018-12-18 12:30:47'),(22,4,1,37800,138,108,'盐水鸭肝','/upload/newImage/1quan/noon7.jpg','/upload/newImage/1quan/noon8.jpg','','鸭肝的营养丰富，富含铁质','荤菜','2018-12-18 12:30:47'),(23,4,1,37800,138,108,'芥末鸭掌','/upload/newImage/1quan/noon4.jpg','/upload/newImage/1quan/noon11.jpg','/upload/newImage/1quan/noon12.jpg','精选上好鸭掌，辅以各种口味，且色泽橙黄亮丽，辛辣香鲜。黄芥末是西方调料，色黄细腻，口味和谐','荤菜','2018-12-18 12:30:47'),(24,4,1,15234,138,108,'老火鸭汤','/upload/newImage/1quan/soup1.jpg','','','汤汁澄清香醇，滋味鲜美，鸭脂黄亮，肉酥烂鲜醇，是一种集美食养生，传统滋补','荤菜','2018-12-18 12:30:47'),(25,4,0,3780,75,56,'京味点心','/upload/newImage/1quan/noon9.jpg','','','京派糕点,也叫京式糕点、京味糕点','甜品','2018-12-18 12:30:47'),(26,4,0,3899,120,99,'京酱肉丝','/upload/newImage/1quan/noon10.jpg','','','北京菜中的经典代表菜之一，选用猪瘦肉为主料，辅以甜面酱、葱、姜及其它调料，用北方特有烹调技法“六爆”之一的“酱爆”烹制而成','荤菜','2018-12-18 12:30:47'),(27,4,0,4502,120,99,'京味水饺','/upload/newImage/1quan/noon6.jpg','','','京味水饺','主食','2018-12-18 12:30:47'),(28,4,1,3132,32,18,'老北京糖葫芦','/upload/newImage/1quan/noon5.jpg','','','老北京糖葫芦，用山楂串成，糖稀冻硬，酸酸甜甜','甜品','2018-12-18 12:30:47'),(31,5,1,37800,158,128,'巧克力奶香蛋糕','/upload/newImage/2/dessert2.jpg','','','全蛋打发的蛋糕,口感弹性十足,淋上巧克力','甜品','2018-12-18 12:30:47'),(32,5,1,37800,138,108,'喵喵甜心卷','/upload/newImage/2/morn3.jpg','/upload/newImage/2/morn11.jpg','','香浓醇厚独一无二，香浓美味,口感松软,香浓无比的下午茶点心','甜品','2018-12-18 12:30:47'),(33,5,1,37800,138,108,'猫掌奶香蛋糕','/upload/newImage/2/morn5.jpg','','','空气感十足的猫掌奶香蛋糕入口即化，带来满口的幸福感','甜品','2018-12-18 12:30:47'),(34,5,1,37800,138,108,'猫咪冰激凌','/upload/newImage/2/morn6.jpg','/upload/newImage/2/morn4.jpg','/upload/newImage/2/morn9.jpg','做工细软的面皮包裹软冰淇淋制成，再配以新鲜水果佐味，使口感松软细腻，不但拥有糕点的精致，同时拥有冰淇淋的丝滑清凉','甜品','2018-12-18 12:30:47'),(35,5,0,37800,138,108,'慕斯千层雪','/upload/newImage/2/dessert3.jpg','','','多层','甜品','2018-12-18 12:30:47'),(36,5,0,37800,138,108,'鱼子酱泡芙','/upload/newImage/2/morn1.jpg','','','甜而不腻的泡芙加上美味的鱼子酱','甜品','2018-12-18 12:30:47'),(37,5,0,37800,138,108,'原味麦香','/upload/newImage/2/food4.jpg','','','燕麦饼干中间夹一层丝滑般的南瓜鲜奶油,风味十足','甜品','2018-12-18 12:30:47');

/*Table structure for table `is_pay` */

DROP TABLE IF EXISTS `is_pay`;

CREATE TABLE `is_pay` (
  `ispay` int(11) DEFAULT NULL,
  `ispayname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `is_pay` */

insert  into `is_pay`(`ispay`,`ispayname`) values (1,'待支付'),(2,'已完成'),(3,'已取消');

/*Table structure for table `my_classify` */

DROP TABLE IF EXISTS `my_classify`;

CREATE TABLE `my_classify` (
  `cid` int(11) DEFAULT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `ctitle` varchar(100) DEFAULT NULL,
  `cimg` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `my_classify` */

insert  into `my_classify`(`cid`,`cname`,`ctitle`,`cimg`) values (1,'chinese','中式菜','/upload/newImage/menu/menu7.png'),(2,'west','西餐','/upload/newImage/menu/menu.png'),(3,'news','新闻资讯','/upload/newImage/menu/menu9.png');

/*Table structure for table `my_lunbof` */

DROP TABLE IF EXISTS `my_lunbof`;

CREATE TABLE `my_lunbof` (
  `url` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `my_lunbof` */

insert  into `my_lunbof`(`url`,`img`) values ('http://www.baidu.com','/upload/newImage/swiper1.jpg'),('http://www.sohu.com','/upload/newImage/swiper2.jpg'),('http://www.qq.com','/upload/newImage/swiper3.jpg');

/*Table structure for table `my_lunbos` */

DROP TABLE IF EXISTS `my_lunbos`;

CREATE TABLE `my_lunbos` (
  `url` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `my_lunbos` */

insert  into `my_lunbos`(`url`,`img`) values ('url11111','/upload/newImage/food5.jpg'),('url22222','/upload/newImage/food6.jpg'),('url33333','/upload/newImage/food7.jpg');

/*Table structure for table `news_list` */

DROP TABLE IF EXISTS `news_list`;

CREATE TABLE `news_list` (
  `nid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `readnum` int(11) DEFAULT NULL,
  `ntitle` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `ncontent` longtext,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `news_list` */

insert  into `news_list`(`nid`,`cid`,`readnum`,`ntitle`,`img`,`ncontent`,`add_time`) values (11,3,180,'聚首古城，共谋餐饮发展','/upload/newImage/1quan/noon5.jpg','2018年餐饮行业经历了政策调整、O2O等互联网技术快速发展、消费者主体变化、餐厅结构整合、商圈转移等重大冲击。为了共同的理想和目标，这一年，xxx餐饮人比以往更加齐心协力，抱团取暖，在激烈的市场竞争中，彼此协作，共同进步。他们一直在努力，一直在坚持。xxx省餐饮业商会举办迎新联谊会，xxx餐饮业近千代表欢聚一堂，分析总结、交流研讨，载歌载舞，以餐饮人特别的方式，辞旧迎新','2018-11-23 14:00:00'),(12,3,180,'春天滋补女人5大食物','/upload/newImage/food7.jpg','2018年餐饮行业经历了政策调整、O2O等互联网技术快速发展、消费者主体变化、餐厅结构整合、商圈转移等重大冲击。为了共同的理想和目标，这一年，xxx餐饮人比以往更加齐心协力，抱团取暖，在激烈的市场竞争中，彼此协作，共同进步。他们一直在努力，一直在坚持。xxx省餐饮业商会举办迎新联谊会，xxx餐饮业近千代表欢聚一堂，分析总结、交流研讨，载歌载舞，以餐饮人特别的方式，辞旧迎新','2018-11-23 14:00:00'),(13,3,820,'便利店正在成为快餐行业的威胁','/upload/newImage/bianli.jpg','<p>美国的餐饮界近意识到了这样一个问题：便利店正在成为快餐行业的威胁。而在亚洲市场，这种情况早已存在。</p><p>在美国，便利店的优越性在于其方便的地理位置——当你去给车加油的时候，旁边就会有一家便利店，这使得便利店食物唾手可得。这些年，美国的便利店也提供了更丰富多样的餐饮选择，从热狗、汉堡到比萨等。例如，C-Store会在门店烘焙甜甜圈和曲奇，Casey s则提供披萨外卖服务。</p><p>而且，他们也不贵，平均售价不到2美元，这个价格也可以与快餐行业推出的一美元菜单（Dollar Menu）所抗衡。在美国市场，便利店餐饮目前占到了快餐行业10%的市场份额。</p><p>在亚洲市场，庞大的便利店系统早已成为了快餐行业的一个潜在威胁。首当其中的是日本市场。这些便利店可以一天24小时提供食物给附近的消费者，无论是居住区、商务区还是通勤的地铁站。罗森、全家和7-Eleven的门店数量超过了20000家，而麦当劳和肯德基的门店总数则只有5000多家门店。这些便利店通过装修改造，在店内开辟了提供座椅的餐饮区。</p>','2018-11-23 14:00:00'),(14,3,180,'冰城女孩纽约开餐厅摘星米其林','/upload/newImage/west4.jpg','<p>北方有佳人绝世而独立一顾倾人城再顾倾人国，宁不知倾城与倾国?佳人难再得!”李延年的《北方有佳人》可谓是对绝代佳人最到位的评述了。而哈尔滨姑娘王怡明却在美国纽约用她的倾国\"China Blue\"\"倾城Cafe China\"，征服了华尔街金融精英的味蕾，俘获了漂泊海外的游子心。在纽约，\"倾国\"\"倾城\"这两家中餐馆成为纽约食客心中难以割舍的一份乡愁。在纽约近7000家中餐厅，仅有\"倾城\"一家中餐厅摘得2017年米其林一星。近日，怡明刚开业不久的第三家餐馆“鸳鸯”(Birds of a feather)，又成为了纽约美食论坛的焦点和热搜。</p><p>米其林餐厅，是《米其林红色宝典》对各地美食、餐厅收录的餐厅。这书又被\"美食家\"视为至宝，誉为欧洲的美食圣经，成为每年法国的餐馆评定星级的图书。</p>','2018-11-23 14:00:00'),(15,3,304,'餐饮业新三板再添新军','/upload/newImage/vege1.jpg','<p>8月22日消息，湖南旺府酒店管理股份有限公司(以下简称：湖南旺府)在新三板的挂牌申请获得批准，并于今日正式挂牌。公开资料显示，湖南旺府成立于2006年9月1日，董事长龚建群通过直接和间接合计占股82%，为公司实际控制人。公司主营业务是酒店住宿、餐饮、团膳、会务及其他配套服务。据其转股说明书显示，公司的主要产品分为三大板块：餐饮、客房及团膳服务，其中各子公司餐饮、客房服务建立了一体化标准的管理和产品体系，形成了一定的品牌效应，团膳服务业务则主要由湖南旺府开展。</p><p>公告显示，湖南旺府2015年度、2016年度营业收入分别为7432.63万元、8399.52万元;净利润分别为425.03万元和290.17万元。其中主营业务收入比重分别是92.96%和91.86%，主营业务明确。此外，2015年、2016年经营活动所产生的现金流量净额分别为224.71万元和136.22万元，现金流状况良好。截至2016年12月31日，公司总资产为6231.71万元，资产负债率为67.61%。</p><p>湖南旺府方面表示，公司之所以能有现今的发展成绩，在于其有可持续发展的技术优势：作为湖南省本土知名的餐饮品牌，深耕湘菜产业多年，有着高度的标准化菜品以及标准化、人性化的服务流程。此外，完整的产业链结构确保了食品安全，且通过标准采购、加工、配送，有效降低了成本，提高了产品质量，形成了自己独有的品牌和竞争力。</p><p>此外，湖南旺府酒店+团膳的差异化路线，也让其竞争优势得以提升。目前来看，团餐市场潜力巨大，据商务部发布的《\"十二五\"期间促进餐饮业科学发展的指导意见》中相关数据统计，到2020年，团膳收入规模将达到2.3万亿元。而湖南旺府在提供酒店、餐饮等服务的基础上，拓展团膳业务无疑抓住了市场机遇，业内认为，依托其公司酒店及餐饮的口碑效应以及渠道资源的支撑，未来团膳业务的发展会成为湖南旺府重要的利润增长点。</p>','2018-04-09 17:00:00'),(16,3,760,'精致和风美食 伴你赏味春夏时光','/upload/newImage/eat2.jpg','<p>2017年4月，春天的脚步翩然而至，蛰伏一冬的你是不是正准备发掘新美味?一碗温馨的日式丼饭料理，抑或是几　清新可口的小菜，总能令你在这两季体会到一种抚慰人心的幸福感。香港美心饮食集团旗下全新概念日式时尚餐厅——丼丼屋(DONDONYA)配合春夏季，用心推出了全新特色主题菜单，其中包括一款用料上佳、物有所值的人气丼饭——三文鱼盛丼，配以两款美味前菜——吞拿鱼拌山药泥、鲜虾牛油果沙拉，及一款风味菜品——鱿鱼照烧，为食客们带来沁人心脾的春日和风料理体验。</p><p>丼丼屋秉承其对菜品品质的一贯追求，新菜品精选上等食材，以满足人们对精致和温暖料理的追求。品牌以用尖「逆浸透膜过滤系统」(RO System)过滤的纯水烹煮米饭，严选进口优质三文鱼……细节上的用心成就了道道珍馔佳肴。此外，店内现代日式风格也为食客们营造了温馨舒适的用餐环境，是私享或小聚时享受闲暇时光的上佳之选。</p>','2018-04-09 17:00:00');

/*Table structure for table `order_seat` */

DROP TABLE IF EXISTS `order_seat`;

CREATE TABLE `order_seat` (
  `oid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `st_id` int(11) DEFAULT NULL,
  `oleave` int(11) DEFAULT NULL,
  `ohas_order` int(11) DEFAULT NULL,
  `oprice` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `st_title` varchar(255) DEFAULT NULL,
  `ocontent` longtext,
  `odescript` varchar(255) DEFAULT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_seat` */

insert  into `order_seat`(`oid`,`sid`,`st_id`,`oleave`,`ohas_order`,`oprice`,`img`,`sname`,`st_title`,`ocontent`,`odescript`,`add_time`) values (51,4,62,3,42,120,'/upload/newImage/seat/seat2.png','全聚德德德','六人座','<p>可增加座位</p><p>长方形桌，常见形式高端西式接待（在此，回型桌视为长方形桌）、卡座、普通餐桌，高端西式接待，客用区可参考值为 90cm—150cm，可根据接待级别与宾客喜欢定制，不建议相隔太远，这样会影响宾客之间的交流。</p><p>长方形卡座、长方形/正方形普通餐桌常见为中挡、中低、低档接待，客用区可参考值为 40cm—70cm，可根据自身餐厅的档次而定。</p><p>计算餐桌餐位，一般用于餐饮筹备或者接待前对餐桌容纳宾客数量进行预估，以上计算法中的客用区数据，仅供参考，各位同行可以根据自身店面的实际情况结合接待档次、宾客喜好等因素灵活变通，方法挺好，客用区数据可变。</p>','适合6个人的家庭聚会，一对一服务','2018-12-18 12:30:47'),(52,5,60,5,16,120,'/upload/newImage/seat/miao1.jpg','转角遇到猫','二人座','<p>可增加座位</p><p>长方形桌，常见形式高端西式接待（在此，回型桌视为长方形桌）、卡座、普通餐桌，高端西式接待，客用区可参考值为 90cm—150cm，可根据接待级别与宾客喜欢定制，不建议相隔太远，这样会影响宾客之间的交流。</p><p>长方形卡座、长方形/正方形普通餐桌常见为中挡、中低、低档接待，客用区可参考值为 40cm—70cm，可根据自身餐厅的档次而定。</p><p>计算餐桌餐位，一般用于餐饮筹备或者接待前对餐桌容纳宾客数量进行预估，以上计算法中的客用区数据，仅供参考，各位同行可以根据自身店面的实际情况结合接待档次、宾客喜好等因素灵活变通，方法挺好，客用区数据可变。</p>','适合2人的浪漫约会，一对一服务','2018-12-18 12:30:47'),(53,5,62,6,8,160,'/upload/newImage/seat/miao2.jpg','转角遇到猫','六人座','<p>可增加座位</p><p>长方形桌，常见形式高端西式接待（在此，回型桌视为长方形桌）、卡座、普通餐桌，高端西式接待，客用区可参考值为 90cm—150cm，可根据接待级别与宾客喜欢定制，不建议相隔太远，这样会影响宾客之间的交流。</p><p>长方形卡座、长方形/正方形普通餐桌常见为中挡、中低、低档接待，客用区可参考值为 40cm—70cm，可根据自身餐厅的档次而定。</p><p>计算餐桌餐位，一般用于餐饮筹备或者接待前对餐桌容纳宾客数量进行预估，以上计算法中的客用区数据，仅供参考，各位同行可以根据自身店面的实际情况结合接待档次、宾客喜好等因素灵活变通，方法挺好，客用区数据可变。</p>','适合6个人的家庭聚会，一对一服务','2018-12-18 12:30:47'),(54,4,61,16,32,120,'/upload/newImage/seat/seat1.png','全聚德德德','四人座','<p>可增加座位</p><p>长方形桌，常见形式高端西式接待（在此，回型桌视为长方形桌）、卡座、普通餐桌，高端西式接待，客用区可参考值为 90cm—150cm，可根据接待级别与宾客喜欢定制，不建议相隔太远，这样会影响宾客之间的交流。</p><p>长方形卡座、长方形/正方形普通餐桌常见为中挡、中低、低档接待，客用区可参考值为 40cm—70cm，可根据自身餐厅的档次而定。</p><p>计算餐桌餐位，一般用于餐饮筹备或者接待前对餐桌容纳宾客数量进行预估，以上计算法中的客用区数据，仅供参考，各位同行可以根据自身店面的实际情况结合接待档次、宾客喜好等因素灵活变通，方法挺好，客用区数据可变。</p>','适合4个人的小型聚餐，一对一服务','2018-12-18 12:30:47'),(55,7,61,8,25,210,'/upload/newImage/seat/seat3.png','婷婷西餐','四人座','<p>可增加座位</p><p>长方形桌，常见形式高端西式接待（在此，回型桌视为长方形桌）、卡座、普通餐桌，高端西式接待，客用区可参考值为 90cm—150cm，可根据接待级别与宾客喜欢定制，不建议相隔太远，这样会影响宾客之间的交流。</p><p>长方形卡座、长方形/正方形普通餐桌常见为中挡、中低、低档接待，客用区可参考值为 40cm—70cm，可根据自身餐厅的档次而定。</p><p>计算餐桌餐位，一般用于餐饮筹备或者接待前对餐桌容纳宾客数量进行预估，以上计算法中的客用区数据，仅供参考，各位同行可以根据自身店面的实际情况结合接待档次、宾客喜好等因素灵活变通，方法挺好，客用区数据可变。</p>','适合4个人的小型聚餐，一对一服务','2018-12-18 12:30:47'),(56,7,60,12,13,160,'/upload/newImage/seat/seat4.png','婷婷西餐','二人座','<p>可增加座位</p><p>长方形桌，常见形式高端西式接待（在此，回型桌视为长方形桌）、卡座、普通餐桌，高端西式接待，客用区可参考值为 90cm—150cm，可根据接待级别与宾客喜欢定制，不建议相隔太远，这样会影响宾客之间的交流。</p><p>长方形卡座、长方形/正方形普通餐桌常见为中挡、中低、低档接待，客用区可参考值为 40cm—70cm，可根据自身餐厅的档次而定。</p><p>计算餐桌餐位，一般用于餐饮筹备或者接待前对餐桌容纳宾客数量进行预估，以上计算法中的客用区数据，仅供参考，各位同行可以根据自身店面的实际情况结合接待档次、宾客喜好等因素灵活变通，方法挺好，客用区数据可变。</p>','适合2人的浪漫约会，一对一服务','2018-12-18 12:30:47');

/*Table structure for table `order_sort` */

DROP TABLE IF EXISTS `order_sort`;

CREATE TABLE `order_sort` (
  `st_id` int(11) DEFAULT NULL,
  `st_title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_sort` */

insert  into `order_sort`(`st_id`,`st_title`) values (60,'二人座'),(61,'四人座'),(62,'六人座');

/*Table structure for table `seller_info` */

DROP TABLE IF EXISTS `seller_info`;

CREATE TABLE `seller_info` (
  `sid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `stel` bigint(30) DEFAULT NULL,
  `snum` bigint(30) DEFAULT NULL,
  `severy` int(11) DEFAULT NULL,
  `sdura` varchar(255) DEFAULT NULL,
  `simg` varchar(255) DEFAULT NULL,
  `surl` varchar(255) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `saddress` varchar(255) DEFAULT NULL,
  `sell_count` int(11) DEFAULT NULL,
  `sorder_seat` int(11) DEFAULT NULL,
  `scontent` longtext,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `seller_info` */

insert  into `seller_info`(`sid`,`cid`,`score`,`stel`,`snum`,`severy`,`sdura`,`simg`,`surl`,`sname`,`saddress`,`sell_count`,`sorder_seat`,`scontent`,`add_time`) values (4,1,4,12354545567,40082132,84,'早10:00-晚23:30','/upload/newImage/1quan/1.jpg','','全聚德德德','北京市',67802,1,'全聚德德德菜品经过不断创新发展，形成了以北京填鸭为主料烹制各类鸭菜组成的筵席','2018-12-18 12:30:47'),(5,1,5,17805613670,83752291,64,'早9:00-晚22:30','/upload/newImage/2/miao1.jpg','/upload/newImage/2/morn11.jpg','转角遇到猫','北京市东城区',27802,1,'转角遇到小蛋糕，这是一间混搭风蛋糕店。可撸猫，小撸怡情，大撸伤身，强橹加钱！！！喵喵喵，我是一只可爱的小猫咪','2018-12-18 12:30:47'),(6,2,4,15557567567,75675767,43,'早10:00-晚23:00','/upload/newImage/3west/pizza.png','','巨无霸披萨','北京市',17802,0,'巨无霸披萨，一点也不大，但是滋味巨无霸','2018-12-18 12:30:47'),(7,2,4,18815610530,65767768,58,'早10:00-晚23:00','/upload/newImage/4/4.jpg','','婷婷西餐','北京市',7802,1,'因为店主叫大婷','2018-12-18 12:30:47');

/*Table structure for table `user_order` */

DROP TABLE IF EXISTS `user_order`;

CREATE TABLE `user_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `ispay` int(11) DEFAULT NULL,
  `ispayname` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user_order` */

insert  into `user_order`(`id`,`username`,`sname`,`sid`,`fid`,`oid`,`ispay`,`ispayname`,`number`) values (1,'han','转角遇到猫',5,32,0,1,'未支付',1),(2,'han','转角遇到猫',5,0,52,2,'已完成',1),(3,'han','转角遇到猫',5,0,53,3,'已取消',1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`username`,`password`) values ('han','223'),('hwj','456456'),('glj','123456');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
