
CREATE TABLE account (
    acc_id            CHAR(14 BYTE) NOT NULL,
    cust_jumin        CHAR(14 BYTE),
    acc_type          VARCHAR2(20 BYTE) NOT NULL,
    acc_balance       NUMBER NOT NULL,
    acc_card          CHAR(1 BYTE) NOT NULL,
    acc_register_date DATE
);

ALTER TABLE account ADD CONSTRAINT account_pk PRIMARY KEY ( acc_id );

CREATE TABLE card (
    card_no            CHAR(14 BYTE) NOT NULL,
    cust_jumin         CHAR(14 BYTE),
    acc_id             CHAR(14 BYTE),
    card_register_date DATE,
    card_limit         NUMBER,
    card_approve_date  DATE,
    card_type          VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE card ADD CONSTRAINT card_pk PRIMARY KEY ( card_no );

CREATE TABLE customer (
    cust_jumin CHAR(14 BYTE) NOT NULL,
    name       VARCHAR2(20 BYTE) NOT NULL,
    address    VARCHAR2(100 BYTE) NOT NULL,
    birth      CHAR(10 BYTE) NOT NULL,
    email      VARCHAR2(100 BYTE),
    hp         VARCHAR2(20 BYTE) NOT NULL,
    job        VARCHAR2(20 BYTE)
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cust_jumin );
drop table transaction;

CREATE TABLE transaction (
    trans_id      NUMBER NOT NULL,
    trans_acc_id  CHAR(14 BYTE) NOT NULL,
    trans_type    VARCHAR2(20 BYTE),
    trans_message VARCHAR2(20 BYTE),
    trans_money   NUMBER,
    trans_date    DATE NOT NULL
);

ALTER TABLE transaction ADD CONSTRAINT transaction_pk PRIMARY KEY ( trans_id );

ALTER TABLE account
    ADD CONSTRAINT account_customer_fk FOREIGN KEY ( cust_jumin )
        REFERENCES customer ( cust_jumin );

ALTER TABLE card
    ADD CONSTRAINT card_account_fk FOREIGN KEY ( acc_id )
        REFERENCES account ( acc_id );

ALTER TABLE card
    ADD CONSTRAINT card_customer_fk FOREIGN KEY ( cust_jumin )
        REFERENCES customer ( cust_jumin );

ALTER TABLE transaction
    ADD CONSTRAINT transaction_account_fk FOREIGN KEY ( trans_acc_id )
        REFERENCES account ( acc_id );

CREATE SEQUENCE transaction_trans_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER transaction_trans_id_trg BEFORE
    INSERT ON transaction
    FOR EACH ROW
    WHEN ( new.trans_id IS NULL )
BEGIN
    :new.trans_id := transaction_trans_id_seq.nextval;
END;
/


-- 작업 2_Customer

insert into Customer values ('760121-1234567', '정우성', '서울', '1976-01-21', null, '010-1101-7601', '배우');
insert into Customer values ('750611-1234567', '이정재', '서울', '1975-06-11', null, '010-1102-7506', '배우');
insert into Customer values ('890530-1234567', '전지현', '대전', '1989-05-30', 'jjh@naver.com', '010-1103-8905', '배우');
insert into Customer values ('790413-1234567', '이나영', '대전', '1979-04-13', 'lee@naver.com', '010-2101-7904', '배우');
insert into Customer values ('660912-1234567', '원빈', '대전', '1966-09-12', 'one@daum.net', '010-2104-6609', '배우');

-- 작업 2_Card

insert into Card values ('2111-1001-1001', '760121-1234567', '1011-1001-1001', '2020-01-21', 1000000, '2020-02-10', 'check');
insert into Card values ('2041-1001-1002', '890530-1234567', '1011-1001-1002', '2020-06-11', 3000000, '2020-06-15', 'check');
insert into Card values ('2011-1001-1003', '790413-1234567', '1011-1001-1003', '2020-05-30', 5000000, '2020-06-25', 'check');
insert into Card values ('2611-1001-1005', '750611-1234567', '1011-1002-1005', '2020-09-12', 1000000, '2020-10-10', 'check');

-- 작업 2_Account
insert into account values ('1011-1001-1001', '760121-1234567', '자유입출금', 4160000, 'Y', '2020-01-21 13:00:02');
insert into account values ('1011-1001-1002', '890530-1234567', '자유입출금', 376000, 'Y', '2020-06-11 13:00:02');
insert into account values ('1011-1001-1003', '790413-1234567', '자유입출금', 1200000, 'Y', '2020-05-30 13:00:02');
insert into account values ('1011-2001-1004', '660912-1234567', '정기적금', 1000000, 'N', '2020-04-13 13:00:02');
insert into account values ('1011-1002-1005', '750611-1234567', '자유입출금', 820000, 'Y', '2020-09-12 13:00:02');

-- 작업 2_Transaction
insert into Transaction values (1, '1011-1001-1001', '입금', '2월 정기급여', 3500000, sysdate);
insert into Transaction values (2, '1011-1001-1003', '출금', 'ATM 출금', 300000, sysdate);
insert into Transaction values (3, '1011-1001-1002', '입금', '2월 급여', 2800000, sysdate);
insert into Transaction values (4, '1011-1001-1001', '출금', '2월 공과금', 116200, sysdate);
insert into Transaction values (5, '1011-1002-1005', '출금', 'ATM 출금', 50000, sysdate);

-- 작업3 --

-- 문제 1
select * from customer;

-- 문제 2
select * from card;

-- 문제 3
select * from account;

-- 문제 4
select * from transaction
order by trans_date desc
fetch first 3 rows only;

-- 문제 5
select name, card_type from customer c
join card ca on ca.cust_jumin=c.cust_jumin
where card_limit>=2000000;

-- 문제 6
select 
    acc_id,
    case
        when count(trans_id) is not null then count(trans_id)
        else 0
    end as "거래 건수"
from transaction t
right join account a on a.acc_id = t.trans_acc_id
group by acc_id;

-- 문제 7
select * from transaction
where trans_money>=1000000
order by trans_date desc;

-- 문제 8
select c.acc_id, c.card_no, c.card_type from card c;

-- 문제 9
select sum(trans_money) as 입금총합 from transaction
where trans_type='입금';

-- 문제 10
select name, c.cust_jumin, hp, address from customer c
join account a on a.cust_jumin=c.cust_jumin
where acc_balance>=4000000;
