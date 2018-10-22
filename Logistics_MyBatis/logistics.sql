drop database if exists distribution;
create database distribution;
use distribution;


drop table if exists ecs_User;
create table ecs_User
(
	userId nvarchar(10) primary key not null comment '用户组编号',
	username nvarchar(10) not null comment '用户组名称',
	note nvarchar(50) comment '备注'
)default charset = utf8;


drop table if exists ecs_Consumer;
create table ecs_Consumer
(
	cId nvarchar(10) primary key not null comment '消费者ID',
	name nvarchar(10) comment '姓名',
	sex int comment '性别',
	userId nvarchar(10) comment '用户组ID',
	pwd nvarchar(10) comment '密码',
	phone nvarchar(20) comment '联系电话',
	birthday datetime comment '出生日期',
	address nvarchar(50) comment '地址',
	note nvarchar(50) comment '备注',
	foreign key(userId) references ecs_User(userId)
)default charset = utf8;

drop table if exists ecs_Orders;
create table ecs_Orders
(
	oId nvarchar(10) primary key not null comment '订单ID',
	oType int comment '订单类型',
	handover nvarchar(10) comment '交接单编号',
	name nvarchar(20) comment '货物名称',
	weight int comment '货物重量',
	youjiren nvarchar(20) comment '邮寄人',
	maddress nvarchar(20) comment '邮寄地址',
	saddress nvarchar(20) comment '收货地址',
	ostate int comment '订单状态',
	mphone nvarchar(20) comment '邮寄人电话',
	consignee nvarchar(20) comment '收货人',
	cphone nvarchar(20) comment '收货电话',
	startcity nvarchar(10) comment '起始地址',
	middlecity nvarchar(10) comment '中点地址',
	endcity nvarchar(10) comment '终点地址',
	sprice decimal(18,0) comment '运送价格',
	pprice decimal(18,0) comment '配送价格',
	yprice decimal(18,0) comment'运输价格',
	zprice nvarchar(10) comment '总价格',
	vehicle nvarchar(10) comment '车辆',
	note nvarchar(50) comment '备注'
)default charset = utf8;


drop table if exists ecs_Provinces;
create table ecs_Provinces
(
	pId nvarchar(10) primary key not null comment '省份ID',
	pname nvarchar(10) comment '省份名称'
)default charset = utf8;


drop table if exists ecs_City;
create table ecs_City
(
	cId nvarchar(10) primary key not null comment '城市ID',
	cName nvarchar(10) comment '城市名称',
	provincesID nvarchar(10) comment '省份ID',
	foreign key(provincesID) references ecs_Provinces(pId)
)default charset = utf8;


drop table if exists ecs_Route;
create table ecs_Route
(
	cId nvarchar(10) primary key not null comment '路线编号',
	cname nvarchar(10) comment '路线名称',
	pstartId nvarchar(10) comment '起始省份编号',
	cstartId nvarchar(10) comment '起始城市编号',
	pmiddleId nvarchar(10) comment '中点省份编号',
	cmiddleId nvarchar(10) comment '中点城市编号',
	pendId nvarchar(10) comment '终点省份编号',
	cendId nvarchar(10) comment '终点城市编号',
	yprice decimal(18,0) comment '运输价格',
	note nvarchar(50) comment '备注',
	foreign key(pstartId) references ecs_Provinces(pId),
	foreign key(pmiddleId) references ecs_Provinces(pId),
	foreign key(pendId) references ecs_Provinces(pId),
	foreign key(cstartId) references ecs_City(cId),
	foreign key(cmiddleId) references ecs_City(cId),
	foreign key(cendId) references ecs_City(cId)
)default charset = utf8;


drop table if exists ecs_Vehicle;
create table ecs_Vehicle
(
	vId nvarchar(10) primary key not null comment '车辆编号',
	vmodel nvarchar(10) comment '车辆型号',
	origin nvarchar(10) comment '产地',
	route nvarchar(10) comment '路线编号',
	productionday datetime comment '生产日期',
	purchaseday datetime comment '购买日期',
	note nvarchar(50) comment '备注',
	foreign key(route) references ecs_Route(cId)
)default charset = utf8;


drop table  if exists ecs_CityAreas;
create table ecs_CityAreas
(
 	aId nvarchar(10) primary key not null comment '区域ID',
 	aName nvarchar(50) comment '区域名称',
 	cityID nvarchar(50) comment '城市ID',
 	foreign key(cityID) references ecs_City(cId)
)default charset = utf8;

drop table if exists ecs_Admin;
create table ecs_Admin
(
	adminID nvarchar(10) primary key not null comment '管理员编号',
	name nvarchar(10) comment '姓名',
	sex int comment '性别',
	userID nvarchar(10) comment '用户组编号',
	astate int comment '状态',
	acity nvarchar(10) comment '所在城市',
	address nvarchar(10) comment '地址',
	pwd nvarchar(10) comment '密码',
	aphone nvarchar(20) comment '联系电话',
	note nvarchar(50) comment '备注',
	foreign key(userID) references ecs_User(userId)
)default charset = utf8;

drop table if exists ecs_Receipt;
create table ecs_Receipt
(
	startcity nvarchar(10) primary key not null comment '起点城市',
	endcity nvarchar(10) comment '终点城市',
	arrivedcity nvarchar(10) comment '已到城市',
	cstate int comment '状态',
	generateday datetime comment '生成时间',
	note nvarchar(50) comment '备注'
)default charset = utf8;

drop table if exists ecs_Distribution;
create table ecs_Distribution
(
	dId int primary key not null comment '配送点ID',
	dname nvarchar(10) comment '配送点名称',
	pid nvarchar(10) comment '省份ID',
	cid nvarchar(10) comment '城市ID',
	aid nvarchar(10) comment '管理员ID',
	phone nvarchar(20) comment '联系电话',
	address nvarchar(50) comment '地址',
	note nvarchar(50) comment '备注',
	foreign key(pid) references ecs_Provinces(pId),
	foreign key(cid) references ecs_City(cId),
	foreign key(aid) references ecs_Admin(adminID)
)default charset = utf8;

drop table if exists ecs_DisScope;
create table ecs_DisScope
(
	areasId int primary key not null comment '配送区域ID',
	areasname nvarchar(10) comment '配送区域名称',
	aprice decimal(18,0) comment '配送价格',
	cId nvarchar(10) comment '所属城市ID',
	note nvarchar(50) comment '备注',
	foreign key(cId) references ecs_City(cId)
)default charset = utf8;



