-- 회원 INSERT
INSERT INTO J_MEMBER
VALUES('IAM','나다','1234','JEJUGAJA','ilovejeju@naver.com','010-3333-3333','남성',SYSDATE);

INSERT INTO J_MEMBER
VALUES('AnotherUsername','다나','5678','JEJU','anotheremail@naver.com','010-4444-4444','여성',SYSDATE);

INSERT INTO J_MEMBER
VALUES('ThirdUser','라마','9876','GAJA','thirduser@naver.com','010-5555-5555','남성',SYSDATE);

INSERT INTO J_MEMBER
VALUES('UserFour','바사','1357','JEJA','userfour@naver.com','010-6666-6666','여성',SYSDATE);

INSERT INTO J_MEMBER
VALUES('FinalUser','사아','2468','JUGA','finaluser@naver.com','010-7777-7777','남성',SYSDATE);

-- 호스트 INSERT
INSERT INTO HOST
VALUES('host123','김호스트','123456','kimho','010-0000-0000','010-1111-1111','여성','hohoho@naver.com','123','사진'
,SYSDATE,SYSDATE,SYSDATE);

-- 숙소 INSERT
INSERT INTO ROOM
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'host123', '코지하우스', '애월~~~101호', 4, 150000,'이미지', '오션뷰', '체크인 시간 1시 체크아웃 2시입니다~~ 좋지요?', 0, 0);

INSERT INTO ROOM
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'host123', '펜션뷰', '제주시~~~201호', 2, 100000,'이미지', '펜션뷰', '체크인 시간 3시 체크아웃 11시입니다~~~', 0, 0);

INSERT INTO ROOM
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'host123', '호텔스타', '서귀포시~~~301호', 3, 200000,'이미지', '시티뷰', '체크인 시간 2시 체크아웃 12시입니다~~~', 0, 0);
-- 장바구니 INSERT
INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,1,'IAM','2023-08-05','2023-08-26',4);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,1,'IAM','2023-08-06','2023-08-27',1);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,1,'IAM','2023-08-07','2023-08-28',3);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,1,'UserFour','2023-08-08','2023-08-29',2);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,1,'IAM','2023-08-05','2023-08-26',1);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,22,'IAM','2023-08-06','2023-08-27',2);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,21,'IAM','2023-08-07','2023-08-28',2);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,21,'UserFour','2023-08-08','2023-08-29',3);

SELECT * FROM ROOM;
SELECT * FROM HOST;
SELECT * FROM J_MEMBER;
SELECT * FROM CART;

DELETE FROM CART;

select * from (select rownum as rnum,b.*
from (SELECT c.checkin ,c.checkout ,r.rm_name, r.price
FROM cart c
JOIN room r ON c.rm_no = r.rm_no
WHERE c.MID = 'IAM'
ORDER BY c.cno DESC) b
where rownum <= 5 * 1)
where rnum > 0 ;

select * from cart 
order by cno desc;

SELECT c.checkin ,c.checkout ,r.rm_name, r.price
FROM cart c
JOIN room r ON c.rm_no = r.rm_no
ORDER BY c.cno DESC;

DELETE FROM CART WHERE cno = 2;
DELETE FROM CART WHERE mid = 'UserFour';

SELECT c.checkin ,c.checkout ,r.rm_name, r.price
FROM cart c
JOIN room r ON c.rm_no = r.rm_no;

SELECT m.name, m.mphone, r.rm_name, r.location, r.price, r.notice,c.checkin, c.checkout, c.guest, c.cno
FROM cart c
JOIN room r
ON c.rm_no = r.rm_no
JOIN j_member m
ON c.mid = m.mid
WHERE cno = 49;

ALTER TABLE cart
ADD guest Int;

commit;
