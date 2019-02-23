#设置客户端语言
SET NAMES UTF8;
#放弃数据库(如果存在)
DROP DATABASE IF EXISTS first;
#创建数据库
CREATE DATABASE first CHARSET=UTF8;
USE first;

#创建美食广场新闻列表
#first_news
#id   INT
#title  VARCHAR(255),
#ctime  Date,
#img_url VARCHAR(255),
#point   INT,
#view   INT,
#content VARCHAR(2000)

CREATE TABLE first_news(
   id  INT PRIMARY KEY AUTO_INCREMENT,
   title  VARCHAR(255),
   ctime  VARCHAR(128),
   img_url VARCHAR(255),
   point   INT,
   view   INT,
   content VARCHAR(2000)
);
INSERT INTO first_news VALUES(null,'吃吃的境界','2018-11-11',
'http://127.0.0.1:3000/img/food_pic1.jpg',66,1345,'吃的境界 《中庸》有言在先：“人莫不能饮食也，鲜能知味也。”吃饭是件容易的事，但能吃好的人极为稀少，不知其味，吃了白吃，白痴就是由白吃一词演化而来，所以，您每白吃一顿，就离白痴狠狠进了一步!');
INSERT INTO first_news VALUES(null,'饮食的学问','2018-11-11',
'http://127.0.0.1:3000/img/food_pic2.jpg',89,1545,'清代袁枚说的好：“学问之道，先知而后行，饮食亦然。”那么这世界上到底有多少种味呢？我可以肯定没有人能说全了，就是发扬寓公移山的精神，子子孙孙挨着辈连轴转地吃也说不全、说不完!为什么呢？
自然界能产生气味的物质有20～40万种，一般人所能辨识的有200～400种。中国烹饪采用的调味品可达500种左右。味可分为基本型和复合型两种。基本型有9种：酸、甜、苦、辣、咸、鲜、香、麻、淡。复合型则难以胜计，目前可归纳为50 种左右');
INSERT INTO first_news VALUES(null,'味道有哪些','2018-11-11',
'http://127.0.0.1:3000/img/food_pic3.jpg',34,2345,'自然界能产生气味的物质有20～40万种，一般人所能辨识的有200～400种。中国烹饪采用的调味品可达500种左右。味可分为基本型和复合型两种。基本型有9种：酸、甜、苦、辣、咸、鲜、香、麻、淡。复合型则难以胜计，目前可归纳为50 种左右');

#创建热门食物表
#first_food
#id       INT
#name     VARCHAR(255)
#sale INT
#content   VARCHAR(255)
#img_url  VARCHAR(255)
#price    DECIMAL(10,2) 


CREATE TABLE first_food(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  sale INT,
  content VARCHAR(255),
  img_url VARCHAR(255),
  price DECIMAL(10,2)
  
);
INSERT INTO first_food VALUES(1,'劲爆牛排','66','高温肉汁淋在煎嫩了的牛排,味蕾的顶级碰触体验','http://127.0.0.1:3000/img/food_pic1.jpg',54.00);
INSERT INTO first_food VALUES(2,'鲜美寿司','166','新鲜的三文鱼,软糯弹牙的寿司','http://127.0.0.1:3000/img/food_pic2.jpg',22.00);
INSERT INTO first_food VALUES(3,'美味脆骨','68','香香脆脆吃了还想吃','http://127.0.0.1:3000/img/food_pic3.jpg',25.00);
INSERT INTO first_food VALUES(4,'香脆生煎','386','肉多汁美,十个不够','http://127.0.0.1:3000/img/food_pic4.jpg',12.00);
INSERT INTO first_food VALUES(5,'温馨烧麦','606','皮薄馅多,汁水丰满','http://127.0.0.1:3000/img/food_pic5.jpg',11.50);
INSERT INTO first_food VALUES(6,'寿司套餐','266','多达十种寿司搭配,值得一试','http://127.0.0.1:3000/img/food_pic6.jpg',25.00);

#创建全部食物列表
#first_allfood
#id        INT
#familyid   INT  #1热销 #2早餐  #3正餐  #4西餐 #饮品
#name     VARCHAR(255)
#sale INT
#content   VARCHAR(255)
#img_url  VARCHAR(255)
#price    DECIMAL(10,2) 

CREATE TABLE first_allfood(
  id INT PRIMARY KEY AUTO_INCREMENT,
  familyid INT, 
  name VARCHAR(255),
  sale INT,
  content VARCHAR(255),
  img_url VARCHAR(255),
  price DECIMAL(10,2)
);

INSERT INTO first_allfood VALUES(null,1,'劲爆牛排','66','高温肉汁淋在煎嫩了的牛排,味蕾的顶级碰触体验','http://127.0.0.1:3000/img/food_pic1.jpg',54.00);
INSERT INTO first_allfood VALUES(null,1,'美味脆骨','68','香香脆脆吃了还想吃','http://127.0.0.1:3000/img/food_pic3.jpg',25.00);
INSERT INTO first_allfood VALUES(null,1,'寿司套餐','266','多达十种寿司搭配,值得一试','http://127.0.0.1:3000/img/food_pic6.jpg',25.00);
INSERT INTO first_allfood VALUES(null,1,'爱的煎蛋','806','天天吃鸡蛋,健健康康','http://127.0.0.1:3000/img/food_pic7.jpg',2.00);
INSERT INTO first_allfood VALUES(null,1,'猕猴桃汁','116','新鲜猕猴桃,鲜榨','http://127.0.0.1:3000/img/food_pic19.jpg',24.00);
INSERT INTO first_allfood VALUES(null,1,'劲爆牛排','66','高温肉汁淋在煎嫩了的牛排,味蕾的顶级碰触体验','http://127.0.0.1:3000/img/food_pic1.jpg',54.00);
INSERT INTO first_allfood VALUES(null,1,'美味脆骨','68','香香脆脆吃了还想吃','http://127.0.0.1:3000/img/food_pic3.jpg',25.00);
INSERT INTO first_allfood VALUES(null,1,'寿司套餐','266','多达十种寿司搭配,值得一试','http://127.0.0.1:3000/img/food_pic6.jpg',25.00);
INSERT INTO first_allfood VALUES(null,1,'爱的煎蛋','806','天天吃鸡蛋,健健康康','http://127.0.0.1:3000/img/food_pic7.jpg',2.00);
INSERT INTO first_allfood VALUES(null,1,'猕猴桃汁','116','新鲜猕猴桃,鲜榨','http://127.0.0.1:3000/img/food_pic19.jpg',24.00);
INSERT INTO first_allfood VALUES(null,2,'香脆生煎','386','肉多汁美,十个不够','http://127.0.0.1:3000/img/food_pic4.jpg',12.00);
INSERT INTO first_allfood VALUES(null,2,'温馨烧麦','606','皮薄馅多,汁水丰满','http://127.0.0.1:3000/img/food_pic5.jpg',11.50);
INSERT INTO first_allfood VALUES(null,2,'爱的煎蛋','806','天天吃鸡蛋,健健康康','http://127.0.0.1:3000/img/food_pic7.jpg',2.00);
INSERT INTO first_allfood VALUES(null,2,'好吃的鸡蛋饼','406','营养搭配,早餐必备','http://127.0.0.1:3000/img/food_pic8.jpg',8.00);
INSERT INTO first_allfood VALUES(null,2,'一小笼','506','皮薄馅多,汁水丰满','http://127.0.0.1:3000/img/food_pic9.jpg',11.00);
INSERT INTO first_allfood VALUES(null,2,'香脆生煎','386','肉多汁美,十个不够','http://127.0.0.1:3000/img/food_pic4.jpg',12.00);
INSERT INTO first_allfood VALUES(null,2,'温馨烧麦','606','皮薄馅多,汁水丰满','http://127.0.0.1:3000/img/food_pic5.jpg',11.50);
INSERT INTO first_allfood VALUES(null,2,'爱的煎蛋','806','天天吃鸡蛋,健健康康','http://127.0.0.1:3000/img/food_pic7.jpg',2.00);
INSERT INTO first_allfood VALUES(null,2,'好吃的鸡蛋饼','406','营养搭配,早餐必备','http://127.0.0.1:3000/img/food_pic8.jpg',8.00);
INSERT INTO first_allfood VALUES(null,2,'一小笼','506','皮薄馅多,汁水丰满','http://127.0.0.1:3000/img/food_pic9.jpg',11.00);
INSERT INTO first_allfood VALUES(null,3,'美味脆骨','68','香香脆脆吃了还想吃','http://127.0.0.1:3000/img/food_pic3.jpg',25.00);
INSERT INTO first_allfood VALUES(null,3,'红烧肉','48','好吃不腻...','http://127.0.0.1:3000/img/food_pic10.jpg',28.00);
INSERT INTO first_allfood VALUES(null,3,'糖醋排骨','88','香!甜!脆!试过都说好好吃','http://127.0.0.1:3000/img/food_pic11.jpg',30.00);
INSERT INTO first_allfood VALUES(null,3,'盐焗鸡块','28','香香的鸡块,大家都喜欢','http://127.0.0.1:3000/img/food_pic12.jpg',22.00);
INSERT INTO first_allfood VALUES(null,3,'美味脆骨','68','香香脆脆吃了还想吃','http://127.0.0.1:3000/img/food_pic3.jpg',25.00);
INSERT INTO first_allfood VALUES(null,3,'红烧肉','48','好吃不腻...','http://127.0.0.1:3000/img/food_pic10.jpg',28.00);
INSERT INTO first_allfood VALUES(null,3,'糖醋排骨','88','香!甜!脆!试过都说好好吃','http://127.0.0.1:3000/img/food_pic11.jpg',30.00);
INSERT INTO first_allfood VALUES(null,3,'盐焗鸡块','28','香香的鸡块,大家都喜欢','http://127.0.0.1:3000/img/food_pic12.jpg',22.00);
INSERT INTO first_allfood VALUES(null,4,'寿司套餐','266','多达十种寿司搭配,值得一试','http://127.0.0.1:3000/img/food_pic6.jpg',25.00);
INSERT INTO first_allfood VALUES(null,4,'三文鱼寿司','166','新鲜的三文鱼,软糯弹牙的寿司','http://127.0.0.1:3000/img/food_pic2.jpg',22.00);
INSERT INTO first_allfood VALUES(null,4,'牛肉寿司','136','新鲜的牛肉,软糯弹牙的寿司','http://127.0.0.1:3000/img/food_pic13.jpg',22.00);
INSERT INTO first_allfood VALUES(null,4,'三文鱼寿司','166','新鲜的三文鱼,软糯弹牙的寿司','http://127.0.0.1:3000/img/food_pic2.jpg',22.00);
INSERT INTO first_allfood VALUES(null,4,'三文鱼寿司','166','新鲜的三文鱼,软糯弹牙的寿司','http://127.0.0.1:3000/img/food_pic2.jpg',22.00);
INSERT INTO first_allfood VALUES(null,4,'牛肉寿司','136','新鲜的牛肉,软糯弹牙的寿司','http://127.0.0.1:3000/img/food_pic13.jpg',22.00);
INSERT INTO first_allfood VALUES(null,4,'牛肉寿司','136','新鲜的牛肉,软糯弹牙的寿司','http://127.0.0.1:3000/img/food_pic13.jpg',22.00);
INSERT INTO first_allfood VALUES(null,5,'劲爆牛排','66','高温肉汁淋在煎嫩了的牛排,味蕾的顶级碰触体验','http://127.0.0.1:3000/img/food_pic1.jpg',54.00);
INSERT INTO first_allfood VALUES(null,5,'盐焗皮皮虾','46','细细的盐撒在嫩嫩的虾上,赞','http://127.0.0.1:3000/img/food_pic14.jpg',64.00);
INSERT INTO first_allfood VALUES(null,5,'椒盐鲑鱼','26','鱼肉香甜,脆脆的口感','http://127.0.0.1:3000/img/food_pic16.jpg',44.00);
INSERT INTO first_allfood VALUES(null,5,'大龙虾','16','约会必备,好看又好吃','http://127.0.0.1:3000/img/food_pic17.jpg',64.00);
INSERT INTO first_allfood VALUES(null,5,'劲爆牛排','66','高温肉汁淋在煎嫩了的牛排,味蕾的顶级碰触体验','http://127.0.0.1:3000/img/food_pic1.jpg',54.00);
INSERT INTO first_allfood VALUES(null,5,'盐焗皮皮虾','46','细细的盐撒在嫩嫩的虾上,赞','http://127.0.0.1:3000/img/food_pic14.jpg',64.00);
INSERT INTO first_allfood VALUES(null,5,'三明治','46','营养搭配,好吃的哟','http://127.0.0.1:3000/img/food_pic15.jpg',24.00);
INSERT INTO first_allfood VALUES(null,6,'新鲜草莓汁','96','新鲜草莓,鲜榨','http://127.0.0.1:3000/img/food_pic18.jpg',24.00);
INSERT INTO first_allfood VALUES(null,6,'猕猴桃汁','116','新鲜猕猴桃,鲜榨','http://127.0.0.1:3000/img/food_pic19.jpg',24.00);
INSERT INTO first_allfood VALUES(null,6,'蓝色生死恋','396','谁不想来一杯呢?','http://127.0.0.1:3000/img/food_pic20.jpg',34.00);
INSERT INTO first_allfood VALUES(null,6,'新鲜草莓汁','96','新鲜草莓,鲜榨','http://127.0.0.1:3000/img/food_pic18.jpg',24.00);
INSERT INTO first_allfood VALUES(null,6,'猕猴桃汁','116','新鲜猕猴桃,鲜榨','http://127.0.0.1:3000/img/food_pic19.jpg',24.00);
INSERT INTO first_allfood VALUES(null,6,'蓝色生死恋','396','谁不想来一杯呢?','http://127.0.0.1:3000/img/food_pic20.jpg',34.00);
INSERT INTO first_allfood VALUES(null,6,'新鲜草莓汁','96','新鲜草莓,鲜榨','http://127.0.0.1:3000/img/food_pic18.jpg',24.00);
INSERT INTO first_allfood VALUES(null,6,'猕猴桃汁','116','新鲜猕猴桃,鲜榨','http://127.0.0.1:3000/img/food_pic19.jpg',24.00);
INSERT INTO first_allfood VALUES(null,6,'蓝色生死恋','396','谁不想来一杯呢?','http://127.0.0.1:3000/img/food_pic20.jpg',34.00);

#创建购物车表
#first_cart
#id     编号
#count  数量
#pid    商品编号
#uid    用户编号

#SELECT id,count,price,name,pid,uid
#FROM  xz_cart
#WHERE  uid = ?
# pno2-029282823-

CREATE TABLE first_cart(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  pid INT,
  count INT
);
INSERT INTO first_cart VALUES(null,1,1,1);
INSERT INTO first_cart VALUES(null,1,2,2);

#分析:查询购物信息
#[id,uid,count],[name,price]
#first_cart            first_product
#多表查询套路
#-将所有表名保存FROM 后
#FROM first_cart,first_product
#-为每一张表起一个别名
#FROM first_cart c,first_food f
#-查找两张表1个列有关系(= != <= >= )
#WHERE  c.pid = f.id 

#SELECT c.uid,c.id,c.count,f.price,f.name FROM first_cart c,first_product f WHERE  c.pid = f.id 

