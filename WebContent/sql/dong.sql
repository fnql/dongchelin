DROP SCHEMA IF EXISTS `study`;
CREATE SCHEMA `study` DEFAULT CHARACTER SET utf8 ;
use study;

drop table if exists member;
create table member (
	email varchar(100) primary key not null,
    pw varchar(20),
    mfx varchar(10), -- 성별 male,female
    name varchar(50), -- 별명
    best varchar(100),
    myself varchar(200),
    admin varchar(20) default 'user' -- 추후에 바꿈
);

INSERT INTO member VALUES ('db@naver.com','1234','male','류','한식','저는 컴공입니다','admin');
INSERT INTO member VALUES ('kim','1234','female','팡민','양식','저는 양식을 좋아해요','user');

select * from member;

drop table if exists eated;
create table eated (
	email varchar(100) not null,
    eat varchar(100),
    visit date
    
);
INSERT INTO eated VALUES ('db@naver.com','시골집',DATE_ADD(now(), INTERVAL -1 DAY));
INSERT INTO eated VALUES ('db@naver.com','우마이',DATE_ADD(now(), INTERVAL -2 DAY));
INSERT INTO eated VALUES ('kim','우마이', '2021-11-18');
INSERT INTO eated VALUES ('kim','시골집','2021-11-19');
INSERT INTO eated VALUES ('kim','전주식당', '2021-11-20');
INSERT INTO eated VALUES ('kim','전주식당', '2021-11-17');
INSERT INTO eated VALUES ('kim','전주식당', '2021-11-21');
INSERT INTO eated VALUES ('kim','고척돈까스','2021-11-22');
INSERT INTO eated VALUES ('kim','고척돈까스','2021-11-16');
INSERT INTO eated VALUES ('kim','고척돈까스','2021-11-14');
INSERT INTO eated VALUES ('kim','고척돈까스','2021-11-15');
INSERT INTO eated VALUES ('kim','고척돈까스', '2021-11-23');
INSERT INTO eated VALUES ('kim','닥터로빈','2021-11-24');
INSERT INTO eated VALUES ('kim','닥터로빈','2021-11-28');
select * from eated where email='db@naver.com';

drop table if exists menuplus; 
create table bestFood (
id varchar(20) primary key not null,				-- 식당 구분 번호(타지역과 이름 겹침대비)
name varchar(20),									-- 식당 상호명
foodType varchar(20),								-- 식당 음식 종류(한식,일식...)
price int,											-- 평균가격
dayOff varchar(20) default 'X',						-- 휴무일(2,4번째주 수요일 - 2,4 수)
good varchar(30),									-- 추천메뉴
stars int default 0,								-- 별점
dist int,											-- 거리(3호관 기준)
visit date default "2021-05-05",					-- 최근 방문날짜(어제= 1, 엊그제= 2)
tel varchar(20)										-- 식당 전화번호
 );
 
INSERT INTO bestFood VALUES (1,'닥터로빈','이탈리아',18000,'X','버섯크림리조또',4.5,644,"2021-01-16",'02-2066-8211');
INSERT INTO bestFood VALUES (2,'전주식당','한식',6000,'명절','비빔밥',4.1,144,"2021-05-05",'02-2686-9254');
INSERT INTO bestFood VALUES (3,'부대통령뚝배기','한식',5500,'X','부대찌개',4.6,40,"2021-06-10",'02-2614-8266');
INSERT INTO bestFood VALUES (4,'우마이','일식',8000,'X','규동',4.6,55,"2021-05-14",'02-2066-6685');
INSERT INTO bestFood VALUES (5,'고척돈까스','분식',7000,'일','고척돈까스',4.3,260,"2021-03-02",'02-2685-8080');

CREATE TABLE board (
    seq int primary key auto_increment not null,
    user_name varchar(20),
    title varchar(30),
    typing longtext
);

INSERT INTO board(user_name, title, typing) VALUES ('홍길동','자유게시판입니다','글을 입력해주세요');