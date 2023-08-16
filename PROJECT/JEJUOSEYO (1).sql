--- ���� ���� ---
CREATE USER jejuOseyo IDENTIFIED BY 1111;

--- ���� �ο�---
GRANT CONNECT, RESOURCE, DBA TO jejuOseyo;


/* Create Sequences */
CREATE SEQUENCE SEQ_CART_cno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_FREE_free_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_REVIEW_rev_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_RGG_rgg_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_ROOM_rm_no INCREMENT BY 1 START WITH 1;


/* Create Tables */
-- ���� ��
CREATE TABLE RGG
(
	-- �� ��ȣ
	rgg_no number NOT NULL,
	-- ȸ�� ���̵�
	mid varchar2(30) NOT NULL,
	-- ���ҹ�ȣ
	rm_no number NOT NULL,
	-- üũ�� ��¥
	rcheckin date NOT NULL,
	-- üũ�ƿ� ��¥
	rcheckout date NOT NULL,
	-- �����ο���
	rpeople number NOT NULL,
	PRIMARY KEY (rgg_no)
);

-- ��ٱ���
CREATE TABLE CART
(
	-- ��ٱ��� ��ȣ
	cno number NOT NULL,
	-- ���ҹ�ȣ
	rm_no number NOT NULL,
	-- ȸ�� ���̵�
	mid varchar2(30) NOT NULL,
	-- üũ�� ��¥
	checkin date NOT NULL,
	-- üũ�ƿ� ��¥
	checkout date NOT NULL,
	-- �����ο���
	guest int NOT NULL,
	PRIMARY KEY (cno)
);


-- ȣ��Ʈ
CREATE TABLE HOST
(
	-- ȣ��Ʈ ���̵�
	hid varchar2(50) NOT NULL,
	-- ��ǥ�ڸ�
	rep varchar2(50) NOT NULL,
	-- ��й�ȣ
	hpw varchar2(50) NOT NULL,
	-- �г���
	hnick varchar2(50) NOT NULL UNIQUE,
	-- ��ȭ��ȣ
	hphone varchar2(50) NOT NULL,
	-- ��ǥ��ȣ
	dnumber varchar2(50) NOT NULL,
	-- �̸���
	hemail varchar2(50) NOT NULL,
	-- ����ڹ�ȣ
	crnum varchar2(100) NOT NULL,
	-- ����
	photo varchar2(50) NOT NULL,
	-- ��û����
	reg_date date DEFAULT SYSDATE NOT NULL,
	-- ó������
	proc_state varchar2(20) DEFAULT '���' NOT NULL,
	-- ó������
	proc_date date,
	PRIMARY KEY (hid)
);


-- ȸ��
CREATE TABLE J_MEMBER
(
	-- ȸ�� ���̵�
	mid varchar2(30) NOT NULL,
	-- �̸�
	name varchar2(30) NOT NULL,
	-- ��й�ȣ
	mpw varchar2(30) NOT NULL,
	-- �г���
	mnick varchar2(30) NOT NULL UNIQUE,
	-- �̸���
	memail varchar2(30) NOT NULL,
	-- ��ȭ��ȣ
	mphone varchar2(30) NOT NULL,
	-- ��������
	reg_date date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (mid)
);


-- �������Ʈ
CREATE TABLE MATE
(
	-- �Խñ� ��ȣ
	mno number NOT NULL,
	-- �г���
	mnick varchar2(30) NOT NULL UNIQUE,
	-- �Խñ� ����
	mtitle varchar2(50) NOT NULL,
	-- �Խñ� ��ȸ��
	mhit number NOT NULL,
	-- ���� �����
	depart date NOT NULL,
	-- ���� ��������
	fin date NOT NULL,
	-- �������
	mplace varchar2(200) NOT NULL,
	-- �����ο�
	mnum number NOT NULL,
	-- �Խñ� ����
	mtext varchar2(4000) NOT NULL,
	-- �Խñ� �ۼ�����
	mdate date NOT NULL,
	PRIMARY KEY (mno)
);


-- �������Ʈ ��û
CREATE TABLE MATEAPPLY
(
	-- ��� ��ȣ
	ano number NOT NULL,
	-- �г���
	mnick varchar2(30) NOT NULL UNIQUE,
	-- �Խñ� ��ȣ
	mno number NOT NULL,
	-- ��û���� ���°�
	mnow varchar2(20) NOT NULL,
	PRIMARY KEY (ano)
);


-- �������Ʈ ���
CREATE TABLE MATECM
(
	-- ��� ��ȣ
	mcmno number NOT NULL,
	-- �Խñ� ��ȣ
	mno number NOT NULL,
	-- �г���
	mnick varchar2(30) NOT NULL UNIQUE,
	-- ��� ����
	mcmtext varchar2(100) NOT NULL,
	-- ��� �ۼ�����
	mcmdate date NOT NULL,
	PRIMARY KEY (mcmno)
);


-- �������Ʈ ���ø���Ʈ(��)
CREATE TABLE MATEWISH
(
	-- ���ø���Ʈ ��ȣ
	mwno number NOT NULL,
	-- �Խñ� ��ȣ
	mno number NOT NULL,
	-- ȸ�� ���̵�
	mid varchar2(30) NOT NULL,
	PRIMARY KEY (mwno)
);


-- ��������
CREATE TABLE PAYMENT
(
	-- ������ȣ
	payno varchar2(50) NOT NULL,
	-- ī���
	card_name varchar2(30) NOT NULL,
	-- ī���ȣ
	card_num varchar2(50) NOT NULL,
	-- �����ݾ�
	amount number NOT NULL,
	-- �����Ͻ�
	pay_date date NOT NULL,
	-- ����Ͻ�
	pay_candate date,
	PRIMARY KEY (payno)
);

-- ����
CREATE TABLE REVIEW
(
	-- �����ȣ
	rev_no number NOT NULL,
	-- ȸ�� ���̵�
	mid varchar2(30) NOT NULL,
	-- ���ҹ�ȣ
	rm_no number NOT NULL,
	-- �ۼ�����
	 reg_date date NOT NULL,
	-- ����
	star number NOT NULL,
	-- ����
	title varchar2(40) NOT NULL,
	-- ����
	content varchar2(400) NOT NULL,
	PRIMARY KEY (rev_no)
);


-- ����
CREATE TABLE ROOM
(
	-- ���ҹ�ȣ
	rm_no number NOT NULL,
	-- ȣ��Ʈ ���̵�
	hid varchar2(30) NOT NULL,
	-- ���Ҹ�
	rm_name varchar2(20) NOT NULL,
	-- ��ġ
	location varchar2(100) NOT NULL,
	-- �ִ�����ο�
	people number NOT NULL,
	-- ����
	price number NOT NULL,
	-- �̹���
	img varchar2(20) NOT NULL,
	-- �Ұ���
	memo varchar2(400),
	-- ��������
	notice varchar2(400),
	-- ���䰳��
	rv_cnt number NOT NULL,
	-- ���� ����
	star_total number NOT NULL,
	PRIMARY KEY (rm_no)
);


