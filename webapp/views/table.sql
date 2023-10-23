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

update images set post_image_num=1 where num = 1;
update images set post_image_num=1 where num = 2;
update images set post_image_num=1 where num = 3;
update images set post_image_num=2 where num = 4;
update images set post_image_num=2 where num = 5;
update images set post_image_num=1 where num = 6;

ALTER TABLE images MODIFY post_image_num number not null;
select * from images;


create table maps(
    id number primary key,
    place_name varchar2(500) not null,
    address_name varchar2(1000) not null,
    description varchar2(2000) not null,
    post_num number not null,
    image_num number not null,
    CONSTRAINT post_num foreign key(post_num) references posts (num),
    CONSTRAINT image_num foreign key(image_num) references images (num)
);
select * from maps;

insert into maps values (14969335,'에그옐로우빌딩','서울 관악구 남부순환로 1820','에그 옐로우 제가 정말 좋아합니다. 너무 좋아해서 평일에는 거의 매일같이 이곳에 오는데요, 엘레베이터가 단 세대밖에 없는게 정말 유일한 단점이라면 단점입니다. 한번 놓치면 운이 안좋을시 약 8분까지도 기다려야 하므로 이거 정말 답답해 미칠 노릇입니다.',1,1 );
insert into maps values (14825756,'하이브','서울 용산구 한강대로 42','입이 거친 게 싫다던 너 때문에 화가 나도 욕을 못 하고 너 기대라고 넓혀놓은 내 어깨는 이젠 지하철 속 장애물일 뿐이야  You`re so bad, you know 뻔뻔하게 거짓말로 돌려막고 낯선 향기만 묻혀오니 사랑 따위 하지 말지  그래 오히려 좋지 시원하게 욕이나 뱉지 I swear you never regret it 나만 바보였지  다 뭣 같아 다정했던 사진 속 네 모습이 다 똑같아 이번엔 다를 거라 했었던 말도  Sometime 꺼져버려 제발 But sometimes 네가 보고 싶다',1,2);
insert into maps values (365593020,'IST엔터테인먼트','서울 강남구 언주로172길 8','Ye, shocking roar Don`t call me like that 악이란 걸 누가 정해 욕망을 멈추지도 못한 영원히 용서받지 못한 존재란 금지된 것을 꿈꾸네 ooh-ooh, oh 묶인 내 손발은 자유를 갈구했네 Like animals, oh I`ma get ya (get ya, get ya) 절망 없는 사랑을 꿈꿔 거침이 없던 본능 신의 분노를 샀어 잠재울 수 없는 것 원해 온 것 it`s so raw 누가 감히 아니라고 해, 모두 다 내 것 되리라 타락한 천사라 불리운 이름과 낙원을 등진 채 이제야 내가 자유로워졌어 Ta ta ta ra ra ta 내 것 되리라 Keep it coming like that roar Ta ta ta ra ra ta 내게 오리라 Yeah',1,3);
ALTER TABLE maps add lat varchar(100);
ALTER TABLE maps add longi varchar(100);

update maps set lat='37.4809995507307' , longi='126.952120937856' where id=14969335;
update maps set lat='37.52441065848861' , longi='126.96413891328879' where id=14825756;
update maps set lat='37.52763936784024' , longi='127.03445414724943' where id=365593020;

ALTER TABLE maps MODIFY lat not null;
ALTER TABLE maps MODIFY longi not null;
commit;
