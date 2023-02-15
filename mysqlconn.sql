show databases;
show tables;
drop table test;
create table member(
id varchar(50) not null primary key,
passwd varchar(16) not null,
name varchar(10) not null,
reg_date datetime not null
);

drop table member;

insert into member(id, passwd, name, reg_date)
value('kingdora@dragon.com','1234','김개동', now());


insert into member(id, passwd, name, reg_date)
value('hongkd@aaa.com','1111','홍길동', now());


select * from member;

create table test(
num_id int not null primary key auto_increment,
title varchar(50) not null,
content text not null
);

create table board(
num int not null primary key auto_increment,
writer varchar(10) not null,
email varchar(30),
subject varchar(50) not null,
passwd varchar(12) not null,
reg_date datetime not null,
readcount int default 0,
ref int not null,
re_step smallint not null,
re_level smallint not null,
content text not null,
ip varchar(20) not null
);
drop table board;



INSERT INTO `basicjsp`.`board`
(`num`, `writer`,`email`,`subject`,`passwd`,`reg_date`,`readcount`,`ref`,`re_step`,`re_level`,`content`,`ip`)
VALUES
(NULL,
"관리자","admin@kingdora.com","게시판 사용에 대해","1234",sysdate(),0,1,0,0,
"지구어를 사용해 주시기 바랍니다. 바른말 고운말 사용",
"127.0.0.1");



grant create table, create sequence to system;

create sequence board_seq
start with 10001
increment by 1
minvalue 10001
cache 10;

grant alter, select on board_seq to system

drop sequence board_seq
select * from BOARD;

insert into member(id, passwd, name, reg_date)
value('one@aaa.com','1111','홍길동', now());

insert into member(id, passwd, name, reg_date)
value('two@aaa.com','1111','홍길동', now());

insert into member(id, passwd, name, reg_date)
value('three@aaa.com','1111','홍길동', now());

insert into member(id, passwd, name, reg_date)
value('four@aaa.com','1111','홍길동', now());

insert into member(id, passwd, name, reg_date)
value('five@aaa.com','1111','홍길동', now());

insert into member(id, passwd, name, reg_date)
value('six@aaa.com','1111','홍길동', now());

insert into member(id, passwd, name, reg_date)
value('seven@aaa.com','1111','홍길동', now());

insert into member(id, passwd, name, reg_date)
value('eight@aaa.com','1111','홍길동', now());

insert into member(id, passwd, name, reg_date)
value('nine@aaa.com','1111','홍길동', now());

insert into member(id, passwd, name, reg_date)
value('ten@aaa.com','1111','홍길동', now());


commit