-- ����
CREATE TABLE YEYAK
(
	-- �����ȣ
	yno varchar2(50) NOT NULL,
	-- ȸ�� ���̵�
	mid varchar2(30) NOT NULL,
	-- ȣ��Ʈ ���̵�
	hid varchar2(30) NOT NULL,
	-- ���ҹ�ȣ
	rm_no number NOT NULL,
	-- ������ȣ
	payno varchar2(50) NOT NULL,
	-- ����üũ��
	ye_checkin date NOT NULL,
	-- ����üũ�ƿ�
	ye_checkout date NOT NULL,
	-- �����ο���
	ye_guest number NOT NULL,
	PRIMARY KEY (yno)
);

-- �����Խ���
CREATE TABLE free (
	-- �Խñ� ��ȣ
	free_no  	NUMBER PRIMARY KEY,
	-- �ۼ���
	mid		VARCHAR2(30) NOT NULL
             REFERENCES j_member(mid) ON DELETE CASCADE,
	-- ����
	free_title	VARCHAR2(100) 	NOT NULL,
	-- ����
	free_content	VARCHAR2(4000)	NOT NULL,
	-- �ۼ���
	reg_date 	DATE,
	-- ��ȸ��
	free_hit 	NUMBER,
	-- �ۼ��� ip
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


/*���̺� �� ����� ���� �̰� �ϸ� ��*/
/*`room` ���̺��� `location` �÷� ����*/
ALTER TABLE room
DROP COLUMN location;
/*`room` ���̺� �÷� �߰�*/
ALTER TABLE room
ADD addr1 VARCHAR2(100);
ALTER TABLE room
ADD addr2 VARCHAR2(100);
ALTER TABLE room
ADD img2 VARCHAR2(100);
ALTER TABLE room
ADD img3 VARCHAR2(100);


/*������Ÿ�� ����*/
ALTER TABLE room MODIFY rm_name VARCHAR2(50 BYTE);
ALTER TABLE room MODIFY img VARCHAR2(100 BYTE);



/* yeyak Ʈ���� */
CREATE OR REPLACE TRIGGER payment_cancel_trigger
AFTER UPDATE OF pay_candate ON PAYMENT
FOR EACH ROW
WHEN (NEW.pay_candate IS NOT NULL)
BEGIN
    -- ���� ������ ��ٱ��� ���̺� ��� ����
    INSERT INTO CART (cno, rm_no, mid, checkin, checkout, guest)
    SELECT seq_cart_cno.NEXTVAL, y.rm_no, y.mid, y.ye_checkin, y.ye_checkout, y.ye_guest
    FROM YEYAK y
    WHERE y.payno = :OLD.payno;

    -- ���� ���̺��� �ش� ���� ����
    DELETE FROM YEYAK
    WHERE payno = :OLD.payno;
END;

/*REVIEW Ʈ���� 3�� ���� ����*/
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


/*����� �ܷ�Ű ���� ȸ�� insert*/
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('aaa123','�趯��','aaa123!!!','����','aaa123@gmail.com','01037284938',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('admin','������','adm123!!!','adadad','minmin@gmail.com','01098543761',to_date('23/08/08','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('jiwon041','������','jiwon04123!','������','jiwon041@gmail.com','01011112222',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ccc123','�質��','ccc12345$','��','ccc123@daum.com','01022223444',to_date('23/08/10','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ddd123','���','ddd12345$','��','ddd123@daum.com','01011111111',to_date('23/08/10','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('fff123','����','fff1234^','fff','ilovejeju@naver.com','01033333333',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ddd012','��ó��','ddd01234!','ó�ึ��','ddd012@naver.com','01055556666',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('eee345','ȫ�浿','eee34567!','�浿��','eee345@gmail.com','01066667777',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('fff678','��ö��','fff67890!','ö��','fff678@naver.com','01077778888',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ggg901','�ڿ���','ggg90123!','������','ggg901@gmail.com','01088889999',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('hhh234','������','hhh23456!','������','hhh234@daum.net','01099990000',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('iii567','�����','iii56789!','����','iii567@gmail.com','01010101111',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('jjj890','��̶�','jjj89012!','�̹�','jjj890@naver.com','01012121314',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('qwe123','qwe','qwe12345!','qwe','qwe123@gmail.com','43463104761',to_date('23/08/06','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('zxc123','zxc','zxc12345!','zxc','zxc123@zxc.com','47314916491',to_date('23/08/06','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('bbb456','�̸���','bbb45678!','������','bbb456@gmail.com','01033334444',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ccc789','��ȣȣ','ccc78901!','ȣ��','ccc789@daum.net','01044445555',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('kkk123','����ȣ','kkk12345!','����','kkk123@gmail.com','01013141516',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('lll456','�̽�ȯ','lll45678!','�½���','lll456@naver.com','01016171819',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('mmm789','������','mmm78901!','������','mmm789@gmail.com','01019202122',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('nnn012','ȫ���','nnn01234!','�����','nnn012@daum.net','01022232425',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('aaaaaa','����ȣȣ','aaaaaa01!','��','aaaaaa@daum.net','01044445555',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ppp678','�弭��','ppp67890!','������','ppp678@naver.com','01028293031',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('qqq901','������','qqq90123!','������','qqq901@gmail.com','01031323334',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('rrr234','������','rrr23456!','������','rrr234@daum.net','01034353637',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('sss567','�ۿ���','sss56789!','������','sss567@gmail.com','01037383940',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ttt890','������','ttt89012!','������','ttt890@naver.com','01040414243',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('uuu123','�����','uuu12345!','�����','uuu123@gmail.com','01043444546',to_date('23/08/08','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('www789','����ȣ','www78901!','������','www789@gmail.com','01049505152',to_date('23/08/10','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('xxx012','���ϴ�','xxx01234!','���ϴ�','xxx012@daum.net','01052535455',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('yyy345','���¾�','yyy34567!','���´�','yyy345@gmail.com','01055565758',to_date('23/08/12','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('zzz678','�����','zzz67890!','�ҼҴ�','zzz678@naver.com','01058596061',to_date('23/08/13','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('aaa901','�̵���','aaa90123!','������','aaa901@gmail.com','01061626364',to_date('23/08/14','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ccc567','������','ccc56789!','������','ccc567@gmail.com','01067686970',to_date('23/08/16','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('ddd890','�̹ο�','ddd89012!','�ι���','ddd890@naver.com','01070717273',to_date('23/08/17','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('dkdkdk123','�ƾƾ�','dkdkdk123!','dkdkdk','dkdkdk@gmail.com','01011111111',to_date('23/08/13','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('adf888','adf','aaa123!!!','adf','@','01022222222',to_date('23/08/13','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('jaesung042','���缺','jaesung04234!','�缺��','jaesung042@hotmail.com','01033334444',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('sooyeon043','�̼���','sooyeon04345!','������','sooyeon043@yahoo.com','01055556666',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('minjun044','�ڹ���','minjun04456!','������','minjun044@gmail.com','01077778888',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('seoyeon045','�輭��','seoyeon04567!','������','seoyeon045@hotmail.com','01099990000',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('junwoo046','���ؿ�','junwoo04678!','�ؿ���','junwoo046@yahoo.com','01011112222',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('jiyeon047','������','jiyeon04789!','������','jiyeon047@gmail.com','01033334444',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('yoonho048','����ȣ','yoonho04890!','��ȣ��','yoonho048@hotmail.com','01055556666',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('jiyoung049','������','jiyoung04901!','������','jiyoung049@gmail.com','01077778888',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('seokjin050','�輮��','seokjin05012!','������','seokjin050@yahoo.com','01099990000',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('hyunwoo052','������','hyunwoo05234!','������','hyunwoo052@hotmail.com','01033334444',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('eunji053','������','eunji05345!','������','eunji053@yahoo.com','01055556666',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('sangmin054','�����','sangmin05456!','�����','sangmin054@gmail.com','01077778888',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('jimin055','������','jimin05567!','������','jimin055@hotmail.com','01099990000',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('donghae056','�赿��','donghae05678!','������','donghae056@yahoo.com','01011112222',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('hyejin057','������','hyejin05789!','������','hyejin057@gmail.com','01033334444',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('minseok058','��μ�','minseok05890!','�μ���','minseok058@hotmail.com','01055556666',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('taehyung060','������','taehyung06012!','������','taehyung060@yahoo.com','01099990000',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('hello','������','hello01!','��ȣ��','hello@daum.net','01044445555',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.J_MEMBER (MID,NAME,MPW,MNICK,MEMAIL,MPHONE,REG_DATE) values ('qwerr','��ȣȣ','qwerr01!','�Ķ���','qwerr@daum.net','01044445555',to_date('23/08/07','RR/MM/DD'));

/*ȣ��Ʈ insert*/
INSERT INTO JEJUOSEYO.HOST (HID, REP, HPW, HNICK, HPHONE, DNUMBER, HEMAIL, CRNUM, PHOTO, REG_DATE, PROC_STATE, PROC_DATE)
VALUES ('sky123', '���ϴ�', 'Sunny#2023', '�ϴ��ϴ�', '01055558888', '0643765489', 'sky123@gmail.com', '2270657449', '12.jpeg', SYSDATE, '����', SYSDATE);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('kim123','Kim','kim123123!','seaweed','01011111111','01088888888','kim123@naver.com','[object HTMLInputElement]','1.jpeg',to_date('23/08/06','RR/MM/DD'),'����',to_date('23/08/09','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('hid','hname','hpw12345!!','hnick','01034455432','021113322','djaf@naver.com','2038143363','1',to_date('23/08/04','RR/MM/DD'),'����',to_date('23/08/04','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('qqq123','qqq','qqq123123!','qqq123','01011111111','01022222222','qqq123@gmail.com','5744400655','2.jpeg',to_date('23/08/09','RR/MM/DD'),'����',to_date('23/08/09','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('www123','www','www1212!','www123','01011111111','01022222221','www123sdsdsd@naver.com','5744400655','43.jpeg',to_date('23/08/10','RR/MM/DD'),'����',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('fff123','fff','fff1212!','fff123','01033333333','01044444444','fff123dafafa@daum.com','5744400655','44.jpeg',to_date('23/08/10','RR/MM/DD'),'����',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('ggg123','������','ggg123!!!','ggg123','01011111111','01022222222','ggg@naver.com','5744400655','9.jpeg',to_date('23/08/11','RR/MM/DD'),'����',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('ppp123','ppp','ppp123!!!','ppp123','01011111111','01022222222','ppp123@naver.com','5744400655','a.jpeg',to_date('23/08/11','RR/MM/DD'),'����',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('bbb123','bbb','bbb123!!!','bbb123','01011111111','01022222222','bbb123@naver.com','5744400655','11.jpeg',to_date('23/08/11','RR/MM/DD'),'����',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('xxx123','xxx','xxx123!!!','xxx123','01022222222','01033333333','xxx123@naver.com','5744400655','10.jpeg',to_date('23/08/11','RR/MM/DD'),'����',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('ttt123','ttt','ttt123!!!','ttt123','01022222222','01033333333','ttt123@daum.com','5744400655','7.jpeg',to_date('23/08/11','RR/MM/DD'),'����',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('vvv123','vvv','vvvvvvvvv','afff','14134134134','13414134141','aaa@aaa.com','5744400655','1.jpeg',to_date('23/08/11','RR/MM/DD'),'����',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user1','�̽���','P@ssw0rd1','�½½�','01012341234','0211223344','user1@example.com','1111111111','1',to_date('23/08/01','RR/MM/DD'),'����',to_date('23/08/01','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('mnb123','mnb','mnb123!!!','mnb123','01011111111','01022222222','mnb123@naver.com','5744400655','12.jpeg',to_date('23/08/11','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('dhdhdh123','dhdh','dhdhdh123!','dhdh','01011111111','01022222222','@','5744400655','13.jpeg',to_date('23/08/13','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('lee000','�̹ǹ�','lee0000!','leee','01056783456','01098765432','lee123@','5744400655','2.jpeg',to_date('23/08/14','RR/MM/DD'),'����',to_date('23/08/14','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jyoung12','���翵','J@y123456','������','01077778888','0423344556','jyoung12@example.com','3333333333','3',to_date('23/08/03','RR/MM/DD'),'����',to_date('23/08/03','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jimin03','������','Aa@m1n_2023','��������','01012345678','0233445566','jimin03@example.com','4444444444','4',to_date('23/08/04','RR/MM/DD'),'����',to_date('23/08/04','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('swim99','����ȯ','Sw!m1ng#','������','01020202020','0777888999','swim99@example.com','5555555555','5',to_date('23/08/05','RR/MM/DD'),'����',to_date('23/08/05','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('glass07','������','Gl@ss3s_','��������','01011112222','0888999000','glass07@example.com','6666666666','6',to_date('23/08/06','RR/MM/DD'),'����',to_date('23/08/06','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('minji13','������','M!nJ1_2023','��������','01033334444','0777888999','minji13@example.com','7777777777','7',to_date('23/08/07','RR/MM/DD'),'����',to_date('23/08/07','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('lov3life','�̹���','Lov3L!f3','��������','01055556666','0999888777','lov3life@example.com','9999999999','9',to_date('23/08/09','RR/MM/DD'),'����',to_date('23/08/09','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('sunshine','���¾�','Sun@Flower1','�¾��¾�','01012341234','0233445566','sunshine@example.com','1010101010','10',to_date('23/08/10','RR/MM/DD'),'����',to_date('23/08/10','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('goodvibes','ȫ�浿','GoodVibes1','�浿�浿','01012341234','0211223344','goodvibes@example.com','1111111111','11',to_date('23/08/11','RR/MM/DD'),'����',to_date('23/08/11','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('adventure','������','Adv3ntur3','��������','01011112222','0888999000','adventure@example.com','6666666666','15',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('treasure','�ڹ���','Tr3@sur3','���ع���','01033334444','0777888999','treasure@example.com','7777777777','16',to_date('23/08/16','RR/MM/DD'),'����',to_date('23/08/16','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('luckycharm','��̳�','Luckych@rm1','�̳��̳�','01044445555','0888999000','luckycharm@example.com','8888888888','17',to_date('23/08/17','RR/MM/DD'),'����',to_date('23/08/17','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('happyday','�迵��','HappyDay123','������','01012341234','0211223344','happyday@example.com','1111111111','19',to_date('23/08/19','RR/MM/DD'),'����',to_date('23/08/19','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('moonlight','�ڼ���','MoonL1ght','���ؼ���','01055558888','0311122334','moonlight@example.com','2222222222','20',to_date('23/08/20','RR/MM/DD'),'����',to_date('23/08/20','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('dandelion','������','D@nd3l10n','��������','01077778888','0423344556','dandelion@example.com','3333333333','21',to_date('23/08/21','RR/MM/DD'),'����',to_date('23/08/21','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('wonderland','�ѿ���','Wond3rl@nd','��������','01012345678','0233445566','wonderland@example.com','4444444444','22',to_date('23/08/22','RR/MM/DD'),'����',to_date('23/08/22','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('dreamcatcher','������','Dr3@mC@tch3r','��������','01020202020','0777888999','dreamcatcher@example.com','5555555555','23',to_date('23/08/23','RR/MM/DD'),'����',to_date('23/08/23','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('wanderlust','���켺','W@nd3rlust1','�켺�켺','01011112222','0888999000','wanderlust@example.com','6666666666','24',to_date('23/08/24','RR/MM/DD'),'����',to_date('23/08/24','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('captain','�ڼ���','C@pt@in_2023','���漭��','01033334444','0777888999','captain@example.com','7777777777','25',to_date('23/08/25','RR/MM/DD'),'����',to_date('23/08/25','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('summernights','������','Summ3rN1ghts','��������','01034566543','0888999000','summernights@example.com','8888888888','26',to_date('23/08/26','RR/MM/DD'),'����',to_date('23/08/26','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('treasuremap','�ŵ���','Tr34sur3M@p','��������','01055556666','0999888777','treasuremap@example.com','9999999999','27',to_date('23/08/27','RR/MM/DD'),'����',to_date('23/08/27','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('oceanview','�����','Oc3@nView1','��������','01055558888','0311122334','oceanview@example.com','2222222222','29',to_date('23/08/29','RR/MM/DD'),'����',to_date('23/08/29','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('adventureawaits','���¸�','Adv3nture1!','�¸��¸�','01077778888','0423344556','adventureawaits@example.com','3333333333','30',to_date('23/08/30','RR/MM/DD'),'����',to_date('23/08/30','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('hiddengem','�ں�','H!dd3nG3m','������','01012345678','0233445566','hiddengem@example.com','4444444444','31',to_date('23/08/31','RR/MM/DD'),'����',to_date('23/08/31','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('djad38','�蹮��','moon1298$','moon','01098373729','0647653876','moon38@gmail.com','2270657449','12.jpeg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user123','ȫ�浿','pass123!','�浿','01012345678','1234567890','user123@email.com','9876543210','profile.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('host567','�̼���','shin567*','����','01098765432','9876543210','shin@example.com','5555555555','photo.png',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('tester789','��ö��','test789#','ö��','01056781234','1357924680','tester@example.com','1234567890','test.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('newhost321','���ο�','new321$','�ο�','01098761234','4567890123','minwoo@example.com','0987654321','new_photo.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('johnsmith','��ٴ�','passWord123!','John','01055551111','1111222233','john@example.com','5555555555','john.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('alice88','�����','alice88$','Alice','01044443333','4444555566','alice@example.com','1234567890','alice.png',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('testhost555','�Ͽ쳪','test555!','Mark','01099998888','5555666777','mark@example.com','9876543210','mark.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('newuser111','���糪','newpass111*','Jane','01012341234','1234567890','jane@example.com','0987654321','jane.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('hoster2000','����','robert2000#','Robert','01088882222','2222333344','robert@example.com','5555555555','robert.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user456','���¿�','mj43456$','Michael','01077776666','9876543210','michael@example.com','1234567890','mjackson.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('guest123','������','guest123!','Jennifer','01022221111','1234567890','jennifer@example.com','0987654321','jennifer.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('host987','�̽¹�','will987#','William','01099991111','1234567890','will@example.com','5555555555','william.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user111','������','elizabeth111$','Elizabeth','01055559999','1234567890','elizabeth@example.com','1234567890','elizabeth.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('newhost888','�����','newhost888*','Charles','01088882222','9876543210','charles@example.com','5555555555','charles.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user222','�̼���','emma222$','Emma','01022223333','1234567890','emma@example.com','1234567890','emma.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('host555','�赵��','james555#','James','01055551111','9876543210','james@example.com','5555555555','james.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('newuser999','�ڼ���','newuser999*','Olivia','01099992222','1234567890','olivia@example.com','5555555555','olivia.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('host999','������','joseph999$','Joseph','01099991111','1234567890','joseph@example.com','5555555555','joseph.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user333','��μ�','sophia333*','Sophia','01033331111','1234567890','sophia@example.com','1234567890','sophia.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('newhost123','������','newhost123!','Emily','01012341234','9876543210','emily@example.com','5555555555','emily.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user444','�̼ҿ�','oliver444$','Oliver','01044441111','1234567890','oliver@example.com','1234567890','oliver.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('host777','�弭��','liam777#','Liam','01077771111','9876543210','liam@example.com','5555555555','liam.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('host111','������','noah111$','Noah','01011113333','9876543210','noah@example.com','5555555555','noah.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('newhost555','�̾Ƹ�','newhost555!','Isabella','01055551111','1234567890','isabella@example.com','5555555555','isabella.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('user555','���¿�','logan555$','Logan','01055552222','1234567890','logan@example.com','1234567890','logan.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('newuser222','������','newuser222*','Mia','01022222222','1234567890','mia@example.com','5555555555','mia.jpg',to_date('23/08/15','RR/MM/DD'),'���',null);
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('hand123','������','hand123!!!','hand938','01023458332','0647763347','hand123@daum.com','5744400655','IMG_2903.JPG',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('chulsu99','��ö��','Chulsu987!','ö��ö��','01098765432','0987654321','chulsu@example.com','9876543210','14.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('minho777','�ڹ�ȣ','Minho123$','��ȣ��ȣ','01037293840','0642849675','minho@example.com','5555555555','15.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jiu_song','������','JiuSong12$','��������','01083657463','0648273546','jiu@example.com','4444444444','16.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('young_ho','�迵ȣ','YhK41234$','��ȣ��ȣ','01092834738','0642827346','young@example.com','3333333333','17.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jiyeongi','������','Jiyeong#123','��������','01034923839','0641736485','jiyeong@example.com','2222222222','18.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('junho_park','����ȣ','JhPark789!','��ȣ��ȣ','01074629373','0643729473','junho@example.com','1111111111','19.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('yeongjm45','�迵��','YJin#2023','��������','01012345678','0123456789','yeongjin@example.com','1234567890','13.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('soomoi654','�ּ���','CmSoomin123!','���μ���','01098765432','0987654321','soomin@example.com','9876543210','14.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jihye252','������','JihyunL33$','��������','01055555555','0123456789','jihyun@example.com','5555555555','15.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jihjko3','����ȯ','Jihwan456#','��ȯ��ȯ','01044444444','0987654321','jihwan@example.com','4444444444','16.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jingg4','������','JinaPasswrd1','��������','01033333333','0123456789','jina@example.com','3333333333','17.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('hyunjin6','������','K!mHyunjin2023','��������','01022222222','0987654321','hyunjin@example.com','2222222222','18.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('sangwo4','�Ȼ��','Sangwoo!5678','�����','01011111111','0123456789','sangwoo@example.com','1111111111','19.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jiyeoj6','������','Kim1234#','��������','01066666666','0987654321','jiyeon@example.com','6666666666','20.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('seungmi4','�̽¹�','SLee_5678','�¹ν¹�','01077777777','0123456789','seungmin@example.com','7777777777','21.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('seojikim2','�輭��','Seojin_123!','��������','01011112222','0123456789','seojin@example.com','1111222233','23.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('donghpar1','�ڵ���','Donghae5678!','���ص���','01044443333','0987654321','donghae@example.com','4444333322','24.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('yunjchoi65','������','Yunji#2023','��������','01077776666','0123456789','yunji@example.com','7777666655','25.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('hyunang75','������','HJ_Kang123!','��������','01055554444','0987654321','hyungjoon@example.com','5555444433','26.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('jisoee76','������','JisooL_5678','��������','01033332222','0123456789','jisoo@example.com','3333222211','27.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('minsen25','�ȹμ�','Minseo1234#','�μ��μ�','01077773333','0987654321','minseo@example.com','7777333322','28.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('joonm32','������','Joonhyuk_5678','��������','01011119999','0123456789','joonhyuk@example.com','1111999988','29.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('eunjho13','������','EunjiPass#','��������','01055558888','0987654321','eunji@example.com','5555888877','30.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));
Insert into JEJUOSEYO.HOST (HID,REP,HPW,HNICK,HPHONE,DNUMBER,HEMAIL,CRNUM,PHOTO,REG_DATE,PROC_STATE,PROC_DATE) values ('siwoo7535','��ÿ�','Siwoo2023!','�ÿ�ÿ�','01099992222','0123456789','siwoo@example.com','9999222211','31.jpeg',to_date('23/08/15','RR/MM/DD'),'����',to_date('23/08/15','RR/MM/DD'));




/*���� insert*/
-���� insert ȣ��Ʈ ���̵� �����ϱ�
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values (SEQ_ROOM_rm_no.NEXTVAL,'sky123','�������',4,270000,'5e315d196c915c8bb0ce1f914551549d1.jpg','�䰡 �Ƹ��ٿ� ����Դϴ�.','�ٺ�ť ��Ҵ� ���� �����ϴ�.',0,0,'����Ư����ġ�� �������� ������ �ž��122���� 24','102ȣ',null,null);


Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '����ȣ��', 2, 200000, '1.jpg', '���ֿ��� ���� ���� ȣ���̿���! �������', '�߿ܼ������� 7~9���� ��մϴ�. �̿��� �����Դϴ�.', 0, 0, '����Ư����ġ�� �������� �߹�������301���� 3', '807ȣ', '47.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '�����غ� ����Ʈ', 4, 350000, '2.jpg', '�غ����� �ٷ� ���� �� �ִ� ����� �޾� ����Ʈ�Դϴ�.', '�������� ����������! �غ����� ��� �� ���ƿ�.', 0, 0, '����Ư����ġ�� ���ֽ� �ؾȷ� 123', '1502ȣ', '12.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '����ǳ�� ȣ��', 2, 180000, '3.jpg', 'â ������ �������� ������ �Ƹ��ٿ� ǳ���� ������ �� �ִ� ȣ���Դϴ�.', '���� �� �̴Ϲٿ��� ���Ḧ �����ص帳�ϴ�.', 0, 0, '����Ư����ġ�� ���ֽ� �߾ӷ� 456', '905ȣ', '25.jpg', null);


Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', 'Ǫ�� �ٴ� �� ȣ��', 2, 220000, '21.jpg', 'â ������ �������� Ǫ�� �ٴٸ� ������ �� �ִ� ȣ���Դϴ�.', '�ٴٸ� �����̿��� ����������!', 0, 0, '����Ư����ġ�� ���ֽ� �ؾȷ� 789', '1001ȣ', '7.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '���� ��ī�� ����', 4, 400000, '22.jpg', '�ϴ��� ���� ������� ���󿡼��� Ư���� �ް��� ��ܺ�����.', '����ž ���󿡼� ���� �並 ������ �� �ֽ��ϴ�.', 0, 0, '����Ư����ġ�� �������� �ϴ÷� 123', '505ȣ', '9.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '���� �ڿ��޾� ����Ʈ', 6, 300000, '23.jpg', '�ڿ� �ӿ��� ������ ã�� �� �ִ� �޾� ����Ʈ�Դϴ�.', '����Ʈ �� ������ �뿩 ���� ����', 0, 0, '����Ư����ġ�� ���ֽ� �ڿ��� 456', '1202ȣ', '18.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '���� �������� ȣ��', 4, 280000, '40.jpg', '������ �߽ɿ� ��ġ�� ���� ȣ���Դϴ�.', '���� ������ �̿� ���� (����)', 0, 0, '����Ư����ġ�� ���ֽ� �߾ӷ� 789', '1804ȣ', '32.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '�������� ��Ʈ��Ʈ', 3, 280000, '20.jpg', '�ڿ� �ӿ��� ������ ã�� �� �ִ� Ư���� ����Դϴ�.', '���� ���� �̿� �� 10% ���� ���� ����', 0, 0, '����Ư����ġ�� �������� ���� 789', '1103ȣ', '6.jpg', null);


Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '���� �����̵� ��Ƽ��', 2, 260000, '41.jpg', '��� ������ �������� ���� ��ġ�� ������ �� �ִ� ��Ƽ���Դϴ�.', '�ڿ� ģȭ���� ȯ�� �ӿ��� ����� �޽��� ��ܺ�����.', 0, 0, '����Ư����ġ�� �������� ����� 789', '703ȣ', '23.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '���� ���Ϸ��� ����Ʈ', 6, 380000, '42.jpg', '���� ǳ��� �Բ��ϴ� ȯ������ �޾� ����Ʈ�Դϴ�.', '����Ʈ �� ������ũ �̿� ���� (����)', 0, 0, '����Ư����ġ�� ���ֽ� ���� 123', '1503ȣ', '17.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '���� ������Ʈ �Ͽ콺', 4, 320000, '43.jpg', '�� �ӿ��� ����� �޽��� ��� �� �ִ� Ư���� �����Դϴ�.', '���� �׶󽺿��� ���ϴ� ���� ����', 0, 0, '����Ư����ġ�� �������� ���� 456', '1101ȣ', '28.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '���� ������Ƽ �Ͽ콺', 3, 290000, '10.jpg', '������ �������� ����� �޽��� ��� �� �ִ� Ư���� �����Դϴ�.', '���� �ֺ� ��å�θ� Ž���غ�����.', 0, 0, '����Ư����ġ�� ���ֽ� ��ȭ�� 789', '802ȣ', '31.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
 (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '���� ����Ͽ콺', 3, 270000, '13.jpg', '�Ƹ��ٿ� �Ķ� �ϴð� �Բ��ϴ� ������ �޽��� �����ϴ� �Ͽ콺�Դϴ�.', '������ �뿩 ���� ����', 0, 0, '����Ư����ġ�� ���ֽ� �Ķ��� 789', '1102ȣ', '37.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '���� �Ϲ��� ����', 4, 330000, '14.jpg', '�ױ� ������ ���� �� �ִ� Ư���� �����Դϴ�.', '�ػ� ����������� �Ļ� ����', 0, 0, '����Ư����ġ�� �������� �ױ��� 123', '1504ȣ', '19.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'testa', '���� �׸���ũ ����Ʈ', 6, 420000, '15.jpg', '���� ������ �Բ��ϴ� ��ũ���̼� ����Ʈ�Դϴ�.', '�״Ͻ� ��Ʈ�� ���� ������ �̿� ����', 0, 0, '����Ư����ġ�� ���ֽ� ������ 456', '1802ȣ', '24.jpg', null);
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
     (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '���� ��Ƽ�� �Ͽ콺', 3, 260000, '1.jpg', '������ ��Ƽ�� �����⸦ ���� �� �ִ� Ư���� �Ͽ콺�Դϴ�.', '�õ� ��Ÿ�� ������ ������ �����̴� ����', 0, 0, '����Ư����ġ�� ���ֽ� ��Ƽ���� 789', '1102ȣ', '37.jpg', '45.jpg');
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '���� ��� ����Ʈ', 4, 310000, '2.jpg', '�������� �����ΰ� �ü��� ���� �޾� ����Ʈ�Դϴ�.', '��Ʈ�Ͻ� ���� �� ���� �ü� �̿� ����', 0, 0, '����Ư����ġ�� �������� ����� 123', '1504ȣ', '19.jpg', '8.jpg');
Insert into JEJUOSEYO.ROOM (RM_NO,HID,RM_NAME,PEOPLE,PRICE,IMG,MEMO,NOTICE,RV_CNT,STAR_TOTAL,ADDR1,ADDR2,IMG2,IMG3) values
    (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '���� ������ ȣ����', 8, 180000, '3.jpg', '������ �������� ����� ������ �����ϴ� ȣ�����Դϴ�.', '���� �ֹ� �� ����� �̿� ����', 0, 0, '����Ư����ġ�� ���ֽ� ������ 456', '1802ȣ', '24.jpg', '11.jpg');

INSERT INTO JEJUOSEYO.ROOM (RM_NO, HID, RM_NAME, PEOPLE, PRICE, IMG, MEMO, NOTICE, RV_CNT, STAR_TOTAL, ADDR1, ADDR2, IMG2, IMG3)
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '���� ��ſ� ���', 4, 220000, '5.jpg', '�ڿ� �ӿ��� ����� �޽��� ��� �� �ִ� ����Դϴ�.', '�߿� �ٺ�ť �ü� �Ϻ�', 0, 0, '����Ư����ġ�� ���ֽ� ��ſ�� 789', '101ȣ', '28.jpg', '15.jpg');

INSERT INTO JEJUOSEYO.ROOM (RM_NO, HID, RM_NAME, PEOPLE, PRICE, IMG, MEMO, NOTICE, RV_CNT, STAR_TOTAL, ADDR1, ADDR2, IMG2, IMG3)
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '���� �غ� �� ����', 6, 320000, '7.jpg', '�ٴ� ������ ������ ���� ������ �ڶ��ϴ� �����Դϴ�.', '������ �̿� ����', 0, 0, '����Ư����ġ�� ���ֽ� �غ��� 123', 'A�� 501ȣ', '32.jpg', '18.jpg');

INSERT INTO JEJUOSEYO.ROOM (RM_NO, HID, RM_NAME, PEOPLE, PRICE, IMG, MEMO, NOTICE, RV_CNT, STAR_TOTAL, ADDR1, ADDR2, IMG2, IMG3)
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '���� ���� ��Ʈ��', 2, 150000, '9.jpg', '������ ������� �ƴ��� �������� ���ֿ����� ������ �����մϴ�.', '���� ����', 0, 0, '����Ư����ġ�� ���ֽ� ������ 789', '302ȣ', '36.jpg', '22.jpg');

INSERT INTO JEJUOSEYO.ROOM (RM_NO, HID, RM_NAME, PEOPLE, PRICE, IMG, MEMO, NOTICE, RV_CNT, STAR_TOTAL, ADDR1, ADDR2, IMG2, IMG3)
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '���� ���� ���� �ι�', 5, 180000, '11.jpg', '������ �Բ� ����� �ð��� ���� �� �ִ� �ι��Դϴ�.', '��� ���̽ü� �Ϻ�', 0, 0, '����Ư����ġ�� ���ֽ� ������ 567', '101ȣ', '40.jpg', '26.jpg');

INSERT INTO JEJUOSEYO.ROOM (RM_NO, HID, RM_NAME, PEOPLE, PRICE, IMG, MEMO, NOTICE, RV_CNT, STAR_TOTAL, ADDR1, ADDR2, IMG2, IMG3)
VALUES (SEQ_ROOM_rm_no.NEXTVAL, 'sky123', '���� ���Ÿ� ����Ʈ', 3, 450000, '13.jpg', '��޽����� ������� �ֻ��� ���񽺸� �����ϴ� ���Ÿ� ����Ʈ�Դϴ�.', '���� �� ���� �ü� �̿� ����', 0, 0, '����Ư����ġ�� ���ֽ� ����Ʈ�� 789', 'Suite 2001', '44.jpg', '30.jpg');



/*���� insert*/
Insert into JEJUOSEYO.REVIEW (REV_NO,MID,RM_NO,REG_DATE,STAR,TITLE,CONTENT) values (SEQ_Review_rev_no.NEXTVAL,'qwerr',7,to_date('23/08/01','RR/MM/DD'),4,'����~','�� ������ ����!!');
Insert into JEJUOSEYO.REVIEW (REV_NO,MID,RM_NO,REG_DATE,STAR,TITLE,CONTENT) values (SEQ_Review_rev_no.NEXTVAL,'aaaaaa',61,to_date('23/08/04','RR/MM/DD'),3,'����','���� �׷���� ');
Insert into JEJUOSEYO.REVIEW (REV_NO,MID,RM_NO,REG_DATE,STAR,TITLE,CONTENT) values (SEQ_Review_rev_no.NEXTVAL,'qwerr',12,to_date('23/07/07','RR/MM/DD'),5,'�ʹ�����','������ �� ����;�� ��湮�ǻ� ����~~');
Insert into JEJUOSEYO.REVIEW (REV_NO,MID,RM_NO,REG_DATE,STAR,TITLE,CONTENT) values (SEQ_Review_rev_no.NEXTVAL,'aaaaaa',7,to_date('23/07/23','RR/MM/DD'),5,'�����ؿ�','���� û�� ���°� �ʹ� ���ƿ�! ���뵵 ���ϰ� �� ��� ���ϴ�');
Insert into JEJUOSEYO.REVIEW (REV_NO,MID,RM_NO,REG_DATE,STAR,TITLE,CONTENT) values (SEQ_Review_rev_no.NEXTVAL,'hello',18,to_date('23/08/07','RR/MM/DD'),5,'�±�','���ִ��� ���� ���� ���ҿ��� �䵵 ���� �� �����մϴ� �� �ְ�');
-- 1�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'eee345', '1', TO_DATE('2023-07-06 12:08:50', 'YYYY-MM-DD HH24:MI:SS'), '3', '��', '�׳� �׷��׿�');

-- 2�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'fff678', '2', TO_DATE('2023-07-07 13:15:20', 'YYYY-MM-DD HH24:MI:SS'), '4', '���ƿ�', '�ſ� ���������� ���ҿ����ϴ�.');

-- 3�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'ddd012', '3', TO_DATE('2023-07-08 14:22:30', 'YYYY-MM-DD HH24:MI:SS'), '5', '�ְ��Դϴ�', '�� ���Ҵ� ���� �Ǹ��� �����̾����ϴ�.');

-- 4�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'eee345', '4', TO_DATE('2023-07-09 15:30:40', 'YYYY-MM-DD HH24:MI:SS'), '2', '�Ǹ�', '����ߴ� �͸�ŭ ���� �ʾҽ��ϴ�.');

-- 5�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'fff678', '5', TO_DATE('2023-07-10 16:37:50', 'YYYY-MM-DD HH24:MI:SS'), '5', '�ſ� ����', '���Ұ� ���� �����ϰ� ����߽��ϴ�.');

-- 6�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'ddd012', '6', TO_DATE('2023-07-11 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), '4', '��õ�մϴ�', '�������� �� �ٽ� �湮�ϰ� ���� ���̳׿�.');

-- 7�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'eee345', '7', TO_DATE('2023-07-12 18:52:10', 'YYYY-MM-DD HH24:MI:SS'), '5', '�����մϴ�', '���񽺿� �ü� ��� �Ϻ��߽��ϴ�.');

-- 8�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'fff678', '8', TO_DATE('2023-07-13 20:00:20', 'YYYY-MM-DD HH24:MI:SS'), '5', '�븸��', '���ݿ� ���� �Ǹ��� ����Ƽ�� ���� �����Դϴ�.');

-- 9�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'ddd012', '9', TO_DATE('2023-07-14 21:07:30', 'YYYY-MM-DD HH24:MI:SS'), '3', '����', '����� �����̾����ϴ�.');

-- 10�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'eee345', '10', TO_DATE('2023-07-15 22:15:40', 'YYYY-MM-DD HH24:MI:SS'), '4', '���ƿ�', '���ݴ�� ������ �����̾����ϴ�.');
-- 1�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'eee345', '11', TO_DATE('2023-07-06 12:08:50', 'YYYY-MM-DD HH24:MI:SS'), '3', '��', '�׳� �׷��׿�');

-- 2�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'fff678', '12', TO_DATE('2023-07-07 13:15:20', 'YYYY-MM-DD HH24:MI:SS'), '4', '���ƿ�', '�ſ� ���������� ���ҿ����ϴ�.');

-- 3�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'ddd012', '13', TO_DATE('2023-07-08 14:22:30', 'YYYY-MM-DD HH24:MI:SS'), '5', '�ְ��Դϴ�', '�� ���Ҵ� ���� �Ǹ��� �����̾����ϴ�.');

-- 4�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'eee345', '14', TO_DATE('2023-07-09 15:30:40', 'YYYY-MM-DD HH24:MI:SS'), '2', '�Ǹ�', '����ߴ� �͸�ŭ ���� �ʾҽ��ϴ�.');

-- 5�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'fff678', '15', TO_DATE('2023-07-10 16:37:50', 'YYYY-MM-DD HH24:MI:SS'), '5', '�ſ� ����', '���Ұ� ���� �����ϰ� ����߽��ϴ�.');

-- 6�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'ddd012', '16', TO_DATE('2023-07-11 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), '4', '��õ�մϴ�', '�������� �� �ٽ� �湮�ϰ� ���� ���̳׿�.');

-- 7�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'eee345', '17', TO_DATE('2023-07-12 18:52:10', 'YYYY-MM-DD HH24:MI:SS'), '5', '�����մϴ�', '���񽺿� �ü� ��� �Ϻ��߽��ϴ�.');

-- 8�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'fff678', '18', TO_DATE('2023-07-13 20:00:20', 'YYYY-MM-DD HH24:MI:SS'), '5', '�븸��', '���ݿ� ���� �Ǹ��� ����Ƽ�� ���� �����Դϴ�.');

-- 9�� ������
INSERT INTO "JEJUOSEYO"."REVIEW" (REV_NO, MID, RM_NO, REG_DATE, STAR, TITLE, CONTENT)
VALUES (SEQ_Review_rev_no.NEXTVAL, 'ddd012', '19', TO_DATE('2023-07-14 21:07:30', 'YYYY-MM-DD HH24:MI:SS'), '3', '����', '����� �����̾����ϴ�.');




-- �����Խ��� INSERT
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'aaa123', '���ֵ� ������ ��õ', '���ֵ����� �� ������ �� �������� �Ұ��մϴ�', 0, SYSDATE);

-- 2
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'jiwon04', '���ֵ� ���� ����', '���ֵ� ������ ���� �Ϻ��� ������ ��ȹ�غ�����', 0, SYSDATE);

-- 3
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ccc123', '���ֵ� ���� Ž��', '���ֵ��� ���ִ� ������ ã�� ��Ŵ� ��̸� ����������', 0, SYSDATE);

-- 4
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ddd123', '���ֵ� ���� ��õ', '���ֵ����� ����� �޽��� ���� ���Ҹ� �Ұ��մϴ�', 0, SYSDATE);

-- 5
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'eee345', '���ֵ� �ڿ��� �Բ�', '���ֵ��� �Ƹ��ٿ� �ڿ� ����� ��ܺ�����', 0, SYSDATE);

-- 6
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'fff678', '���ֵ� ��ȭ ����', '���ֵ��� ��ä�ο� ��ȭ�� ���縦 Ž���غ�����', 0, SYSDATE);

-- 7
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'hhh234', '���ֵ� �غ�����', '���ֵ��� �غ����� �ÿ��� �ٴٸ� �����ϼ���', 0, SYSDATE);

-- 8
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'aaaaaa', '���ֵ� �Ҽ��� ��ſ�', '���ֵ����� �Ҽ��� �ູ�� ã�ƺ�����', 0, SYSDATE);

-- 9
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ppp678', '���ֵ��� Ư���� ����', '���ֵ����� Ư���� ������ ��������', 0, SYSDATE);

-- 10
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'kkk123', '���ֵ��� ������ ����', '���ֵ� ������ ���� ���ο� ������ �׾ƺ�����', 0, SYSDATE);

-- 11
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'hhh234', '���ֵ� �Ӽ� ���� ����', '���� ������ ����, ���� ��ó ���� ������ ��õ�մϴ�. �̵��� ���ϸ� ������ ���� ���� �� �־��.', 0, SYSDATE);

-- 12
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'fff123', '���ֵ� �̻� ����', '�̻� ������ ���Ѵٸ� ���� ���� Ž��. ���ָ��� �Ƹ��ٿ� ǳ���� ���� Ư���� �߾��� ��������.', 0, SYSDATE);

-- 13
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'aaa123', '���ֵ� ���� ����', '�Ļ�� ���� ����������! ������ ���� ����� ���� ������ ������ ���� Ư���� ������ �� �ſ���.', 0, SYSDATE);

-- 14
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ccc123', '���ֵ� �غ�', '�������� ������ �غ����� ������ �ؼ����� ��ܺ�����. ���� �ٴٰ� ����� ��ٸ��ϴ�.', 0, SYSDATE);

-- 15
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'yyy345', '���� ����', '������ �� �� �ϳ��� ���� ������ �տ� ������. �ż��� ������ ������ ��ſ��� ������ �ſ���.', 0, SYSDATE);

-- 16
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'uuu123', '���� ��õ��', '������ �Ƹ��ٿ� ǳ���� ������ ���ֹ��� �ʰ� ������, ������ �߰��Ҹ� �ֺ� ���ҷ� �����ϼ���.', 0, SYSDATE);

-- 17
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'kkk123', '��ȭ�� ���� ������', '��ȭ�� ���縦 ������ �ʹٸ� ������ �μӸ����� �ڹ����� ���� Ư���� �ð��� ����������.', 0, SYSDATE);

-- 18
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'eee345', '���� ü�� ����', '���ֿ��� Ư���� �߾��� ����� �ʹٸ�, ���� ����ü���� ������ ������. �ڽŸ��� ��ǰ�� ������ ��ſ�.', 0, SYSDATE);

-- 19
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'hhh234', '������ ����', '������ ������ ���� ������ �ڿ��� �� ������ ����������. �ٴ� �ٶ��� Ǫ�� ǳ���� ������ ���� ǳ���ϰ� ������� �ſ���.', 0, SYSDATE);

-- �ÿ���
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'iii567', '�߽��� ����', '���ῡ�� ������ ������ �߽����� ��ܺ�����. ���� �԰Ÿ��� ��ǰ���� �����ϸ� Ư���� �ð��� ���� �� ���� �ſ���.', 0, SYSDATE);

INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'aaa123', '���ֵ� ������ ��õ', '���ֵ����� �� ������ �� �������� �Ұ��մϴ�', 0, SYSDATE);

-- 2
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'jiwon04', '���ֵ� ���� ����', '���ֵ� ������ ���� �Ϻ��� ������ ��ȹ�غ�����', 0, SYSDATE);

-- 3
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ccc123', '���ֵ� ���� Ž��', '���ֵ��� ���ִ� ������ ã�� ��Ŵ� ��̸� ����������', 0, SYSDATE);

-- 4
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ddd123', '���ֵ� ���� ��õ', '���ֵ����� ����� �޽��� ���� ���Ҹ� �Ұ��մϴ�', 0, SYSDATE);

-- 5
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'eee345', '���ֵ� �ڿ��� �Բ�', '���ֵ��� �Ƹ��ٿ� �ڿ� ����� ��ܺ�����', 0, SYSDATE);

-- 6
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'fff678', '���ֵ� ��ȭ ����', '���ֵ��� ��ä�ο� ��ȭ�� ���縦 Ž���غ�����', 0, SYSDATE);

-- 7
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'hhh234', '���ֵ� �غ�����', '���ֵ��� �غ����� �ÿ��� �ٴٸ� �����ϼ���', 0, SYSDATE);

-- 8
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'aaaaaa', '���ֵ� �Ҽ��� ��ſ�', '���ֵ����� �Ҽ��� �ູ�� ã�ƺ�����', 0, SYSDATE);

-- 9
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ppp678', '���ֵ��� Ư���� ����', '���ֵ����� Ư���� ������ ��������', 0, SYSDATE);

-- 10
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'kkk123', '���ֵ��� ������ ����', '���ֵ� ������ ���� ���ο� ������ �׾ƺ�����', 0, SYSDATE);

-- 11
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'hhh234', '���ֵ� �Ӽ� ���� ����', '���� ������ ����, ���� ��ó ���� ������ ��õ�մϴ�. �̵��� ���ϸ� ������ ���� ���� �� �־��.', 0, SYSDATE);

-- 12
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'fff123', '���ֵ� �̻� ����', '�̻� ������ ���Ѵٸ� ���� ���� Ž��. ���ָ��� �Ƹ��ٿ� ǳ���� ���� Ư���� �߾��� ��������.', 0, SYSDATE);

-- 13
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'aaa123', '���ֵ� ���� ����', '�Ļ�� ���� ����������! ������ ���� ����� ���� ������ ������ ���� Ư���� ������ �� �ſ���.', 0, SYSDATE);

-- 14
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'ccc123', '���ֵ� �غ�', '�������� ������ �غ����� ������ �ؼ����� ��ܺ�����. ���� �ٴٰ� ����� ��ٸ��ϴ�.', 0, SYSDATE);

-- 15
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'yyy345', '���� ����', '������ �� �� �ϳ��� ���� ������ �տ� ������. �ż��� ������ ������ ��ſ��� ������ �ſ���.', 0, SYSDATE);

-- 16
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'uuu123', '���� ��õ��', '������ �Ƹ��ٿ� ǳ���� ������ ���ֹ��� �ʰ� ������, ������ �߰��Ҹ� �ֺ� ���ҷ� �����ϼ���.', 0, SYSDATE);

-- 17
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'kkk123', '��ȭ�� ���� ������', '��ȭ�� ���縦 ������ �ʹٸ� ������ �μӸ����� �ڹ����� ���� Ư���� �ð��� ����������.', 0, SYSDATE);

-- 18
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'eee345', '���� ü�� ����', '���ֿ��� Ư���� �߾��� ����� �ʹٸ�, ���� ����ü���� ������ ������. �ڽŸ��� ��ǰ�� ������ ��ſ�.', 0, SYSDATE);

-- 19
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'hhh234', '������ ����', '������ ������ ���� ������ �ڿ��� �� ������ ����������. �ٴ� �ٶ��� Ǫ�� ǳ���� ������ ���� ǳ���ϰ� ������� �ſ���.', 0, SYSDATE);

-- �ÿ���
INSERT INTO FREE (free_No, mid, free_Title, free_Content, free_hit, reg_Date)
VALUES (seq_free_free_no.nextval, 'iii567', '�߽��� ����', '���ῡ�� ������ ������ �߽����� ��ܺ�����. ���� �԰Ÿ��� ��ǰ���� �����ϸ� Ư���� �ð��� ���� �� ���� �ſ���.', 0, SYSDATE);