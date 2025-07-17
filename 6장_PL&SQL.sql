/*
날짜 : 2025/07/17
이름 : 이다은
내용 : 6장 PL/SQL
*/

--실습 1-1
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, Oracle!'); --sysout임
END;

--실습 1-2
DECLARE
    NO      NUMBER(4) := 1001; 
    NAME    VARCHAR2(10) := '홍길동';
    HP      CHAR(13) := '010-1000-1001';
    ADDR    VARCHAR(100) := '부산광역시';
BEGIN
    DBMS_OUTPUT.PUT_LINE('번호 : ' || NO);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('전화 : ' || HP);
    DBMS_OUTPUT.PUT_LINE('주소 : ' || ADDR);
END;
/ --함수 뒤에 슬래쉬 넣어줘야 함

SET SERVEROUTPUT ON;

DECLARE
    NO  CONSTANT NUMBER(4) := 1001;
    NAME    VARCHAR2(10);
    HP  CHAR(13) := '000-0000-0000';
    AGE NUMBER(2) DEFAULT 1;
    ADDR VARCHAR2(10) NOT NULL := '부산';
BEGIN
    NAME := '김유신';
    HP := '010-1000-1001';
    DBMS_OUTPUT.PUT_LINE('번호 : ' || NO);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('전화 : ' || HP);
    DBMS_OUTPUT.PUT_LINE('나이 : ' || AGE);
    DBMS_OUTPUT.PUT_LINE('주소 : ' || ADDR);
END;
/

--실습 2-1

--실습 2-2
DECLARE
    NO DEPT.DEPTNO%TYPE; --(=NUMBER(2))
    NAME DEPT.DNAME%TYPE;
    DTEL DEPT.DTEL%TYPE;
BEGIN
    SELECT
        * INTO NO, NAME, DTEL
    FROM DEPT
    WHERE DEPTNO = 30;
    
    DBMS_OUTPUT.PUT_LINE('부서번호 : ' || NO);
    DBMS_OUTPUT.PUT_LINE('부서명 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('전화번호 : ' || DTEL);
END;
/

DECLARE
    ROW_DEPT DEPT%ROWTYPE;
BEGIN
    SELECT *
    INTO ROW_DEPT
    FROM DEPT
    WHERE DEPTNO = 40;
    
    --출력
    DBMS_OUTPUT.PUT_LINE('부서번호 : ' || ROW_DEPT.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('부서명 : ' || ROW_DEPT.DNAME);
    DBMS_OUTPUT.PUT_LINE('주소 : ' || ROW_DEPT.LOC);
END;
/

--실습 2-4
DECLARE
    TYPE REC_DEPT IS RECORD (
        deptno NUMBER(2),
        dname DEPT.DNAME%TYPE,
        dtel DEPT.DTEL%TYPE
    );
    
    dept_rec REC_DEPT;
BEGIN
    dept_rec.deptno := 10;
    dept_rec.dname := '개발부';
    dept_rec.dtel := '051-512-1010';
    
    DBMS_OUTPUT.PUT_LINE('deptno : ' || dept_rec.deptno);
    DBMS_OUTPUT.PUT_LINE('dname : ' || dept_rec.dname);
    DBMS_OUTPUT.PUT_LINE('dtel : ' || dept_rec.dtel);
END;
/

--실습하기 2-7
DECLARE
    TYPE ARR_CITY IS TABLE OF VARCHAR2(20)
    INDEX BY PLS_INTEGER;
    arrCity ARR_CITY;
BEGIN
    arrCity(1) := '서울';
    arrCity(2) := '대전';
    arrCity(3) := '대구';
    
    DBMS_OUTPUT.PUT_LINE('arrCity(1) : ' || arrCity(1));
    DBMS_OUTPUT.PUT_LINE('arrCity(2) : ' || arrCity(2));
    DBMS_OUTPUT.PUT_LINE('arrCity(3) : ' || arrCity(3));
    DBMS_OUTPUT.PUT_LINE('PL/SQL 종료...');
END;
/

--실습 4-1
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    
    --커서 선언
    CURSOR c1 IS SELECT * FROM DEPT WHERE DEPTNO=40;
BEGIN
    --커서 열기
    OPEN c1;
    
    --커서 데이터 입력
    FETCH c1 INTO V_DEPT_ROW;
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('DTEL : ' || V_DEPT_ROW.DTEL);
    
    CLOSE c1; --커서는 자원이라, 쓰고 나면 닫아줘야!
END;
/

--실습 4-2
DECLARE
    V_EMP_ROW EMP%ROWTYPE; --DEPTNO, DNAME, DTEL 타입(숫자/문자열/문자열) 참조하는 변수
    CURSOR emp_cursor IS SELECT * FROM EMP;
BEGIN
    OPEN emp_cursor;
    LOOP --무한반복문
        FETCH emp_cursor INTO V_EMP_ROW;
        EXIT WHEN emp_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('--------------------');
        DBMS_OUTPUT.PUT_LINE('EMPNO : ' ||V_EMP_ROW.EMPNO);
        DBMS_OUTPUT.PUT_LINE('NAME : ' || V_EMP_ROW.NAME);
        DBMS_OUTPUT.PUT_LINE('REGDATE : ' || V_EMP_ROW.REGDATE);
        
    END LOOP;
END;
/

--실습 4-3
DECLARE
    CURSOR c1 IS SELECT * FROM DEPT;
BEGIN
    FOR c1_rec IN c1 LOOP --반복 한 번 할 때마다 커서가 하나씩 내려감!
        DBMS_OUTPUT.PUT_LINE('--------------------');        
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || c1_rec.DNAME);
        DBMS_OUTPUT.PUT_LINE('DTEL : ' || c1_rec.DTEL);
    END LOOP;
END;
/

--실습 5-1
CREATE PROCEDURE hello_procedure (p_name IN VARCHAR2)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('안녕하세요, ' ||p_name || '님!');
    DBMS_OUTPUT.PUT_LINE('환영합니다.');
END;
/

--프로시저 실행1
execute hello_procedure('홍길동');
execute hello_procedure('김철수');

drop procedure hello_procedure;

--함수 생성
CREATE FUNCTION get_emp_name (p_empno NUMBER)
RETURN VARCHAR2
IS
    v_ename VARCHAR2(20);
BEGIN   
    SELECT name
    INTO v_ename
    FROM emp
    WHERE empno = p_empno;
    RETURN v_ename;
END;
/

select get_emp_name(1001) from dual;

--실습 5-3
create table emp_log (
    log_date date,
    empno number,
    action varchar(10)
);

--트리거 생성
create trigger trgg_emp_insert
after insert on emp
for each row
begin
    insert into emp_log(log_date, empno, action)
    values (sysdate, :NEW.empno/*새로운 객체가 new임*/, 'INSERT');
end;
/

insert into emp values(2001, '김유신', 'M', '사원', 10, sysdate);
insert into emp values(2002, '김춘추', 'M', '대리', 10, sysdate);

