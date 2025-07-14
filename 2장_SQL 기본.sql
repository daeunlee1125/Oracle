/*
날짜 : 2025/07/14
이름 : 이다은
내용 : 2장 SQL 기본
*/

--실습 1-2, NUMBER 자료형 이해
CREATE TABLE TYPE_TEST_NUMBER(
    num1 NUMBER,
    num2 NUMBER(2),
    num3 NUMBER(3, 1),
    num4 NUMBER(4, 2),
    num5 NUMBER(5, 6), --잘못된 선언임
    num6 NUMBER(6, -1)
);

--NUM1 NUMBER
insert into type_test_number (num1) VALUES (1);
insert into type_test_number (num1) VALUES (123);
insert into type_test_number (num1) values (123.74);
insert into type_test_number (num1) values (123.12345);

--NUM2 NUMBER(2)
insert into type_test_number (num2) values (12);
insert into type_test_number (num2) values (123); --에러
insert into type_test_number (num2) values (1.2); --1
insert into type_test_number (num2) values (1.23); --1
insert into type_test_number (num2) values (12.34567); --12
insert into type_test_number (num2) values (12.56789); --13
insert into type_test_number (num2) values (123.56789); --에러

--num3 NUMBER(3, 1)
insert into type_test_number (num3) values (12);
insert into type_test_number (num3) values (123); --에러
insert into type_test_number (num3) values (1.2);
insert into type_test_number (num3) values (12.1234); --12.1
insert into type_test_number (num3) values (12.56789); --12.6
insert into type_test_number (num3) values (123.56789); --에러

--num4 NUMBER(4, 2)
insert into type_test_number (num4) values (12.345); --12.35
insert into type_test_number (num4) values (123.4); --에러
--num5 NUMBER(5, 6)
insert into type_test_number (num5) values (1.2345); --에러
insert into type_test_number (num5) values (0.12345); --에러
insert into type_test_number (num5) values (0); --0
insert into type_test_number (num5) values (123.56789); --에러

--num6 NUMBER(6, -1)
insert into type_test_number (num6) values (1234567); --1234570
insert into type_test_number (num6) values (1.2); --0
insert into type_test_number (num6) values (1.23); --0
insert into type_test_number (num6) values (12.3); --10
insert into type_test_number (num6) values (123.45); --120
insert into type_test_number (num6) values (123456.7); --123460

--실습하기 1-3. 문자형 테이블
CREATE TABLE TYPE_TEST_CHAR(
    char1 CHAR(1), --고정 길이 문자열
    char2 CHAR(2),
    char3 CHAR(3),
    vchar1 VARCHAR2(1), --가변 길이 문자열
    vchar2 VARCHAR2(2),
    vchar3 VARCHAR2(3),
    nvchar1 NVARCHAR2(1), --가변 길이+국가 맞춤
    nvchar2 NVARCHAR2(2),
    nvchar3 NVARCHAR2(3)
);

insert into type_test_char (char1) values ('a');
insert into type_test_char (char1) values ('ab'); --에러
insert into type_test_char (char2) VALUES ('a');
insert into type_test_char (char3) VALUES ('abcd'); --에러
insert into type_test_char (char3) values ('얍');
insert into type_test_char (char3) values ('한글'); --에러
insert into type_test_char (vchar1) values ('a');
insert into type_test_char (vchar1) values ('얍'); --에러
insert into type_test_char (nvchar1) values ('얍');

--실습하기 1-4. 테이블 생성
CREATE TABLE USER1(
    USER_ID VARCHAR2(20),
    NAME VARCHAR2(20),
    HP CHAR(13), -- 010-1234-5678
    AGE NUMBER
);

--실습하기 1-5
insert into USER1 VALUES ('A101', '김유신', '010-1234-1111', 25);
insert into USER1 VALUES ('A102', '김춘추', '010-1234-2222', 23);
insert into USER1 VALUES ('A103', '장보고', '010-1234-3333', 32);
insert into USER1 (USER_ID, name, age) values ('A104', '강감찬', 45);
insert into user1 (user_id, name, hp) values ('A105', '이순신', '010-1234-5555');

--실습하기 1-6
select * from user1;
SELECT * FROM USER1 WHERE USER_ID = 'A101';
SELECT USER_ID, NAME, AGE FROM USER1;
select * from user1 where age>30;

-- 실습 1-7
update user1 set hp='010-1234-4444' where user_id = 'A104';
update user1 set age=20 where name='이순신';
update user1 set
        HP = '010-1234-1001',
        AGE = 27
    WHERE
        USER_ID = 'A101';
        
--실습하기 1-8
DELETE from USER1 where USER_ID = 'A101';
delete from user1 where USER_ID = 'A102' and age = 25; --조건 맞지 않아 삭제X
delete from user1 where age>= 30;


------------------------
-- 2.제약 조건
------------------------
create table USER2(
    user_id varchar2(20) primary key, --중복 허용X
    name varchar2(20),
    hp char(13),
    age number(2)
);
    
-- 기본키 컬럼은 중복 금지됨
insert into user2 values ('A101', '김유신', '010-1234-1111', 23);
insert into user2 values ('A101', '김춘추', '010-1234-2222', 21); --에러

-- 실습하기 2-2
create table user3(
    user_id varchar2(20) primary key,
    name    varchar2(20),
    hp      char(13) UNIQUE,
    age     number(3)
);

insert into user3 values ('A101', '김유신', '010-1234-1111', 34);
insert into user3 values ('A101', '김춘추', '010-1234-2222', 34); --에러(id 중복)
insert into user3 values ('A102', '김춘추', '010-1234-1111', 23); --에러(전화번호 중복)
insert into user3 values ('A102', '김춘추', '010-1234-2222', 45);