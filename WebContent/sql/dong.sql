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
INSERT INTO eated VALUES ('kim','우마이',DATE_ADD(now(), INTERVAL -2 DAY));
INSERT INTO eated VALUES ('kim','닥터로빈','2021-11-29');
INSERT INTO eated VALUES ('kim','우마이','2021-11-28');
INSERT INTO eated VALUES ('kim','닥터로빈','2021-11-27');
INSERT INTO eated VALUES ('kim','우마이','2021-11-26');
INSERT INTO eated VALUES ('kim','닥터로빈','2021-11-25');
INSERT INTO eated VALUES ('kim','전주식당','2021-11-24');
INSERT INTO eated VALUES ('kim','전주식당','2021-11-23');
INSERT INTO eated VALUES ('kim','전주식당','2021-11-22');
INSERT INTO eated VALUES ('kim','고척돈까스','2021-11-21');
INSERT INTO eated VALUES ('kim','고척돈까스','2021-11-20');
INSERT INTO eated VALUES ('kim','고척돈까스','2021-11-19');
INSERT INTO eated VALUES ('kim','우마이','2021-11-18');
select eat from eated where email = 'db@naver.com' and visit between date_add(now(),interval -1 month) and now();
select * from eated;
delete from eated where visit='2021-12-04';

drop table if exists menuplus; 
create table bestFood (
id varchar(20) primary key not null,			-- 식당 구분 번호(타지역과 이름 겹침대비)
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

drop table if exists board; 
CREATE TABLE board (
    num int primary key auto_increment not null,
    username varchar(20),
    title varchar(20),
    memo longtext,
    password varchar(45),
    shop varchar(100),
    time varchar(45),
    hit int(11) NULL DEFAULT 0,
    ref int(11),
    indent int(11),
    step int(11),
    nlist varchar(45)
);

INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (2,'kim','첫 테스트입니다.','된장찌개를 좋아하는 사람',1234,2,1, '1f','시골집');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (3,'kim','따뜻한 집밥이 먹고싶은 사람?.','어머니의 손맛이 생각나는 사람',1234,2,1, 'koreafood','시골집');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (4,'kim','불맛이 나는 중식','짬뽕에 불맛이 들어가있고 탕수육 튀김옷이 미쳤습니다.',1234,2,1, 'chinafood','홍콩반점');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (5,'kim','한 뚝배기 하실례예?','가성비가 좋은 식당. 부대찌개가 특히 맛있습니다.',1234,2,1, 'koreafood','부대통령뚝배기');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (6,'kim','추억의 일식 맛집','평범한 카레가 아닌 황금 카레 약간 매운맛에 계란국과 같이 먹으면 살살 녹았다. 다먹고나면 우마이!',1234,2,1, 'japanfood','우마이');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (7,'ryu','아저씨들이 찾는 식당','첫 외관은 들어가기 힘들다. 하지만 음식을 맛보면 여긴 맛집이다. 아저씨 입맛이라면 무조건 가자',1234,2,1, 'koreafood','전주식당');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (8,'ryu','밥최몇 테스트','불백이랑 먹다보면 두그릇은 뚝딱 먹는다. 살찌고 싶은 사람은 무조건 가봐',1234,2,1, 'koreafood','시골집');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (9,'kim','옛날 돈까스 맛집','난 돈까스 위에 소스 부어진거 싫어하는데 뭔가 여기꺼는 먹게 되네? 너무많아서 다 못먹을정도야!',1234,2,1, 'japanfood','고척돈까스');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (10,'choi','여기 추천 맛집 다녀온 후기푼다','얼마나 맛있겠냐는 생각으로 다녀왔는데 진짜 믿을만한거같다 정말 푸짐하고 맛있었어',1234,2,1, 'koreafood','시골집');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (11,'kim','교내 배달 vs 가게','학교에서 시켜먹을때는 맛 없었거든? 근데 가서먹으니까 맛있네 ',1234,2,1, 'chinafood','전가복');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (12,'choi','소개팅하기 좋은곳','소개팅해서 성공했엉!!! 여기서 다들 소개팅해봐!!',1234,2,1, 'datefood','닐리');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (13,'kim','같이 국밥먹을 국밥충 구함','순대국밥은 여기 고정이다. 뜨끈뜨끈 따끈따끈',1234,2,1, 'koreafood','할매순대');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (14,'lee','저도 여기 다녀왔습니다','제가 김치를 안먹는데 진짜 김치뺴고 다먹었어요 싹 비웠습니다',1234,2,1, 'koreafood','시골집');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (15,'ji','생각보다 별로...','저는 생각보다 맛이 없었습니다. 뭔가 딱 옛 음식 먹는거 같긴한데 위생이 좀...',1234,2,1, 'koreafood','시골집');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (16,'ryu','대학가 앞 미팅하기 좋은 곳','음식 메뉴랑 분위기랑 여기랑 잘 어울리는거 같음',1234,2,1, 'datefood','303place');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (17,'dong','눈물날뻔한 맛','난 지방에서 왔는데 진짜 엄마 손맛이 그리웠거든? 진짜 여기서 먹으니까 고향생각나더라',1234,2,1, 'koreafood','시골집');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (18,'kim','분식이 생각나는 사람?','분식은 여기가 최고인거 같음. 김떡비 조합은 미쳤음',1234,2,1, 'koreafood','김떡비');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (19,'kim','배달후기','배달비가 좀 있는 편. 짬뽕 맛은 그대로 맛있었고 탕수육도 최고였음. 단점으로는 배달기사가 군만두를 실수로 누락시킴 ',1234,2,1, 'chinafood','홍콩반점');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (20,'ryu','부대통령 대통령하자','대통령급 푸짐함 대통령급 맛 설명 생략',1234,2,1, 'koreafood','부대통령뚝배기');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (21,'kim','How 마라? 말 마라','마라탕 매니아들은 학교앞에 마라탕 있어!! 여기도 맛있다고!',1234,2,1, 'chinafood','하우마라');
INSERT INTO board(num, username, title, memo, password,hit, ref, nlist,shop) VALUES (22,'ryu','변함없는거 인증 맛도 꾸준함','다시 먹어도 배터집니다. 사장님도 너무 친절해요!!',1234,2,1, 'koreafood','시골집');
select * from board;
select * from board WHERE shop LIKE '시골집' order by username desc limit 10