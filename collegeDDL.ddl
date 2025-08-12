-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-11 12:17:24 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE lecture (
    lecno     INTEGER NOT NULL,
    lecname   VARCHAR2(20 BYTE) NOT NULL,
    leccredit INTEGER NOT NULL,
    lectime   INTEGER NOT NULL,
    lecclass  VARCHAR2(10 BYTE)
);

ALTER TABLE lecture ADD CONSTRAINT lecture_pk PRIMARY KEY ( lecno );

CREATE TABLE register (
    regstdno      CHAR(8 BYTE) NOT NULL,
    reglecno      INTEGER NOT NULL,
    regmidscore   INTEGER,
    regfinalscore INTEGER,
    regtotalscore INTEGER,
    reggrade      CHAR(1 BYTE)
);

CREATE TABLE student (
    stdno      CHAR(8 BYTE) NOT NULL,
    stdname    VARCHAR2(20 BYTE) NOT NULL,
    stdhp      CHAR(13 BYTE) NOT NULL,
    stdyear    INTEGER NOT NULL,
    stdaddress VARCHAR2(100 BYTE)
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( stdno );

ALTER TABLE register
    ADD CONSTRAINT register_lecture_fk FOREIGN KEY ( reglecno )
        REFERENCES lecture ( lecno );

ALTER TABLE register
    ADD CONSTRAINT register_student_fk FOREIGN KEY ( regstdno )
        REFERENCES student ( stdno );

insert into Student values ('20201011', '김유신', '010-1234-1001', 3, '경남 김해시');
insert into Student values ('20201122', '김춘추', '010-1234-1002', 3, '경남 경주시');
insert into Student values ('20210213', '장보고', '010-1234-1003', 2, '전남 완도군');
insert into Student values ('20210324', '강감찬', '010-1234-1004', 2, '서울 관악구');
insert into Student values ('20220415', '이순신', '010-1234-1005', 1, '서울 종로구');

insert into Lecture values (101, '컴퓨터과학', 2, 40, '본301');
insert into Lecture values (102, '프로그래밍', 3, 52, '본302');
insert into Lecture values (103, '데이터베이스', 3, 56, '본303');
insert into Lecture values (104, '자료구조', 3, 60, '본304');
insert into Lecture values (105, '운영체제', 3, 52, '본305');


insert into Register (regStdNo, regLecNo, regMidScore, regFinalScore) values ('20220415', 101, 60, 30);
insert into Register (regStdNo, regLecNo, regMidScore, regFinalScore) values ('20210324', 103, 54, 36);
insert into Register (regStdNo, regLecNo, regMidScore, regFinalScore) values ('20201011', 105, 52, 28);
insert into Register (regStdNo, regLecNo, regMidScore, regFinalScore) values ('20220415', 102, 38, 40);
insert into Register (regStdNo, regLecNo, regMidScore, regFinalScore) values ('20210324', 104, 56, 32);
insert into Register (regStdNo, regLecNo, regMidScore, regFinalScore) values ('20210213', 103, 48, 40);

select stdNo, stdName, stdHp, stdYear
    from student s
    left join register r on s.stdno=r.regStdno
    where regLecNo is null;

UPDATE register SET
    regtotalscore = regmidscore+regfinalscore,
    reggrade = case
        when (regMidScore + regFinalScore) >= 90 then 'A'
        when (regMidScore + regFinalScore) >= 80 then 'B'
        when (regMidScore + regFinalScore) >= 70 then 'C'
        when (regMidScore + regFinalScore) >= 60 then 'D'
        ELSE 'F'
    end;
select * from register;

select stdno, stdName, stdYear, lecName, regMidScore, regFinalScore, regtotalscore as 총합, regGrade as 등급 from register r
join student s on r.regStdNo = s.stdno
join lecture l on r.regLecNo = l.lecno
where s.stdyear=2;


