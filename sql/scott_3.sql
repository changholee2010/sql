select 'purge table "'||tname||'";' from tab;

select * from tab;

select * from user_recyclebin;

flashback table new_table to before drop;

create table new_emp(
 no number(4) constraint emp_no_pk primary key,
 name varchar2(20) constraint emp_name_nn not null,
 jumin varchar2(13) constraint emp_jumin_nn not null
                    constraint emp_jumin_uk unique,
 loc_code number(1) constraint emp_area_ck check (loc_code < 5),
 deptno number(2) constraint emp_dept_fk references dept(deptno)
);

create table new_table (
 no number(3) primary key, -- 회원번호 1 ~ 999
 name varchar2(100) not null, -- 이름 hongkildon
 birth date default sysdate -- 생년월일 -- to_date('2020-01-01','rrrr-mm-dd')
);

alter table new_table add phone varchar2(20);

alter table new_table read only;
-- 11g   21c
select * from new_table;
alter table new_table add info GENERATED always as (no || '-' || name); 

alter table new_table rename column phone to tel;
alter table new_table modify tel varchar2(30);

desc new_table;

alter table new_table drop column tel;

truncate table new_table;

drop table new_table purge;

select * from new_table;

rollback;

delete from new_table
where no = 1;

insert into new_table (no, name)
values(1, '홍길동');
insert into new_table (no, name, birth)
values(3, '홍길동', '2001-01-01');

update new_table
set phone = '010-2222-2222',
    birth = to_date('2001-02-02', 'rrrr-mm-dd')
where no = 2;

--------------------------------------------------------
select * from dept2
order by dcode;
desc dept2;

insert into dept2 (dcode, pdept, dname, area)
values('9001','1006','temp_2','temp area');

create table professor3
as
select * from professor
where 1 = 2;  -- CTAS

insert into professor3
select * from professor; -- ITAS

select * from professor3;

create table prof_1 (
 profno number,
 name varchar2(25));

create table prof_2 (
 profno number,
 name varchar2(25));

select * from prof_1;
select * from prof_2;

insert all
 when profno between 1000 and 1999 then 
   into prof_1 values (profno, name)
 when profno between 2000 and 2999 then 
   into prof_2 values (profno, name)
 select profno, name
 from professor;
 
insert all
   into prof_1 values (profno, name)
   into prof_2 values (profno, name)
 select profno, name
 from professor;

select * from professor;

update professor
set    bonus = decode(bonus, null, 100, bonus),
       pay = pay + (pay * 0.1)
       -- hpage를 이메일의 회사의 홈페이지로 변경.
where 1 = 1;

delete from professor
where hpage is not null;

-- dept 삭제.
select * from dept;

delete from dept
where deptno = 30;

select * from emp
--where deptno = 30
;

update emp
set deptno = 50
where deptno = 20;

select e.* from emp e, dept d
where e.deptno = d.deptno;

select * from dept;

update emp e
set    sal = sal + 100
where exists (select 1
              from dept d 
              where e.deptno = d.deptno
              and d.loc = 'DALLAS');


select *
from emp e
where exists (select 1
              from dept d 
              where e.deptno = d.deptno
              and d.loc = 'DALLAS');
-- 게시판, 회원관리, 상품관리 -> 
-- 오라클서버 --- 웹서버(노드) --- 클라이언트(fetch)

SELECT * FROM emp;
desc emp;


