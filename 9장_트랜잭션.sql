/*
    날짜 : 2025/08/12
    이름 : 이다은
    내용 : 9장 트랜잭션 실습
*/

-- 실습 9-1
select * from account;

update account set 
    acc_balance = acc_balance-10000
    where acc_no = '101-11-1001';
    
update account set 
    acc_balance = acc_balance+10000
    where acc_no = '101-11-1003';
    
-- 작업 확정
commit;

-- 실습 9-2
update account set 
    acc_balance = acc_balance-10000
    where acc_no = '101-11-1001';
    
update account set 
    acc_balance = acc_balance+10000
    where acc_no = '101-11-1003';
    
select * from account;
-- 다른 세션에 반영되기 전에 작업 취소!
ROLLBACK;


-- 실습 9-3
show autocommit;
set AUTOCOMMIT on;

update account set 
    acc_balance = acc_balance-10000
    where acc_no = '101-11-1001';
    
update account set 
    acc_balance = acc_balance+10000
    where acc_no = '101-11-1003';
    
select * from account;