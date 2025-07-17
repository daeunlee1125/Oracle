--워크북 p13
--실습하기 3-1

SELECT * FROM DICTIONARY;

select table_name for user_tables;
select owner, table_name from all_tables;
select * from dba_tables;
select * from dba_users;

select instance_name, status, database_status, host_name from v$instance;

--실습하기 3-2
select * from user_indexes;
select * from user_ind_columns;

--실습하기 3-3 (index 생성)
create index idx_user1_id on USER1(USER_ID);
    /*USER_ID 컬럼을 index로 저장한다!
    index를 참조해서 USER_ID 번호 찾아감*/
select * from user_ind_columns;

drop index idx_user1_id;
select * from user_ind_columns;
create index idx_user1_id on USER1(User_id);

--실습하기 3-6
create view VW_USER1 AS (SELECT NAME, HP, AGE FROM USER1);
create view VW_USER2_AGE_UNDER30 AS (SELECT * FROM USER2 WHERE AGE < 30);
select * from user_views;

SELECT * FROM VW_USER1;
SELECT * FROM VW_USER2_AGE_UNDER30;

--실습하기 3-9
CREATE table USER6(
    seq number primary key,
    name varchar2(20),
    gender char(1),
    age number,
    addr varchar2(255)
);

--실습하기 3-10
create sequence seq_user6 increment by 1 start with 1;
--실습하기 3-11
insert into user6 values (seq_user6.nextval, '김유신', 'M', 25, '김해시');
insert into user6 values (seq_user6.nextval, '김춘추', 'M', 23, '경주시');
insert into user6 values (seq_user6.nextval, '신사임당', 'F', 27, '강릉시');

