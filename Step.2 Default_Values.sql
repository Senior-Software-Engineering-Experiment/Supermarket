insert into category values(1,' ����Ʒ��');
insert into category values(2,' ʳƷ��');
insert into category values(3,' ������');
insert into category values(4,' ĸӤ��Ʒ��');
insert into category values(5,' �Ҿ���');

insert into location values(1,'1��A��1����');
insert into location values(2,'1��B��2����');
insert into location values(3,'1��C��2����');
insert into location values(4,'2��A��1����');

--�����˺ţ������˺ţ�
insert into adminaccount values('1','11111');
insert into adminlock values('NPU','11111');
insert into fine values('1','30','300');
insert into librarian values ('22222222','00010001','Librarian1','female','13933334444','12345@163.com');
insert into librarian values ('11111111','00010001','Librarian2','male','13944443333','123@qq.com');

--�������������ߣ��������������ߣ�
insert into reader values ('13911112222','��һ','12345678','172582641@qq.com','100');
insert into reader values ('13922221111','���','12345678','172582641@qq.com','100');
--���������������¼�������������Ѽ�¼��
insert into borrow values (5,'13911112222','2020-06-29',true,'2020-06-29',null);
insert into borrow values (6,'13911112222','2020-06-27',true,'2020-06-27',null);

insert into TeamMember values (1,'����Ⱥ','Life is a progress.','images/����Ⱥ.jpg');
insert into TeamMember values (2,'�����','Control what you can Confront what you can''t.','images/�����.jpg');
insert into TeamMember values (3,'�뫘��','Be better than you were yesterday!','images/�뫘��.jpg');
insert into TeamMember values (4,'���','Each man is the architect of his own fate.','images/���.jpg');
insert into TeamMember values (5,'Ŭ�������Ὥ','You make the failure complete when you stop trying.','images/Ŭ�������Ὥ.jpg');
insert into TeamMember values (6,'�����','Look before you leap.First think ,then act.','images/�����.jpg');
insert into TeamMember values (7,'������','Enrich your life today,. yesterday is history.tomorrow is mystery.','images/������.jpg');
insert into TeamMember values (8,'����','The secret of success is constancy to purpose.','images/����.jpg');
insert into TeamMember values (9,'������','There are no shortcuts to any place worth going.','images/������.jpg');


insert into post values (1,'2020-06-27','����ֳ�����ܰ��ʾ','1. �˿���ע�����Բ鿴�Լ������Ѽ�¼��������Ϣ������
2. δע��Ĺ˿�û�в鿴�����¼��Ȩ�ޡ�
3. �˿�ע�����ϵ�ۻ�Ա��','11111111');
insert into post values (2,'2020-06-28','����ֳ�����Ʒ����','Ϊ���õ����������Ϲ˿͵����󣬱�����ʳƷ����Ʒ����20���֣�������ѡ����','11111111');
insert into post values (3,'2020-06-28','�˿�ע����֪','�˿�ע���Ϊ����ֳ��л�Ա����Ҫ�κ��������ã����ۻ�Ա��������д��Ϣ�������ע�ᡣ','11111111');
insert into post values (4,'2020-06-28','��ϵ����','Ϊ�˸��õط���˿ͣ�����ʲô���ⶼ���Ժ�����ȡ����ϵ��','11111111');


insert into book values (1,'����','��ţ','����','��75.0',
						 '2020-05-08','��ţ����Ʒ���޹�˾','������ţ�飬����������','6923644278588','ʳƷ��','1��A��1����');
insert into book values (2,'�����','��ţ','����','��55.0',
						 '2020-06-23','��ţ����Ʒ���޹�˾','����й���','6923644278598','ʳƷ��','1��A��1����');
insert into book values (3,'ȫ�����','����','����','��15.0',
						 '2020-05-08','�������޹�˾','ȫ�󽡿�','6923644278587','ʳƷ��','1��A��1����');
insert into book values (4,'75%�ƾ�����ʪ��','����','����','��29.9',
						 '2020-04-01','�������������Ƽ����޹�˾','�׷������޷Ĳ���ǿ��ȥ��','6971483748977','����Ʒ��','1��B��2����');
insert into book values (5,'ҽ����ƿ��֣��������','��ҽ��','����','��35.0',
						 '2020-03-13','�㶫��ͨ�齺��Ʒ�������޹�˾','����ҽ���޷Ĳ��������޷Ĳ��Ƴ�','6959373807126','����Ʒ��','1��B��2����');

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