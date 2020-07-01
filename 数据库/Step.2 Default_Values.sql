insert into category values(1,' 日用品类');
insert into category values(2,' 食品类');
insert into category values(3,' 服饰类');
insert into category values(4,' 母婴用品类');
insert into category values(5,' 家具类');

insert into location values(1,'1层A区1货架');
insert into location values(2,'1层B区2货架');
insert into location values(3,'1层C区2货架');
insert into location values(4,'2层A区1货架');

--超管账号（经理账号）
insert into adminaccount values('1','11111');
insert into adminlock values('NPU','11111');
insert into fine values('1','30','300');
insert into librarian values ('22222222','00010001','Librarian1','female','13933334444','12345@163.com');
insert into librarian values ('11111111','00010001','Librarian2','male','13944443333','123@qq.com');

--插入了两名读者（插入两名消费者）
insert into reader values ('13911112222','林一','12345678','172582641@qq.com','100');
insert into reader values ('13922221111','李二','12345678','172582641@qq.com','100');
--插入了两条借书记录（插入两条消费记录）
insert into borrow values (5,'13911112222','2020-06-29',true,'2020-06-29',null);
insert into borrow values (6,'13911112222','2020-06-27',true,'2020-06-27',null);

insert into TeamMember values (1,'方亚群','Life is a progress.','images/方亚群.jpg');
insert into TeamMember values (2,'刘广厚','Control what you can Confront what you can''t.','images/刘广厚.jpg');
insert into TeamMember values (3,'冯珮瑶','Be better than you were yesterday!','images/冯珮瑶.jpg');
insert into TeamMember values (4,'吴军','Each man is the architect of his own fate.','images/吴军.jpg');
insert into TeamMember values (5,'努尔麦麦提江','You make the failure complete when you stop trying.','images/努尔麦麦提江.jpg');
insert into TeamMember values (6,'阳玉洁','Look before you leap.First think ,then act.','images/阳玉洁.jpg');
insert into TeamMember values (7,'唐悦宁','Enrich your life today,. yesterday is history.tomorrow is mystery.','images/唐悦宁.jpg');
insert into TeamMember values (8,'王娜','The secret of success is constancy to purpose.','images/王娜.jpg');
insert into TeamMember values (9,'吴婷婷','There are no shortcuts to any place worth going.','images/吴婷婷.jpg');


insert into post values (1,'2020-06-27','玛尔沃超市温馨提示','1. 顾客在注册后可以查看自己的消费记录并进行信息反馈。
2. 未注册的顾客没有查看购物记录的权限。
3. 顾客注册可联系售货员。','11111111');
insert into post values (2,'2020-06-28','玛尔沃超市商品上新','为更好地满足广大新老顾客的需求，本超市食品类商品上新20余种，等你来选购！','11111111');
insert into post values (3,'2020-06-28','顾客注册须知','顾客注册成为玛尔沃超市会员不需要任何手续费用，在售货员帮助下填写信息即可完成注册。','11111111');
insert into post values (4,'2020-06-28','联系我们','为了更好地服务顾客，您有什么问题都可以和我们取得联系。','11111111');


insert into book values (1,'纯甄','蒙牛','国产','￥75.0',
						 '2020-05-08','蒙牛乳制品有限公司','纯正生牛乳，轻享慢发酵','6923644278588','食品类','1层A区1货架');
insert into book values (2,'真果粒','蒙牛','国产','￥55.0',
						 '2020-06-23','蒙牛乳制品有限公司','真的有果粒','6923644278598','食品类','1层A区1货架');
insert into book values (3,'全麦面包','盼盼','国产','￥15.0',
						 '2020-05-08','盼盼有限公司','全麦健康','6923644278587','食品类','1层A区1货架');
insert into book values (4,'75%酒精消毒湿巾','德佑','国产','￥29.9',
						 '2020-04-01','河南逸祥卫生科技有限公司','亲肤柔软无纺布，强力去菌','6971483748977','日用品类','1层B区2货架');
insert into book values (5,'医用外科口罩（灭菌级）','顾医生','国产','￥35.0',
						 '2020-03-13','广东汇通乳胶制品集团有限公司','采用医用无纺布和熔喷无纺布制成','6959373807126','日用品类','1层B区2货架');

INSERT INTO income VALUES('2020-5-03',200,40560);
INSERT INTO income VALUES('2020-5-04',250,60502);
INSERT INTO income VALUES('2020-5-05',210,30508);
INSERT INTO income VALUES('2020-5-06',189,32360);
INSERT INTO income VALUES('2020-5-07',220,50863);
INSERT INTO income VALUES('2020-5-08',152,20001);
INSERT INTO income VALUES('2020-5-09',200,52030);
INSERT INTO income VALUES('2020-5-10',203,53452);
INSERT INTO income VALUES('2020-5-11',205,50640);
INSERT INTO income VALUES('2020-5-12',211,60003);
INSERT INTO income VALUES('2020-5-13',300,80132);
INSERT INTO income VALUES('2020-5-14',263,78935);
INSERT INTO income VALUES('2020-5-15',135,29683);
INSERT INTO income VALUES('2020-5-16',185,32958);
INSERT INTO income VALUES('2020-5-17',340,109635);
INSERT INTO income VALUES('2020-5-18',120,26835);
INSERT INTO income VALUES('2020-5-19',220,75236);
INSERT INTO income VALUES('2020-5-20',210,59968);
INSERT INTO income VALUES('2020-5-21',198,40952);
INSERT INTO income VALUES('2020-5-22',245,85096);
INSERT INTO income VALUES('2020-5-23',200,69987);
INSERT INTO income VALUES('2020-5-24',206,67259);
INSERT INTO income VALUES('2020-5-25',178,43064);
INSERT INTO income VALUES('2020-5-26',231,85302);
INSERT INTO income VALUES('2020-5-27',234,83998);
INSERT INTO income VALUES('2020-5-28',199,59986);
INSERT INTO income VALUES('2020-5-29',219,65489);
INSERT INTO income VALUES('2020-5-30',99,10599);
INSERT INTO income VALUES('2020-5-31',245,99999);
INSERT INTO income VALUES('2020-4-30',2750,300000);
INSERT INTO income VALUES('2020-3-31',3850,300000);
INSERT INTO income VALUES('2020-2-28',4150,300000);
INSERT INTO income VALUES('2020-1-31',365,90000);
INSERT INTO income VALUES('2019-11-30',3750,90000);
INSERT INTO income VALUES('2019-12-31',3950,99000);
INSERT INTO income VALUES('2019-10-01',223,9800);