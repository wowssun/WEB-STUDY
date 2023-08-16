--- 계정 생성 ---
CREATE USER jejuOseyo IDENTIFIED BY 1111;

--- 권한 부여---
GRANT CONNECT, RESOURCE, DBA TO jejuOseyo;


/* Create Sequences */
CREATE SEQUENCE SEQ_CART_cno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_FREE_free_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_REVIEW_rev_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_RGG_rgg_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ROOM_rm_no INCREMENT BY 1 START WITH 1;


/* Create Tables */
-- 숙소 찜
CREATE TABLE RGG
(
	-- 찜 번호
	rgg_no number NOT NULL,
	-- 회원 아이디
	mid varchar2(30) NOT NULL,
	-- 숙소번호
	rm_no number NOT NULL,
	-- 체크인 날짜
	rcheckin date NOT NULL,
	-- 체크아웃 날짜
	rcheckout date NOT NULL,
	-- 예약인원수
	rpeople number NOT NULL,
	PRIMARY KEY (rgg_no)
);

-- 장바구니
CREATE TABLE CART
(
	-- 장바구니 번호
	cno number NOT NULL,
	-- 숙소번호
	rm_no number NOT NULL,
	-- 회원 아이디
	mid varchar2(30) NOT NULL,
	-- 체크인 날짜
	checkin date NOT NULL,
	-- 체크아웃 날짜
	checkout date NOT NULL,
	-- 예약인원수
	guest int NOT NULL,
	PRIMARY KEY (cno)
);


-- 호스트
CREATE TABLE HOST
(
	-- 호스트 아이디
	hid varchar2(50) NOT NULL,
	-- 대표자명
	rep varchar2(50) NOT NULL,
	-- 비밀번호
	hpw varchar2(50) NOT NULL,
	-- 닉네임
	hnick varchar2(50) NOT NULL UNIQUE,
	-- 전화번호
	hphone varchar2(50) NOT NULL,
	-- 대표번호
	dnumber varchar2(50) NOT NULL,
	-- 이메일
	hemail varchar2(50) NOT NULL,
	-- 사업자번호
	crnum varchar2(100) NOT NULL,
	-- 사진
	photo varchar2(50) NOT NULL,
	-- 신청일자
	reg_date date DEFAULT SYSDATE NOT NULL,
	-- 처리상태
	proc_state varchar2(20) DEFAULT '대기' NOT NULL,
	-- 처리일자
	proc_date date,
	PRIMARY KEY (hid)
);


-- 회원
CREATE TABLE J_MEMBER
(
	-- 회원 아이디
	mid varchar2(30) NOT NULL,
	-- 이름
	name varchar2(30) NOT NULL,
	-- 비밀번호
	mpw varchar2(30) NOT NULL,
	-- 닉네임
	mnick varchar2(30) NOT NULL UNIQUE,
	-- 이메일
	memail varchar2(30) NOT NULL,
	-- 전화번호
	mphone varchar2(30) NOT NULL,
	-- 가입일자
	reg_date date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (mid)
);


-- 여행메이트
CREATE TABLE MATE
(
	-- 게시글 번호
	mno number NOT NULL,
	-- 닉네임
	mnick varchar2(30) NOT NULL UNIQUE,
	-- 게시글 제목
	mtitle varchar2(50) NOT NULL,
	-- 게시글 조회수
	mhit number NOT NULL,
	-- 여행 출발일
	depart date NOT NULL,
	-- 여행 마지막일
	fin date NOT NULL,
	-- 여행장소
	mplace varchar2(200) NOT NULL,
	-- 참가인원
	mnum number NOT NULL,
	-- 게시글 내용
	mtext varchar2(4000) NOT NULL,
	-- 게시글 작성일자
	mdate date NOT NULL,
	PRIMARY KEY (mno)
);


-- 여행메이트 신청
CREATE TABLE MATEAPPLY
(
	-- 목록 번호
	ano number NOT NULL,
	-- 닉네임
	mnick varchar2(30) NOT NULL UNIQUE,
	-- 게시글 번호
	mno number NOT NULL,
	-- 신청내역 상태값
	mnow varchar2(20) NOT NULL,
	PRIMARY KEY (ano)
);


-- 여행메이트 댓글
CREATE TABLE MATECM
(
	-- 댓글 번호
	mcmno number NOT NULL,
	-- 게시글 번호
	mno number NOT NULL,
	-- 닉네임
	mnick varchar2(30) NOT NULL UNIQUE,
	-- 댓글 내용
	mcmtext varchar2(100) NOT NULL,
	-- 댓글 작성일자
	mcmdate date NOT NULL,
	PRIMARY KEY (mcmno)
);


-- 여행메이트 위시리스트(찜)
CREATE TABLE MATEWISH
(
	-- 위시리스트 번호
	mwno number NOT NULL,
	-- 게시글 번호
	mno number NOT NULL,
	-- 회원 아이디
	mid varchar2(30) NOT NULL,
	PRIMARY KEY (mwno)
);


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

-- 리뷰
CREATE TABLE REVIEW
(
	-- 리뷰번호
	rev_no number NOT NULL,
	-- 회원 아이디
	mid varchar2(30) NOT NULL,
	-- 숙소번호
	rm_no number NOT NULL,
	-- 작성일자
	 reg_date date NOT NULL,
	-- 별점
	star number NOT NULL,
	-- 제목
	title varchar2(40) NOT NULL,
	-- 내용
	content varchar2(400) NOT NULL,
	PRIMARY KEY (rev_no)
);


-- 숙소
CREATE TABLE ROOM
(
	-- 숙소번호
	rm_no number NOT NULL,
	-- 호스트 아이디
	hid varchar2(30) NOT NULL,
	-- 숙소명
	rm_name varchar2(20) NOT NULL,
	-- 위치
	location varchar2(100) NOT NULL,
	-- 최대수용인원
	people number NOT NULL,
	-- 가격
	price number NOT NULL,
	-- 이미지
	img varchar2(20) NOT NULL,
	-- 소개글
	memo varchar2(400),
	-- 공지사항
	notice varchar2(400),
	-- 리뷰개수
	rv_cnt number NOT NULL,
	-- 별점 총합
	star_total number NOT NULL,
	PRIMARY KEY (rm_no)
);


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

-- 자유게시판
CREATE TABLE free (
	-- 게시글 번호
	free_no  	NUMBER PRIMARY KEY,
	-- 작성자
	mid		VARCHAR2(30) NOT NULL
             REFERENCES j_member(mid) ON DELETE CASCADE,
	-- 제목
	free_title	VARCHAR2(100) 	NOT NULL,
	-- 내용
	free_content	VARCHAR2(4000)	NOT NULL,
	-- 작성일
	reg_date 	DATE,
	-- 조회수
	free_hit 	NUMBER,
	-- 작성자 ip
	ip		VARCHAR2(20)
);




