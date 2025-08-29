-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-29 17:47:18 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE college (
    college VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE college ADD CONSTRAINT college_pk PRIMARY KEY ( college );

CREATE TABLE course (
    cs_id     NUMBER(10) NOT NULL,
    cs_name   VARCHAR2(50 BYTE) NOT NULL,
    cs_grade  NUMBER(1),
    cs_credit NUMBER(1),
    cs_dist   VARCHAR2(20 BYTE),
    cs_year   NUMBER(4) NOT NULL,
    cs_sem    NUMBER(1) NOT NULL,
    dep_no    NUMBER NOT NULL,
    pro_no    NUMBER NOT NULL,
    cs_seq    NUMBER(3) NOT NULL
);

ALTER TABLE course ADD CONSTRAINT course_pk PRIMARY KEY ( cs_id );

CREATE TABLE department (
    dep_no   NUMBER NOT NULL,
    college  VARCHAR2(20 BYTE) NOT NULL,
    dep_name VARCHAR2(20 BYTE) NOT NULL,
    dep_king VARCHAR2(20 BYTE),
    dep_hp   CHAR(12 BYTE)
);

ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY ( dep_no );

CREATE TABLE professor (
    pro_no           NUMBER NOT NULL,
    pro_name         VARCHAR2(50 BYTE) NOT NULL,
    pro_jumin        CHAR(14 BYTE) NOT NULL,
    pro_hp           VARCHAR2(15 BYTE),
    pro_email        VARCHAR2(100 BYTE),
    dep_no           NUMBER NOT NULL,
    position         VARCHAR2(50 BYTE),
    status           VARCHAR2(20 BYTE),
    appointment_date DATE
);

ALTER TABLE professor ADD CONSTRAINT professor_pk PRIMARY KEY ( pro_no );

CREATE TABLE student (
    std_no       NUMBER(10) NOT NULL,
    std_jumin    CHAR(14 BYTE) NOT NULL,
    std_name     VARCHAR2(30 BYTE) NOT NULL,
    std_eng_name VARCHAR2(30 BYTE),
    std_gen      CHAR(1 BYTE) NOT NULL,
    std_nation   VARCHAR2(30 BYTE) DEFAULT '한국',
    std_hp       CHAR(13 BYTE),
    std_email    VARCHAR2(30 BYTE),
    std_addr     VARCHAR2(50 BYTE),
    dep_no       NUMBER NOT NULL,
    pro_no       NUMBER NOT NULL,
    std_seq      NUMBER(4),
    std_ent      NUMBER(4) NOT NULL
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( std_no );

ALTER TABLE course
    ADD CONSTRAINT course_department_fk FOREIGN KEY ( dep_no )
        REFERENCES department ( dep_no );

ALTER TABLE course
    ADD CONSTRAINT course_professor_fk FOREIGN KEY ( pro_no )
        REFERENCES professor ( pro_no );

ALTER TABLE department
    ADD CONSTRAINT department_college_fk FOREIGN KEY ( college )
        REFERENCES college ( college );

ALTER TABLE professor
    ADD CONSTRAINT professor_department_fk FOREIGN KEY ( dep_no )
        REFERENCES department ( dep_no );

ALTER TABLE student
    ADD CONSTRAINT std_dep_no1 FOREIGN KEY ( dep_no )
        REFERENCES department ( dep_no );

ALTER TABLE student
    ADD CONSTRAINT student_professor_fk FOREIGN KEY ( pro_no )
        REFERENCES professor ( pro_no );

CREATE SEQUENCE course_cs_seq_seq START WITH 1 MAXVALUE 999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER course_cs_seq_trg BEFORE
    INSERT ON course
    FOR EACH ROW
    WHEN ( new.cs_seq IS NULL )
BEGIN
    :new.cs_seq := course_cs_seq_seq.nextval;
END;
/

CREATE SEQUENCE student_std_seq_seq START WITH 1 MAXVALUE 9999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER student_std_seq_trg BEFORE
    INSERT ON student
    FOR EACH ROW
    WHEN ( new.std_seq IS NULL )
BEGIN
    :new.std_seq := student_std_seq_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             11
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          2
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
