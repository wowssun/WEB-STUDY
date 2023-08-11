-- 예약
CREATE TABLE YEYAK
(
	-- 예약번호
	yno varchar2(50) NOT NULL,
	-- 회원 아이디
	mid varchar2(30) NOT NULL,
	-- 호스트 아이디
	hid varchar2(30) NOT NULL,
	-- 숙소번호
	rm_no number NOT NULL,
	-- 결제번호
	payno varchar2(50) NOT NULL,
	-- 예약체크인
	ye_checkin date NOT NULL,
	-- 예약체크아웃
	ye_checkout date NOT NULL,
	-- 예약인원수
	ye_guest number NOT NULL,
	PRIMARY KEY (yno)
);

ALTER TABLE YEYAK
	ADD FOREIGN KEY (hid)
	REFERENCES HOST (hid)
;

ALTER TABLE YEYAK
	ADD FOREIGN KEY (mid)
	REFERENCES J_MEMBER (mid)
;
ALTER TABLE YEYAK
	ADD FOREIGN KEY (payno)
	REFERENCES PAYMENT (payno)
;
ALTER TABLE YEYAK
	ADD FOREIGN KEY (rm_no)
	REFERENCES ROOM (rm_no)
;



-- 결제정보
CREATE TABLE PAYMENT
(
	-- 결제번호
	payno varchar2(50) NOT NULL,
	-- 카드사
	card_name varchar2(30) NOT NULL,
	-- 카드번호
	card_num varchar2(50) NOT NULL,
	-- 결제금액
	amount number NOT NULL,
	-- 결제일시
	pay_date date NOT NULL,
	-- 취소일시
	pay_candate date,
	PRIMARY KEY (payno)
);



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
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'host123', '코지하우스', 4, 150000,'이미지', '오션뷰', '체크인 시간 1시 체크아웃 2시입니다~~ 좋지요?', 0, 0,'경기도','파주시','이미지2','이미지3');

INSERT INTO ROOM
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'host123', '펜션뷰', 2, 100000,'이미지', '펜션뷰', '체크인 시간 3시 체크아웃 11시입니다~~~', 0, 0,'대전광역시','둔산동','이미지2','이미지3');

INSERT INTO ROOM
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'host123', '호텔스타',  3, 200000,'이미지', '시티뷰', '체크인 시간 2시 체크아웃 12시입니다~~~', 0, 0,'서울특별시','마포구','이미지2','이미지3');

INSERT INTO ROOM
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'host123', '코지하우스', 4, 150000,'pocha.png', '오션뷰', '체크인 시간 1시 체크아웃 2시입니다~~ 좋지요?', 0, 0,'경기도','파주시','이미지2','이미지3');

INSERT INTO ROOM
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'host123', '호텔스타',  3, 200000,'jjangu.jpg', '시티뷰', '체크인 시간 2시 체크아웃 12시입니다~~~', 0, 0,'서울특별시','마포구','이미지2','이미지3');

-- 장바구니 INSERT
INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,1,'IAM','2023-08-05','2023-08-26',4);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,2,'IAM','2023-08-06','2023-08-27',1);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,3,'IAM','2023-08-07','2023-08-28',3);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,3,'UserFour','2023-08-08','2023-08-29',2);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,2,'IAM','2023-08-05','2023-08-26',1);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,1,'IAM','2023-08-06','2023-08-27',2);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,2,'IAM','2023-08-07','2023-08-28',2);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,3,'UserFour','2023-08-08','2023-08-29',3);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,4,'IAM','2023-08-05','2023-08-26',4);

INSERT INTO CART
VALUES(SEQ_CART_cno.NEXTVAL,5,'IAM','2023-08-05','2023-08-26',4);

-- 예약 INSERT

INSERT INTO YEYAK
VALUES('12345','IAM','host123',3,'10101','2023-08-08','2023-08-29','3');

INSERT INTO YEYAK
VALUES('15151','IAM','host123',3,'14141414','2023-08-26','2023-08-29','3');

-- 결제정보 payment
INSERT INTO PAYMENT
VALUES('10101','신한','2020-3030-44',122222,'2023-08-07','');

INSERT INTO PAYMENT
VALUES('14141414','신한','2020-3030-44',122222,'SYSDATE(SYSDATE,'YYYY-MM-DD HH24:MI:SS')','');

SELECT * FROM ROOM;
SELECT * FROM HOST;
SELECT * FROM J_MEMBER;
SELECT * FROM CART;
SELECT * FROM YEYAK;
SELECT * FROM PAYMENT;