/* Create Foreign Keys */

ALTER TABLE ROOM
	ADD FOREIGN KEY (hid)
	REFERENCES HOST (hid)
;


ALTER TABLE YEYAK
	ADD FOREIGN KEY (hid)
	REFERENCES HOST (hid)
;


ALTER TABLE CART
	ADD FOREIGN KEY (mid)
	REFERENCES J_MEMBER (mid)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (mid)
	REFERENCES J_MEMBER (mid)
;


ALTER TABLE RGG
	ADD FOREIGN KEY (mid)
	REFERENCES J_MEMBER (mid)
;


ALTER TABLE YEYAK
	ADD FOREIGN KEY (mid)
	REFERENCES J_MEMBER (mid)
;


ALTER TABLE YEYAK
	ADD FOREIGN KEY (payno)
	REFERENCES PAYMENT (payno)
;


ALTER TABLE CART
	ADD FOREIGN KEY (rm_no)
	REFERENCES ROOM (rm_no)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (rm_no)
	REFERENCES ROOM (rm_no)
;


ALTER TABLE RGG
	ADD FOREIGN KEY (rm_no)
	REFERENCES ROOM (rm_no)
;


ALTER TABLE YEYAK
	ADD FOREIGN KEY (rm_no)
	REFERENCES ROOM (rm_no)
;


/*테이블 다 만들고 나서 이거 하면 됨*/
/*`room` 테이블의 `location` 컬럼 삭제*/
ALTER TABLE room
DROP COLUMN location;
/*`room` 테이블에 컬럼 추가*/
ALTER TABLE room
ADD addr1 VARCHAR2(100);
ALTER TABLE room
ADD addr2 VARCHAR2(100);
ALTER TABLE room
ADD img2 VARCHAR2(100);
ALTER TABLE room
ADD img3 VARCHAR2(100);


/*데이터타입 변경*/
ALTER TABLE room MODIFY rm_name VARCHAR2(50 BYTE);
ALTER TABLE room MODIFY img VARCHAR2(100 BYTE);



/* yeyak 트리거 */
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

/*REVIEW 트리거 3개 생성 쿼리*/
CREATE OR REPLACE TRIGGER trigger_review
AFTER INSERT
ON review
FOR EACH ROW
BEGIN
    UPDATE room SET rv_cnt = rv_cnt + 1 WHERE rm_no = :NEW.rm_no;
    UPDATE room SET star_total = star_total + :NEW.star WHERE rm_no = :NEW.rm_no;
END;

CREATE OR REPLACE TRIGGER trigger_review_update
AFTER UPDATE ON review
FOR EACH ROW
BEGIN
    UPDATE room SET star_total = star_total - :OLD.star + :NEW.star WHERE rm_no = :OLD.rm_no;
END;

CREATE OR REPLACE TRIGGER trigger_review_delete
AFTER DELETE ON review
FOR EACH ROW
BEGIN
    UPDATE room SET rv_cnt = rv_cnt - 1, star_total = star_total - :OLD.star WHERE rm_no = :OLD.rm_no;
END;

CREATE OR REPLACE TRIGGER trigger_review
AFTER INSERT
ON review
FOR EACH ROW
BEGIN
    UPDATE room SET rv_cnt = rv_cnt + 1 WHERE rm_no = :NEW.rm_no;
    UPDATE room SET star_total = star_total + :NEW.star WHERE rm_no = :NEW.rm_no;
END;

CREATE OR REPLACE TRIGGER trigger_review_update
AFTER UPDATE ON review
FOR EACH ROW
BEGIN
    UPDATE room SET star_total = star_total - :OLD.star + :NEW.star WHERE rm_no = :OLD.rm_no;
END;

CREATE OR REPLACE TRIGGER trigger_review_delete
AFTER DELETE ON review
FOR EACH ROW
BEGIN
    UPDATE room SET rv_cnt = rv_cnt - 1, star_total = star_total - :OLD.star WHERE rm_no = :OLD.rm_no;
END;


