create table users(
    num number primary key,
    user_id varchar(50) not null,
    user_pw varchar(200) not null,
    nickname varchar(200) not null,
    birth date not null,
    user_like_cnt number default 0,
    reg date default sysdate,
    user_name varchar(100) not null
);

--ALTER TABLE Users ADD user_name VARCHAR2(100);

create table posts(
    num number primary key,
    title varchar(500) not null,
    content varchar(2000) not null,
    post_like_cnt number default 0,
    user_num number not null,
    CONSTRAINT user_num foreign key(user_num) references users (num)
);



create table images(
    num number primary key,
    img_url varchar(1000) not null,
    posts_num number not null,
    CONSTRAINT posts_num foreign key(posts_num) references posts (num)
);


--시퀀스 생성
create SEQUENCE users_seq nocache;
create SEQUENCE posts_seq nocache;
create SEQUENCE images_seq nocache;



desc users;
desc posts;
desc images;

insert into users values (users_seq.nextval,'jhj6814','1234','혜지짱','2000-12-12',555,sysdate,'장혜지');
insert into users values (users_seq.nextval,'lj0115','1234','예린짱','2000-12-12',555,sysdate,'이예린');
insert into users values (users_seq.nextval,'rm1113','1234','영림짱','2000-12-12',555,sysdate,'이영림');
insert into users values (users_seq.nextval,'youmi','1234','유미짱','2000-12-12',555,sysdate,'김유미');
insert into users values (users_seq.nextval,'konan7979','1234','창완짱','2000-12-12',555,sysdate,'유창완');

select * from users;

insert into posts values (posts_seq.nextval,'환상고백','어떤숫자가 보이나요? 질문에 답하기만으로 색맹 여부가 드러납니다.', 115, 2);
insert into posts values (posts_seq.nextval,'등대','동해물과 백두산이 마르고 닳도록 하느님이', 914, 1);
insert into posts values (posts_seq.nextval,'등촌칼국수','등칼은 못참지', 333, 4);
insert into posts values (posts_seq.nextval,'홍대입구로 가려면 어떻게 해야해요?','뉴진스의 하입보이요', 113, 3);

select * from posts;

insert into images values (images_seq.nextval,'https://image.jtbcplus.kr/data/contents/jam_photo/202107/06/56e64df7-f456-4d2c-8b10-85618f297063.jpg',1);
insert into images values (images_seq.nextval,'https://i.namu.wiki/i/rd4i5B0r2h2ZY43yt92FKNnU7XW4ijW8dl0h_TI8RG_-ngTKNbFWn1KJQRW_kpXmkUJ-6DAzqdX-Jd8q0hwE1A.webp',2);
insert into images values (images_seq.nextval,'https://blog.kakaocdn.net/dn/xr0iG/btrDrQS6JoT/L2ilf1cuJBrjGCEYXjJvI1/img.png',3);
insert into images values (images_seq.nextval,'https://i.namu.wiki/i/OKTgddWD1-sapikezeudwGoMkjTukW_e989mT2sbNSYb7scPEh8IRXoFmc7xSDOIaq7CZhHCKeM0btxWL1c-zQ.webp',1);
insert into images values (images_seq.nextval,'https://spnimage.edaily.co.kr/images/Photo/files/NP/S/2020/11/PS20111400275.jpg',2);
insert into images values (images_seq.nextval,'https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202308/03/9f2025fe-1819-42a3-b5c1-13032da70bc8.jpg',4);

ALTER TABLE posts ADD reg date default sysdate;
ALTER TABLE images ADD post_image_num number;

update images set post_image_num=1,post_image_num=1 where num = 1;
update images set post_image_num=2,post_image_num=1 where num = 2;
update images set post_image_num=3,post_image_num=1 where num = 3;
update images set post_image_num=1,post_image_num=2 where num = 4;
update images set post_image_num=2,post_image_num=2 where num = 5;
update images set post_image_num=4,post_image_num=1 where num = 6;

--insert into images values (images_seq.nextval,'../resources/static/img/theboyz.gif',1,3);

ALTER TABLE images MODIFY post_image_num number not null;
select * from images;