-- delete  절대 건들지마!!!
DELETE FROM PAYMENT;
DELETE FROM YEYAK;
DELETE FROM CART;
DROP TABLE CART;
DROP TABLE YEYAK;

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

SELECT m.name, r.rm_name, r.price,y.ye_checkin, y.ye_checkout, c.guest, c.cno
FROM yeyak y
JOIN room r
ON y.rm_no = r.rm_no
WHERE cno = 49;

-- 회원 예약목록
SELECT r.img, r.rm_name, r.price,y.ye_checkin, y.ye_checkout, y.ye_guest
FROM yeyak y
JOIN room r
ON y.rm_no = r.rm_no
WHERE mid = 'IAM'
ORDER BY y.ye_checkin DESC;

-- 호스트 예약목록
SELECT r.img, r.rm_name, r.price,y.ye_checkin, y.ye_checkout, y.ye_guest
FROM yeyak y
JOIN room r
ON y.rm_no = r.rm_no
WHERE y.hid = 'host123'
ORDER BY y.ye_checkin DESC;

-- 회원 예약 상세조회
-- 예약번호, 예약자 이름, 예약자 전화번호, 호스트 닉네임, 호스트 전화번호, 환불 정책, 숙소 공지사항, 숙소명, 숙소주소1 ,주소2, 예약인원수,체크인
-- 체크아웃 날짜, 총 결제 금액, 결제 정보 (카드사, 카드번호-카드번호는 뒤에 4자리만 나오게?), 결제일시, 결제번호
SELECT y.yno,m.name,m.mphone,h.hnick,h.hphone,r.notice,r.rm_name,r.addr1, r.addr2, y.ye_guest,y.ye_checkin,y.ye_checkout,r.price,p.payno,p.card_name,p.card_num,p.pay_date,p.pay_candate
FROM yeyak y
JOIN j_member m
ON y.mid = m.mid
JOIN host h
ON y.hid = h.hid
JOIN room r
ON y.rm_no = r.rm_no
JOIN payment p
ON y.payno = p.payno
WHERE y.yno = '12345';

-- 호스트 예약 상세조회
-- 예약번호, 예약자 이름, 예약자 전화번호, 호스트 닉네임, 호스트 전화번호, 환불 정책, 숙소 공지사항, 숙소명, 숙소주소1 ,주소2, 예약인원수,체크인
-- 체크아웃 날짜, 총 결제 금액, 결제 정보 ( 카드사, 카드번호), 결제일시, 결제번호
SELECT y.yno,m.name,m.mphone,h.hnick,h.hphone,r.notice,r.rm_name,r.addr1, r.addr2, y.ye_guest,y.ye_checkin,y.ye_checkout,r.price,p.pay_date,p.pay_candate
FROM yeyak y
JOIN j_member m
ON y.mid = m.mid
JOIN host h
ON y.hid = h.hid
JOIN room r
ON y.rm_no = r.rm_no
JOIN payment p
ON y.payno = p.payno
WHERE y.yno = '12345';

SELECT COUNT(*) FROM yeyak WHERE hid ='host123';

UPDATE payment
SET card_num = '1234567891203456'
where card_num ='2020-3030-44';

DROP TABLE YE_CANCEL CASCADE CONSTRAINTS;
DROP TABLE PAYMENT CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_YE_CANCEL_ycno;

SELECT r.img, r.rm_name, r.price, y.yno,y.ye_checkin, y.ye_checkout, y.ye_guest, p.pay_date
FROM yeyak y
JOIN room r
ON y.rm_no = r.rm_no
JOIN payment p
ON y.payno = p.payno 
WHERE mid = 'IAM'
ORDER BY y.ye_checkin;

UPDATE payment
SET pay_candate = sysdate
WHERE payno = '16265247';


commit;


-- 트리거 만들기
CREATE OR REPLACE TRIGGER payment_cancel_trigger
AFTER UPDATE OF pay_candate ON PAYMENT
FOR EACH ROW
WHEN (NEW.pay_candate IS NOT NULL)
BEGIN
    -- 예약 정보를 장바구니 테이블에 백업 저장
    INSERT INTO CART (cno, rm_no, mid, checkin, checkout, guest)
    SELECT seq_cart_cno.NEXTVAL, y.rm_no, y.mid, y.ye_checkin, y.ye_checkout, y.ye_guest
    FROM YEYAK y
    WHERE y.payno = :OLD.payno;

    -- 예약 테이블에서 해당 예약 삭제
    DELETE FROM YEYAK
    WHERE payno = :OLD.payno;
END;


