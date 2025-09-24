char(2000)     -> '        13' '1st'
varchar2(4000) -> '13'
number(10,2) 12345678.90;

select 2 * '3' 
from dual;

SELECT empno
      ,ename
      ,job
      --,mgr 
FROM emp;

-- 표현식사용.
select empno as "사원번호" -- 별칭(alias)
      ,ename as "사원명" --
      ,'Good Morning !! ' || ename as "wecome 메세지" -- 메세지.
      ,ename || '''s 급여' || sal as "급여" -- kim's salary
from emp;     

-- distinct 
select distinct job, deptno
from emp
order by job desc;

-- 연습문제1.
select name || '''s ID: ' || id || ' , WEIGHT is ' || weight || 'kg' as "ID AND WEIGHT"
from student;

-- 연습문제2.
select ename || '(' || job || '), ' || ename || '''' || job || '''' as "NAME AND JOB"
from emp;

-- 연습문제3.
select ename || '''s sal is $' || sal as "Name And Sal" 
from emp;

-- 조건절.
select empno
      ,ename
      ,job
      ,mgr
      ,hiredate
      ,sal as "Salary"
      ,comm
      ,deptno
from emp
where  empno >= 7900 and empno < 8000
and    hiredate > '82/01/01';

select *
from professor
where 1=1--email like '%naver.com'
and pay + nvl(bonus, 0) >= 300;

select profno
      ,lower(name) as "low_name"
      ,upper(id) as "upp_id"
      ,initcap(position) as "pos"
      ,pay
      ,concat(concat(name, '-'), id) as "name_id"
from professor
where length(name) <> 10;

select name
      ,length(name) as "length"
      ,lengthb('홍길동') as "lengthb"
      ,substr(name, 1, 5) as "substr"
      ,instr(name, 'a') as "instr"
      ,pay
      ,bonus
      ,ltrim(lpad(id, 10, '*'), '*') as "lpad"
      ,rtrim('   Hello, World   ') as "str"
      ,replace('Hello', 'H', 'h') as "rep"
from professor
where instr(upper(name),'A') > 0;
-- 12000 00780

select name, tel, substr(tel, 1, instr(tel,')')-1) as "AREA CODE"
     , instr(tel,')')-1 as "val"
from student
where deptno1 = 201;

select ename, replace(ename, substr(ename,2,2), '--') as "replace"
from emp
where deptno = 20;

select name
     , jumin
     , replace(jumin, substr(jumin,7,7), '-/-/-/-') as "replace"
     , rpad(substr(jumin,1,6), 13, '-/') as "rpad"
from student
where deptno1 = 101;

select name, tel
      ,replace(tel, substr(tel, instr(tel, ')')+1, 3), '***') as "replace"
from student
where deptno1 = 102;

select name
      ,tel
      ,replace(tel, substr(tel, instr(tel, '-')+1, 4), '****') as "replace"
from student
where deptno1 = 101;
-- 1901, 2001 rrrr
select sysdate, to_char(sysdate, 'rrrr/mm/dd hh24:mi:ss') as "today"
from dual
where 1 = 1;

select to_date('2025-05-05 13', 'rrrr-mm-dd hh24') as "date"
from dual;




select empno
      ,ename
      ,job
      ,round(sal / 12, 2) as "month"
      ,trunc(sal / 12) as "trunc"
      ,mod(sal, 12) as "mod"
      ,ceil(sal/12) as "ceil"
      ,floor(sal/12) as "floor"
      ,power(4, 3) as "pow"
from emp;

select months_between('16/01/01', '12/01/01')
from dual;

select add_months(sysdate, 2), next_day(sysdate+1, '목') as "next_day"
      ,last_day(add_months(sysdate,1)) as "last"
from dual;