/*리뷰랑 외래키 잡힌 회원 insert*/
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('aaa123','김땡땡','aaa123!!!','땡벌','aaa123@gmail.com','01037284938',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('admin','손지희','adm123!!!','adadad','minmin@gmail.com','01098543761',to_date('23/08/08','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('jiwon041','박지원','jiwon04123!','지원이','jiwon041@gmail.com','01011112222',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ccc123','김나라','ccc12345$','날','ccc123@daum.com','01022223444',to_date('23/08/10','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ddd123','김밈','ddd12345$','앙','ddd123@daum.com','01011111111',to_date('23/08/10','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('fff123','나다','fff1234^','fff','ilovejeju@naver.com','01033333333',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ddd012','정처녀','ddd01234!','처녀마을','ddd012@naver.com','01055556666',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('eee345','홍길동','eee34567!','길동이','eee345@gmail.com','01066667777',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('fff678','김철수','fff67890!','철이','fff678@naver.com','01077778888',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ggg901','박영희','ggg90123!','영영이','ggg901@gmail.com','01088889999',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('hhh234','이지은','hhh23456!','지지니','hhh234@daum.net','01099990000',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('iii567','김민준','iii56789!','민이','iii567@gmail.com','01010101111',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('jjj890','장미란','jjj89012!','미미','jjj890@naver.com','01012121314',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('qwe123','qwe','qwe12345!','qwe','qwe123@gmail.com','43463104761',to_date('23/08/06','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('zxc123','zxc','zxc12345!','zxc','zxc123@zxc.com','47314916491',to_date('23/08/06','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('bbb456','이말말','bbb45678!','말쟁이','bbb456@gmail.com','01033334444',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ccc789','박호호','ccc78901!','호떡','ccc789@daum.net','01044445555',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('kkk123','김태호','kkk12345!','태태','kkk123@gmail.com','01013141516',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('lll456','이승환','lll45678!','승승이','lll456@naver.com','01016171819',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('mmm789','박정민','mmm78901!','정정이','mmm789@gmail.com','01019202122',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('nnn012','홍길순','nnn01234!','길길이','nnn012@daum.net','01022232425',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('aaaaaa','박후호호','aaaaaa01!','후','aaaaaa@daum.net','01044445555',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ppp678','장서윤','ppp67890!','서서니','ppp678@naver.com','01028293031',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('qqq901','김유진','qqq90123!','유유니','qqq901@gmail.com','01031323334',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('rrr234','이혜진','rrr23456!','혜혜니','rrr234@daum.net','01034353637',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('sss567','송예진','sss56789!','예예니','sss567@gmail.com','01037383940',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ttt890','최진우','ttt89012!','진진이','ttt890@naver.com','01040414243',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('uuu123','윤재원','uuu12345!','재재니','uuu123@gmail.com','01043444546',to_date('23/08/08','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('www789','김준호','www78901!','준준이','www789@gmail.com','01049505152',to_date('23/08/10','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('xxx012','이하늘','xxx01234!','하하니','xxx012@daum.net','01052535455',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('yyy345','장태양','yyy34567!','태태니','yyy345@gmail.com','01055565758',to_date('23/08/12','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('zzz678','김소현','zzz67890!','소소니','zzz678@naver.com','01058596061',to_date('23/08/13','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('aaa901','이동욱','aaa90123!','동동이','aaa901@gmail.com','01061626364',to_date('23/08/14','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ccc567','김현우','ccc56789!','현현이','ccc567@gmail.com','01067686970',to_date('23/08/16','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ddd890','이민우','ddd89012!','민민이','ddd890@naver.com','01070717273',to_date('23/08/17','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('dkdkdk123','아아아','dkdkdk123!','dkdkdk','dkdkdk@gmail.com','01011111111',to_date('23/08/13','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('adf888','adf','aaa123!!!','adf','@','01022222222',to_date('23/08/13','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('jaesung042','김재성','jaesung04234!','재성이','jaesung042@hotmail.com','01033334444',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('sooyeon043','이수연','sooyeon04345!','수연이','sooyeon043@yahoo.com','01055556666',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('minjun044','박민준','minjun04456!','민준이','minjun044@gmail.com','01077778888',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('seoyeon045','김서연','seoyeon04567!','서연이','seoyeon045@hotmail.com','01099990000',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('junwoo046','이준우','junwoo04678!','준우이','junwoo046@yahoo.com','01011112222',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('jiyeon047','김지연','jiyeon04789!','지연이','jiyeon047@gmail.com','01033334444',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('yoonho048','이윤호','yoonho04890!','윤호이','yoonho048@hotmail.com','01055556666',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('jiyoung049','박지영','jiyoung04901!','지영이','jiyoung049@gmail.com','01077778888',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('seokjin050','김석진','seokjin05012!','석진이','seokjin050@yahoo.com','01099990000',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('hyunwoo052','박현우','hyunwoo05234!','현우이','hyunwoo052@hotmail.com','01033334444',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('eunji053','김은지','eunji05345!','은지이','eunji053@yahoo.com','01055556666',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('sangmin054','정상민','sangmin05456!','상민이','sangmin054@gmail.com','01077778888',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('jimin055','이지민','jimin05567!','지민이','jimin055@hotmail.com','01099990000',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('donghae056','김동해','donghae05678!','동해이','donghae056@yahoo.com','01011112222',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('hyejin057','최혜진','hyejin05789!','혜진이','hyejin057@gmail.com','01033334444',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('minseok058','김민석','minseok05890!','민석이','minseok058@hotmail.com','01055556666',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('taehyung060','김태형','taehyung06012!','태형이','taehyung060@yahoo.com','01099990000',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('hello','박으머','hello01!','무호떡','hello@daum.net','01044445555',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('qwerr','박호호','qwerr01!','후라이','qwerr@daum.net','01044445555',to_date('23/08/07','RR/MM/DD'));

/*호스트 insert*/
INSERT INTO JEJUOSEYO.HOST (HID, REP, HPW, HNICK, HPHONE, DNUMBER, HEMAIL, CRNUM, PHOTO, REG_DATE, PROC_STATE, PROC_DATE)
VALUES ('sky123', '김하늘', 'Sunny#2023', '하늘하늘', '01055558888', '0643765489', 'sky123@gmail.com', '2270657449', '12.jpeg', SYSDATE, '승인', SYSDATE);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('kim123','Kim','kim123123!','seaweed','01011111111','01088888888','kim123@naver.com','[object HTMLInputElement]','1.jpeg',to_date('23/08/06','RR/MM/DD'),'거절',to_date('23/08/09','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('hid','hname','hpw12345!!','hnick','01034455432','021113322','djaf@naver.com','2038143363','1',to_date('23/08/04','RR/MM/DD'),'승인',to_date('23/08/04','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('qqq123','qqq','qqq123123!','qqq123','01011111111','01022222222','qqq123@gmail.com','5744400655','2.jpeg',to_date('23/08/09','RR/MM/DD'),'거절',to_date('23/08/09','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('www123','www','www1212!','www123','01011111111','01022222221','www123sdsdsd@naver.com','5744400655','43.jpeg',to_date('23/08/10','RR/MM/DD'),'거절',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('fff123','fff','fff1212!','fff123','01033333333','01044444444','fff123dafafa@daum.com','5744400655','44.jpeg',to_date('23/08/10','RR/MM/DD'),'승인',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('ggg123','ㅇㅇㅇ','ggg123!!!','ggg123','01011111111','01022222222','ggg@naver.com','5744400655','9.jpeg',to_date('23/08/11','RR/MM/DD'),'승인',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('ppp123','ppp','ppp123!!!','ppp123','01011111111','01022222222','ppp123@naver.com','5744400655','a.jpeg',to_date('23/08/11','RR/MM/DD'),'거절',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('bbb123','bbb','bbb123!!!','bbb123','01011111111','01022222222','bbb123@naver.com','5744400655','11.jpeg',to_date('23/08/11','RR/MM/DD'),'거절',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('xxx123','xxx','xxx123!!!','xxx123','01022222222','01033333333','xxx123@naver.com','5744400655','10.jpeg',to_date('23/08/11','RR/MM/DD'),'거절',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('ttt123','ttt','ttt123!!!','ttt123','01022222222','01033333333','ttt123@daum.com','5744400655','7.jpeg',to_date('23/08/11','RR/MM/DD'),'거절',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('vvv123','vvv','vvvvvvvvv','afff','14134134134','13414134141','aaa@aaa.com','5744400655','1.jpeg',to_date('23/08/11','RR/MM/DD'),'거절',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user1','이승훈','P@ssw0rd1','승승승','01012341234','0211223344','user1@example.com','1111111111','1',to_date('23/08/01','RR/MM/DD'),'승인',to_date('23/08/01','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('mnb123','mnb','mnb123!!!','mnb123','01011111111','01022222222','mnb123@naver.com','5744400655','12.jpeg',to_date('23/08/11','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('dhdhdh123','dhdh','dhdhdh123!','dhdh','01011111111','01022222222','@','5744400655','13.jpeg',to_date('23/08/13','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('lee000','이므므','lee0000!','leee','01056783456','01098765432','lee123@','5744400655','2.jpeg',to_date('23/08/14','RR/MM/DD'),'거절',to_date('23/08/14','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jyoung12','정재영','J@y123456','재재재','01077778888','0423344556','jyoung12@example.com','3333333333','3',to_date('23/08/03','RR/MM/DD'),'승인',to_date('23/08/03','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jimin03','한지민','Aa@m1n_2023','지민지민','01012345678','0233445566','jimin03@example.com','4444444444','4',to_date('23/08/04','RR/MM/DD'),'승인',to_date('23/08/04','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('swim99','박태환','Sw!m1ng#','태태태','01020202020','0777888999','swim99@example.com','5555555555','5',to_date('23/08/05','RR/MM/DD'),'승인',to_date('23/08/05','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('glass07','김유리','Gl@ss3s_','유리유리','01011112222','0888999000','glass07@example.com','6666666666','6',to_date('23/08/06','RR/MM/DD'),'승인',to_date('23/08/06','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('minji13','정민지','M!nJ1_2023','민지민지','01033334444','0777888999','minji13@example.com','7777777777','7',to_date('23/08/07','RR/MM/DD'),'승인',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('lov3life','이민정','Lov3L!f3','민정민정','01055556666','0999888777','lov3life@example.com','9999999999','9',to_date('23/08/09','RR/MM/DD'),'승인',to_date('23/08/09','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('sunshine','김태양','Sun@Flower1','태양태양','01012341234','0233445566','sunshine@example.com','1010101010','10',to_date('23/08/10','RR/MM/DD'),'승인',to_date('23/08/10','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('goodvibes','홍길동','GoodVibes1','길동길동','01012341234','0211223344','goodvibes@example.com','1111111111','11',to_date('23/08/11','RR/MM/DD'),'승인',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('adventure','이정재','Adv3ntur3','정재정재','01011112222','0888999000','adventure@example.com','6666666666','15',to_date('23/08/15','RR/MM/DD'),'승인',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('treasure','박민준','Tr3@sur3','민준민준','01033334444','0777888999','treasure@example.com','7777777777','16',to_date('23/08/16','RR/MM/DD'),'승인',to_date('23/08/16','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('luckycharm','김미나','Luckych@rm1','미나미나','01044445555','0888999000','luckycharm@example.com','8888888888','17',to_date('23/08/17','RR/MM/DD'),'승인',to_date('23/08/17','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('happyday','김영희','HappyDay123','영희영희','01012341234','0211223344','happyday@example.com','1111111111','19',to_date('23/08/19','RR/MM/DD'),'승인',to_date('23/08/19','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('moonlight','박서준','MoonL1ght','서준서준','01055558888','0311122334','moonlight@example.com','2222222222','20',to_date('23/08/20','RR/MM/DD'),'승인',to_date('23/08/20','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('dandelion','정지훈','D@nd3l10n','지훈지훈','01077778888','0423344556','dandelion@example.com','3333333333','21',to_date('23/08/21','RR/MM/DD'),'승인',to_date('23/08/21','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('wonderland','한예슬','Wond3rl@nd','예슬예슬','01012345678','0233445566','wonderland@example.com','4444444444','22',to_date('23/08/22','RR/MM/DD'),'승인',to_date('23/08/22','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('dreamcatcher','이해인','Dr3@mC@tch3r','해인해인','01020202020','0777888999','dreamcatcher@example.com','5555555555','23',to_date('23/08/23','RR/MM/DD'),'승인',to_date('23/08/23','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('wanderlust','정우성','W@nd3rlust1','우성우성','01011112222','0888999000','wanderlust@example.com','6666666666','24',to_date('23/08/24','RR/MM/DD'),'승인',to_date('23/08/24','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('captain','박서경','C@pt@in_2023','서경서경','01033334444','0777888999','captain@example.com','7777777777','25',to_date('23/08/25','RR/MM/DD'),'승인',to_date('23/08/25','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('summernights','김윤우','Summ3rN1ghts','윤우윤우','01034566543','0888999000','summernights@example.com','8888888888','26',to_date('23/08/26','RR/MM/DD'),'승인',to_date('23/08/26','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('treasuremap','신동엽','Tr34sur3M@p','동엽동엽','01055556666','0999888777','treasuremap@example.com','9999999999','27',to_date('23/08/27','RR/MM/DD'),'승인',to_date('23/08/27','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('oceanview','김수현','Oc3@nView1','수현수현','01055558888','0311122334','oceanview@example.com','2222222222','29',to_date('23/08/29','RR/MM/DD'),'승인',to_date('23/08/29','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('adventureawaits','김태리','Adv3nture1!','태리태리','01077778888','0423344556','adventureawaits@example.com','3333333333','30',to_date('23/08/30','RR/MM/DD'),'승인',to_date('23/08/30','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('hiddengem','박봄','H!dd3nG3m','봄봄봄','01012345678','0233445566','hiddengem@example.com','4444444444','31',to_date('23/08/31','RR/MM/DD'),'승인',to_date('23/08/31','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('djad38','김문수','moon1298$','moon','01098373729','0647653876','moon38@gmail.com','2270657449','12.jpeg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user123','홍길동','pass123!','길동','01012345678','1234567890','user123@email.com','9876543210','profile.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('host567','이순신','shin567*','순신','01098765432','9876543210','shin@example.com','5555555555','photo.png',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('tester789','박철수','test789#','철수','01056781234','1357924680','tester@example.com','1234567890','test.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('newhost321','강민우','new321$','민우','01098761234','4567890123','minwoo@example.com','0987654321','new_photo.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('johnsmith','김다다','passWord123!','John','01055551111','1111222233','john@example.com','5555555555','john.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('alice88','김우자','alice88$','Alice','01044443333','4444555566','alice@example.com','1234567890','alice.png',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('testhost555','하우나','test555!','Mark','01099998888','5555666777','mark@example.com','9876543210','mark.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('newuser111','나루나','newpass111*','Jane','01012341234','1234567890','jane@example.com','0987654321','jane.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('hoster2000','김우어','robert2000#','Robert','01088882222','2222333344','robert@example.com','5555555555','robert.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user456','김태연','mj43456$','Michael','01077776666','9876543210','michael@example.com','1234567890','mjackson.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('guest123','박지원','guest123!','Jennifer','01022221111','1234567890','jennifer@example.com','0987654321','jennifer.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('host987','이승민','will987#','William','01099991111','1234567890','will@example.com','5555555555','william.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user111','정지우','elizabeth111$','Elizabeth','01055559999','1234567890','elizabeth@example.com','1234567890','elizabeth.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('newhost888','김민주','newhost888*','Charles','01088882222','9876543210','charles@example.com','5555555555','charles.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user222','이서영','emma222$','Emma','01022223333','1234567890','emma@example.com','1234567890','emma.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('host555','김도훈','james555#','James','01055551111','9876543210','james@example.com','5555555555','james.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('newuser999','박서준','newuser999*','Olivia','01099992222','1234567890','olivia@example.com','5555555555','olivia.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('host999','정하윤','joseph999$','Joseph','01099991111','1234567890','joseph@example.com','5555555555','joseph.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user333','김민서','sophia333*','Sophia','01033331111','1234567890','sophia@example.com','1234567890','sophia.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('newhost123','박진영','newhost123!','Emily','01012341234','9876543210','emily@example.com','5555555555','emily.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user444','이소연','oliver444$','Oliver','01044441111','1234567890','oliver@example.com','1234567890','oliver.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('host777','장서연','liam777#','Liam','01077771111','9876543210','liam@example.com','5555555555','liam.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('host111','임지훈','noah111$','Noah','01011113333','9876543210','noah@example.com','5555555555','noah.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('newhost555','이아름','newhost555!','Isabella','01055551111','1234567890','isabella@example.com','5555555555','isabella.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user555','장태우','logan555$','Logan','01055552222','1234567890','logan@example.com','1234567890','logan.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('newuser222','최정우','newuser222*','Mia','01022222222','1234567890','mia@example.com','5555555555','mia.jpg',to_date('23/08/15','RR/MM/DD'),'대기',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('hand123','손지휘','hand123!!!','hand938','01023458332','0647763347','hand123@daum.com','5744400655','IMG_2903.JPG',to_date('23/08/15','RR/MM/DD'),'승인',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('chulsu99','김철수','Chulsu987!','철수철수','01098765432','0987654321','chulsu@example.com','9876543210','14.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('minho777','박민호','Minho123$','민호민호','01037293840','0642849675','minho@example.com','5555555555','15.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jiu_song','송지우','JiuSong12$','지우지우','01083657463','0648273546','jiu@example.com','4444444444','16.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('young_ho','김영호','YhK41234$','영호영호','01092834738','0642827346','young@example.com','3333333333','17.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jiyeongi','이지영','Jiyeong#123','지영지영','01034923839','0641736485','jiyeong@example.com','2222222222','18.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('junho_park','박준호','JhPark789!','준호준호','01074629373','0643729473','junho@example.com','1111111111','19.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('yeongjm45','김영진','YJin#2023','영진영진','01012345678','0123456789','yeongjin@example.com','1234567890','13.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('soomoi654','최수민','CmSoomin123!','수민수민','01098765432','0987654321','soomin@example.com','9876543210','14.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jihye252','이지현','JihyunL33$','지현지현','01055555555','0123456789','jihyun@example.com','5555555555','15.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jihjko3','조지환','Jihwan456#','지환지환','01044444444','0987654321','jihwan@example.com','4444444444','16.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jingg4','강지나','JinaPasswrd1','지나지나','01033333333','0123456789','jina@example.com','3333333333','17.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('hyunjin6','김현진','K!mHyunjin2023','현진현진','01022222222','0987654321','hyunjin@example.com','2222222222','18.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('sangwo4','안상우','Sangwoo!5678','상우상우','01011111111','0123456789','sangwoo@example.com','1111111111','19.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jiyeoj6','김지연','Kim1234#','지연지연','01066666666','0987654321','jiyeon@example.com','6666666666','20.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('seungmi4','이승민','SLee_5678','승민승민','01077777777','0123456789','seungmin@example.com','7777777777','21.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('seojikim2','김서진','Seojin_123!','서진서진','01011112222','0123456789','seojin@example.com','1111222233','23.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('donghpar1','박동해','Donghae5678!','동해동해','01044443333','0987654321','donghae@example.com','4444333322','24.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('yunjchoi65','최윤지','Yunji#2023','윤지윤지','01077776666','0123456789','yunji@example.com','7777666655','25.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('hyunang75','강형준','HJ_Kang123!','형준형준','01055554444','0987654321','hyungjoon@example.com','5555444433','26.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jisoee76','이지수','JisooL_5678','지수지수','01033332222','0123456789','jisoo@example.com','3333222211','27.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('minsen25','안민서','Minseo1234#','민서민서','01077773333','0987654321','minseo@example.com','7777333322','28.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('joonm32','김준혁','Joonhyuk_5678','준혁준혁','01011119999','0123456789','joonhyuk@example.com','1111999988','29.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('eunjho13','조은지','EunjiPass#','은지은지','01055558888','0987654321','eunji@example.com','5555888877','30.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('siwoo7535','김시우','Siwoo2023!','시우시우','01099992222','0123456789','siwoo@example.com','9999222211','31.jpeg',to_date('23/08/15','RR/MM/DD'),'거절',to_date('23/08/15','RR/MM/DD'));




/*숙소 insert*/
-숙소 insert 호스트 아이디 변경하기
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values (SEQ_ROOM_rm_no.NEXTVAL,'sky123','성산펜션',4,270000,'5e315d196c915c8bb0ce1f914551549d1.jpg','뷰가 아름다운 펜션입니다.','바베큐 장소는 따로 없습니다.',0,0,'제주특별자치도 서귀포시 성산읍 신양로122번길 24','102호',null,null);


Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '제주호텔', 2, 200000, '1.jpg', '제주에서 가장 좋은 호텔이에요! 어서오세요', '야외수영장은 7~9월만 운영합니다. 이용비는 별도입니다.', 0, 0, '제주특별자치도 서귀포시 중문관광로301번길 3', '807호', '47.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '제주해변 리조트', 4, 350000, '2.jpg', '해변에서 바로 누릴 수 있는 편안한 휴양 리조트입니다.', '수영복을 가져오세요! 해변에서 놀기 딱 좋아요.', 0, 0, '제주특별자치도 제주시 해안로 123', '1502호', '12.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '제주풍경 호텔', 2, 180000, '3.jpg', '창 밖으로 펼쳐지는 제주의 아름다운 풍경을 감상할 수 있는 호텔입니다.', '객실 내 미니바에서 음료를 제공해드립니다.', 0, 0, '제주특별자치도 제주시 중앙로 456', '905호', '25.jpg', null);


Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '푸른 바다 뷰 호텔', 2, 220000, '21.jpg', '창 밖으로 펼쳐지는 푸른 바다를 감상할 수 있는 호텔입니다.', '바다를 가까이에서 느껴보세요!', 0, 0, '제주특별자치도 제주시 해안로 789', '1001호', '7.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '제주 스카이 빌라', 4, 400000, '22.jpg', '하늘을 향해 뻗어나가는 빌라에서의 특별한 휴가를 즐겨보세요.', '루프탑 빌라에서 멋진 뷰를 감상할 수 있습니다.', 0, 0, '제주특별자치도 서귀포시 하늘로 123', '505호', '9.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '제주 자연휴양 리조트', 6, 300000, '23.jpg', '자연 속에서 힐링을 찾을 수 있는 휴양 리조트입니다.', '리조트 내 자전거 대여 서비스 제공', 0, 0, '제주특별자치도 제주시 자연로 456', '1202호', '18.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '제주 루프빌딩 호텔', 4, 280000, '40.jpg', '도심의 중심에 위치한 편리한 호텔입니다.', '지하 주차장 이용 가능 (유료)', 0, 0, '제주특별자치도 제주시 중앙로 789', '1804호', '32.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '제주힐링 리트리트', 3, 280000, '20.jpg', '자연 속에서 힐링을 찾을 수 있는 특별한 장소입니다.', '스파 서비스 이용 시 10% 할인 혜택 제공', 0, 0, '제주특별자치도 서귀포시 산방로 789', '1103호', '6.jpg', null);


Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '제주 힐사이드 코티지', 2, 260000, '41.jpg', '언덕 위에서 펼쳐지는 멋진 경치를 감상할 수 있는 코티지입니다.', '자연 친화적인 환경 속에서 편안한 휴식을 즐겨보세요.', 0, 0, '제주특별자치도 서귀포시 언덕로 789', '703호', '23.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '제주 아일랜드 리조트', 6, 380000, '42.jpg', '제주 풍경과 함께하는 환상적인 휴양 리조트입니다.', '리조트 내 워터파크 이용 가능 (유료)', 0, 0, '제주특별자치도 제주시 섬로 123', '1503호', '17.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '제주 포레스트 하우스', 4, 320000, '43.jpg', '숲 속에서 편안한 휴식을 즐길 수 있는 특별한 공간입니다.', '별빛 테라스에서 밤하늘 감상 가능', 0, 0, '제주특별자치도 서귀포시 숲길 456', '1101호', '28.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '제주 세레니티 하우스', 3, 290000, '10.jpg', '조용한 마을에서 편안한 휴식을 즐길 수 있는 특별한 공간입니다.', '마을 주변 산책로를 탐험해보세요.', 0, 0, '제주특별자치도 제주시 평화로 789', '802호', '31.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
 (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '제주 블루하우스', 3, 270000, '13.jpg', '아름다운 파란 하늘과 함께하는 조용한 휴식을 제공하는 하우스입니다.', '자전거 대여 서비스 제공', 0, 0, '제주특별자치도 제주시 파랑로 789', '1102호', '37.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '제주 하버뷰 빌라', 4, 330000, '14.jpg', '항구 전망을 누릴 수 있는 특별한 빌라입니다.', '해상 레스토랑에서 식사 가능', 0, 0, '제주특별자치도 서귀포시 항구로 123', '1504호', '19.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '제주 그린파크 리조트', 6, 420000, '15.jpg', '녹지 공원과 함께하는 레크레이션 리조트입니다.', '테니스 코트와 골프 연습장 이용 가능', 0, 0, '제주특별자치도 제주시 녹지로 456', '1802호', '24.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
     (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '제주 빈티지 하우스', 3, 260000, '1.jpg', '유럽의 빈티지 분위기를 느낄 수 있는 특별한 하우스입니다.', '올드 스타일 가구와 조명이 돋보이는 공간', 0, 0, '제주특별자치도 제주시 빈티지로 789', '1102호', '37.jpg', '45.jpg');
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '제주 모던 리조트', 4, 310000, '2.jpg', '현대적인 디자인과 시설을 갖춘 휴양 리조트입니다.', '피트니스 센터 및 스파 시설 이용 가능', 0, 0, '제주특별자치도 서귀포시 모던로 123', '1504호', '19.jpg', '8.jpg');
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '제주 자유로 호스텔', 8, 180000, '3.jpg', '저렴한 가격으로 편안한 공간을 제공하는 호스텔입니다.', '공용 주방 및 라운지 이용 가능', 0, 0, '제주특별자치도 제주시 자유로 456', '1802호', '24.jpg', '11.jpg');

INSERT INTO JEJUOSEYO.ROOM (RM_NO, HID, RM_NAME, PEOPLE, PRICE, IMG, MEMO, NOTICE, RV_CNT, STAR_TOTAL, ADDR1, ADDR2, IMG2, IMG3)
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '제주 즐거운 펜션', 4, 220000, '5.jpg', '자연 속에서 편안한 휴식을 즐길 수 있는 펜션입니다.', '야외 바베큐 시설 완비', 0, 0, '제주특별자치도 제주시 즐거운로 789', '101호', '28.jpg', '15.jpg');

INSERT INTO JEJUOSEYO.ROOM (RM_NO, HID, RM_NAME, PEOPLE, PRICE, IMG, MEMO, NOTICE, RV_CNT, STAR_TOTAL, ADDR1, ADDR2, IMG2, IMG3)
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '제주 해변 뷰 빌라', 6, 320000, '7.jpg', '바다 전망이 멋지며 넓은 공간을 자랑하는 빌라입니다.', '수영장 이용 가능', 0, 0, '제주특별자치도 제주시 해변로 123', 'A동 501호', '32.jpg', '18.jpg');

INSERT INTO JEJUOSEYO.ROOM (RM_NO, HID, RM_NAME, PEOPLE, PRICE, IMG, MEMO, NOTICE, RV_CNT, STAR_TOTAL, ADDR1, ADDR2, IMG2, IMG3)
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '제주 힐링 레트릿', 2, 150000, '9.jpg', '조용한 분위기와 아늑한 공간으로 제주에서의 힐링을 선사합니다.', '조식 제공', 0, 0, '제주특별자치도 제주시 힐링로 789', '302호', '36.jpg', '22.jpg');

INSERT INTO JEJUOSEYO.ROOM (RM_NO, HID, RM_NAME, PEOPLE, PRICE, IMG, MEMO, NOTICE, RV_CNT, STAR_TOTAL, ADDR1, ADDR2, IMG2, IMG3)
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '제주 가족 여행 민박', 5, 180000, '11.jpg', '가족과 함께 편안한 시간을 보낼 수 있는 민박입니다.', '어린이 놀이시설 완비', 0, 0, '제주특별자치도 제주시 가족로 567', '101호', '40.jpg', '26.jpg');

INSERT INTO JEJUOSEYO.ROOM (RM_NO, HID, RM_NAME, PEOPLE, PRICE, IMG, MEMO, NOTICE, RV_CNT, STAR_TOTAL, ADDR1, ADDR2, IMG2, IMG3)
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '제주 럭셔리 리조트', 3, 450000, '13.jpg', '고급스러운 분위기와 최상의 서비스를 제공하는 럭셔리 리조트입니다.', '스파 및 골프 시설 이용 가능', 0, 0, '제주특별자치도 제주시 리조트로 789', 'Suite 2001', '44.jpg', '30.jpg');



/*리뷰 insert*/
Insert into JEJUOSEYO.REVIEW (REV_NO,MID,RM_NO,REG_DATE,STAR,TITLE,CONTENT) values (SEQ_Review_rev_no.NEXTVAL,'qwerr',7,to_date('23/08/01','RR/MM/DD'),4,'만족~','잘 지내다 가요!!');
Insert into JEJUOSEYO.REVIEW (REV_NO,MID,RM_NO,REG_DATE,STAR,TITLE,CONTENT) values (SEQ_Review_rev_no.NEXTVAL,'aaaaaa',61,to_date('23/08/04','RR/MM/DD'),3,'보통','그저 그랬어요 ');
Insert into JEJUOSEYO.REVIEW (REV_NO,MID,RM_NO,REG_DATE,STAR,TITLE,CONTENT) values (SEQ_Review_rev_no.NEXTVAL,'qwerr',12,to_date('23/07/07','RR/MM/DD'),5,'너무좋아','다음에 또 오고싶어요 재방문의사 있음~~');
Insert into JEJUOSEYO.REVIEW (REV_NO,MID,RM_NO,REG_DATE,STAR,TITLE,CONTENT) values (SEQ_Review_rev_no.NEXTVAL,'aaaaaa',7,to_date('23/07/23','RR/MM/DD'),5,'쾌적해요','숙소 청결 상태가 너무 좋아요! 교통도 편리하고 잘 놀다 갑니다');
Insert into JEJUOSEYO.REVIEW (REV_NO,MID,RM_NO,REG_DATE,STAR,TITLE,CONTENT) values (SEQ_Review_rev_no.NEXTVAL,'hello',18,to_date('23/08/07','RR/MM/DD'),5,'굿굿','제주느낌 물씬 나는 숙소에요 뷰도 좋고 다 만족합니다 ㅠ 최고');
-- 1번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'eee345', '1', TO_DATE('2023-07-06 12:08:50', 'YYYY-MM-DD HH24:MI:SS'), '3', '흠', '그냥 그러네요');

-- 2번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'fff678', '2', TO_DATE('2023-07-07 13:15:20', 'YYYY-MM-DD HH24:MI:SS'), '4', '좋아요', '매우 만족스러운 숙소였습니다.');

-- 3번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'ddd012', '3', TO_DATE('2023-07-08 14:22:30', 'YYYY-MM-DD HH24:MI:SS'), '5', '최고입니다', '이 숙소는 정말 훌륭한 선택이었습니다.');

-- 4번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'eee345', '4', TO_DATE('2023-07-09 15:30:40', 'YYYY-MM-DD HH24:MI:SS'), '2', '실망', '기대했던 것만큼 좋지 않았습니다.');

-- 5번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'fff678', '5', TO_DATE('2023-07-10 16:37:50', 'YYYY-MM-DD HH24:MI:SS'), '5', '매우 만족', '숙소가 아주 깨끗하고 편안했습니다.');

-- 6번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'ddd012', '6', TO_DATE('2023-07-11 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), '4', '추천합니다', '다음에도 꼭 다시 방문하고 싶은 곳이네요.');

-- 7번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'eee345', '7', TO_DATE('2023-07-12 18:52:10', 'YYYY-MM-DD HH24:MI:SS'), '5', '만족합니다', '서비스와 시설 모두 완벽했습니다.');

-- 8번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'fff678', '8', TO_DATE('2023-07-13 20:00:20', 'YYYY-MM-DD HH24:MI:SS'), '5', '대만족', '가격에 비해 훌륭한 퀄리티를 가진 숙소입니다.');

-- 9번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'ddd012', '9', TO_DATE('2023-07-14 21:07:30', 'YYYY-MM-DD HH24:MI:SS'), '3', '보통', '평범한 경험이었습니다.');

-- 10번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'eee345', '10', TO_DATE('2023-07-15 22:15:40', 'YYYY-MM-DD HH24:MI:SS'), '4', '좋아요', '가격대비 괜찮은 선택이었습니다.');
-- 1번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'eee345', '11', TO_DATE('2023-07-06 12:08:50', 'YYYY-MM-DD HH24:MI:SS'), '3', '흠', '그냥 그러네요');

-- 2번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'fff678', '12', TO_DATE('2023-07-07 13:15:20', 'YYYY-MM-DD HH24:MI:SS'), '4', '좋아요', '매우 만족스러운 숙소였습니다.');

-- 3번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'ddd012', '13', TO_DATE('2023-07-08 14:22:30', 'YYYY-MM-DD HH24:MI:SS'), '5', '최고입니다', '이 숙소는 정말 훌륭한 선택이었습니다.');

-- 4번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'eee345', '14', TO_DATE('2023-07-09 15:30:40', 'YYYY-MM-DD HH24:MI:SS'), '2', '실망', '기대했던 것만큼 좋지 않았습니다.');

-- 5번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'fff678', '15', TO_DATE('2023-07-10 16:37:50', 'YYYY-MM-DD HH24:MI:SS'), '5', '매우 만족', '숙소가 아주 깨끗하고 편안했습니다.');

-- 6번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'ddd012', '16', TO_DATE('2023-07-11 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), '4', '추천합니다', '다음에도 꼭 다시 방문하고 싶은 곳이네요.');

-- 7번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'eee345', '17', TO_DATE('2023-07-12 18:52:10', 'YYYY-MM-DD HH24:MI:SS'), '5', '만족합니다', '서비스와 시설 모두 완벽했습니다.');

-- 8번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'fff678', '18', TO_DATE('2023-07-13 20:00:20', 'YYYY-MM-DD HH24:MI:SS'), '5', '대만족', '가격에 비해 훌륭한 퀄리티를 가진 숙소입니다.');

-- 9번 데이터
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'ddd012', '19', TO_DATE('2023-07-14 21:07:30', 'YYYY-MM-DD HH24:MI:SS'), '3', '보통', '평범한 경험이었습니다.');




-- 자유게시판 INSERT
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'aaa123', '제주도 관광지 추천', '제주도에서 꼭 가봐야 할 관광지를 소개합니다', 0, SYSDATE);

-- 2
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'jiwon04', '제주도 여행 일정', '제주도 여행을 위한 완벽한 일정을 계획해보세요', 0, SYSDATE);

-- 3
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ccc123', '제주도 맛집 탐방', '제주도의 맛있는 음식을 찾아 헤매는 재미를 느껴보세요', 0, SYSDATE);

-- 4
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ddd123', '제주도 숙소 추천', '제주도에서 편안한 휴식을 위한 숙소를 소개합니다', 0, SYSDATE);

-- 5
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'eee345', '제주도 자연과 함께', '제주도의 아름다운 자연 경관을 즐겨보세요', 0, SYSDATE);

-- 6
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'fff678', '제주도 문화 여행', '제주도의 다채로운 문화와 역사를 탐방해보세요', 0, SYSDATE);

-- 7
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'hhh234', '제주도 해변에서', '제주도의 해변에서 시원한 바다를 만끽하세요', 0, SYSDATE);

-- 8
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'aaaaaa', '제주도 소소한 즐거움', '제주도에서 소소한 행복을 찾아보세요', 0, SYSDATE);

-- 9
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ppp678', '제주도의 특별한 순간', '제주도에서 특별한 순간을 만들어보세요', 0, SYSDATE);

-- 10
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'kkk123', '제주도로 떠나는 여정', '제주도 여행을 통해 새로운 경험을 쌓아보세요', 0, SYSDATE);

-- 11
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'hhh234', '제주도 속소 예약 꿀팁', '제주 여행의 시작, 공항 근처 숙소 예약을 추천합니다. 이동이 편리하며 제주의 밤을 느낄 수 있어요.', 0, SYSDATE);

-- 12
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'fff123', '제주도 이색 경험', '이색 경험을 원한다면 제주 오름 탐방. 제주만의 아름다운 풍경을 즐기며 특별한 추억을 만들어보세요.', 0, SYSDATE);

-- 13
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'aaa123', '제주도 여행 꿀팁', '식사는 현지 음식점에서! 흔하지 않은 향미의 제주 음식을 맛보면 더욱 특별한 여행이 될 거에요.', 0, SYSDATE);

-- 14
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ccc123', '제주도 해변', '여름에는 제주의 해변에서 수영과 해수욕을 즐겨보세요. 맑은 바다가 당신을 기다립니다.', 0, SYSDATE);

-- 15
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'yyy345', '제주 감귤', '제주의 명물 중 하나인 제주 감귤을 손에 쥐어보세요. 신선한 감귤은 여행의 즐거움을 더해줄 거에요.', 0, SYSDATE);

-- 16
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'uuu123', '숙소 추천지', '제주의 아름다운 풍경을 날씨에 구애받지 않고 즐기려면, 오름과 야경명소를 주변 숙소로 선택하세요.', 0, SYSDATE);

-- 17
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'kkk123', '문화와 역사 느끼기', '문화와 역사를 느끼고 싶다면 제주의 민속마을과 박물관을 통해 특별한 시간을 보내보세요.', 0, SYSDATE);

-- 18
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'eee345', '도예 체험 현장', '제주에서 특별한 추억을 남기고 싶다면, 제주 도예체험을 참여해 보세요. 자신만의 작품을 만들어가는 즐거움.', 0, SYSDATE);

-- 19
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'hhh234', '자전거 여행', '자전거 여행을 통해 제주의 자연을 더 가까이 느껴보세요. 바다 바람과 푸른 풍경이 여행을 더욱 풍성하게 만들어줄 거에요.', 0, SYSDATE);

-- 시연용
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'iii567', '야시장 즐기기', '저녁에는 제주의 유명한 야시장을 즐겨보세요. 현지 먹거리와 소품들을 구경하며 특별한 시간을 보낼 수 있을 거에요.', 0, SYSDATE);

INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'aaa123', '제주도 관광지 추천', '제주도에서 꼭 가봐야 할 관광지를 소개합니다', 0, SYSDATE);

-- 2
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'jiwon04', '제주도 여행 일정', '제주도 여행을 위한 완벽한 일정을 계획해보세요', 0, SYSDATE);

-- 3
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ccc123', '제주도 맛집 탐방', '제주도의 맛있는 음식을 찾아 헤매는 재미를 느껴보세요', 0, SYSDATE);

-- 4
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ddd123', '제주도 숙소 추천', '제주도에서 편안한 휴식을 위한 숙소를 소개합니다', 0, SYSDATE);

-- 5
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'eee345', '제주도 자연과 함께', '제주도의 아름다운 자연 경관을 즐겨보세요', 0, SYSDATE);

-- 6
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'fff678', '제주도 문화 여행', '제주도의 다채로운 문화와 역사를 탐방해보세요', 0, SYSDATE);

-- 7
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'hhh234', '제주도 해변에서', '제주도의 해변에서 시원한 바다를 만끽하세요', 0, SYSDATE);

-- 8
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'aaaaaa', '제주도 소소한 즐거움', '제주도에서 소소한 행복을 찾아보세요', 0, SYSDATE);

-- 9
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ppp678', '제주도의 특별한 순간', '제주도에서 특별한 순간을 만들어보세요', 0, SYSDATE);

-- 10
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'kkk123', '제주도로 떠나는 여정', '제주도 여행을 통해 새로운 경험을 쌓아보세요', 0, SYSDATE);

-- 11
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'hhh234', '제주도 속소 예약 꿀팁', '제주 여행의 시작, 공항 근처 숙소 예약을 추천합니다. 이동이 편리하며 제주의 밤을 느낄 수 있어요.', 0, SYSDATE);

-- 12
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'fff123', '제주도 이색 경험', '이색 경험을 원한다면 제주 오름 탐방. 제주만의 아름다운 풍경을 즐기며 특별한 추억을 만들어보세요.', 0, SYSDATE);

-- 13
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'aaa123', '제주도 여행 꿀팁', '식사는 현지 음식점에서! 흔하지 않은 향미의 제주 음식을 맛보면 더욱 특별한 여행이 될 거에요.', 0, SYSDATE);

-- 14
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ccc123', '제주도 해변', '여름에는 제주의 해변에서 수영과 해수욕을 즐겨보세요. 맑은 바다가 당신을 기다립니다.', 0, SYSDATE);

-- 15
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'yyy345', '제주 감귤', '제주의 명물 중 하나인 제주 감귤을 손에 쥐어보세요. 신선한 감귤은 여행의 즐거움을 더해줄 거에요.', 0, SYSDATE);

-- 16
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'uuu123', '숙소 추천지', '제주의 아름다운 풍경을 날씨에 구애받지 않고 즐기려면, 오름과 야경명소를 주변 숙소로 선택하세요.', 0, SYSDATE);

-- 17
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'kkk123', '문화와 역사 느끼기', '문화와 역사를 느끼고 싶다면 제주의 민속마을과 박물관을 통해 특별한 시간을 보내보세요.', 0, SYSDATE);

-- 18
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'eee345', '도예 체험 현장', '제주에서 특별한 추억을 남기고 싶다면, 제주 도예체험을 참여해 보세요. 자신만의 작품을 만들어가는 즐거움.', 0, SYSDATE);

-- 19
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'hhh234', '자전거 여행', '자전거 여행을 통해 제주의 자연을 더 가까이 느껴보세요. 바다 바람과 푸른 풍경이 여행을 더욱 풍성하게 만들어줄 거에요.', 0, SYSDATE);

-- 시연용
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'iii567', '야시장 즐기기', '저녁에는 제주의 유명한 야시장을 즐겨보세요. 현지 먹거리와 소품들을 구경하며 특별한 시간을 보낼 수 있을 거에요.', 0, SYSDATE);