select *
from tab;

select sysdate, to_char(sysdate, 'rrrr/mm/dd') as "system"
     ,to_char(12345.6, '$099,999.99') as "num"
from dual;

select empno
      ,ename
      ,job
      ,to_char(sal, '999,999') as "salary"
from emp;

select *
from professor
where hiredate >= to_date('1990/01/01 09:00:00', 'rrrr/mm/dd hh24:mi:ss')
and hiredate < to_date('2000/01/01 00:00:00', 'rrrr/mm/dd hh24:mi:ss');

select *
from emp
where sal + nvl(comm, 0) >= 2000;

select profno, name, pay * 12 as "pay", nvl(bonus, 0) as "bonus",
       pay * 12 + nvl(bonus, 0) as "total"
from professor
where deptno = 201;

select profno, name
      ,nvl2(bonus, (pay*12)+bonus, (pay*12)) as "total" 
from professor;

select empno, ename, nvl2(comm, 'Exist', 'Null') as "NVL2"
from emp
where deptno = 30;

select empno, ename
      ,decode(job, 'SALESMAN', '영업부서', decode(job, 'MANAGER', '관리부서', '기타부서')) as "dept"
      --,job
from emp;

select name, jumin
      ,decode(substr(jumin,7,1), '1', 'Man', 'Woman') as "Gender"
from student;

select name, tel, grade
      ,decode(substr(tel, 1, instr(tel, ')') -1),'02','SEOUL',
                                                '031', 'GYEONGGI', 
                                                '051', 'BUSAN', 
                                                '052', 'ULSAN', 
                                                '055', 'GYONGNAM') as "LOC"
from student
where deptno1 = 101;

select name, tel
      ,case substr(tel, 1, instr(tel, ')') -1) when '02' then 'SEOUL'
                                               when '031' then 'GYEONGGI'
                                               when '051' then 'BUSAN'
                                               when '052' then 'ULSAN'
                                               when '055' then 'GYONGNAM'
                                               else '기타'
      end as "LOC"
from student
where deptno1 = 101;

select profno, name, position, pay*12 as "pay"
      ,case when pay*12 > 5000 then 'High'
            when pay*12 > 4000 then 'Mid'
            when pay*12 > 3000 then 'Low'
            else 'Etc'
       end as "Sal"
from professor
where case when pay*12 > 5000 then 'High'
           when pay*12 > 4000 then 'Mid'
           when pay*12 > 3000 then 'Low'
           else 'Etc'
      end = 'High';

select *
from department;

select profno, name, 'Professon', pay
from professor
where deptno = 101
union
select studno, name, 'Student', 0
from student
where deptno1 = 101;

select min(job), count(*) as "인원", sum(sal) as "직무 급여 합계", avg(sal) as "급여평균"
     ,stddev(sal) as "표준편차"
     ,variance(sal) as "분산"
from emp
group by job;

select to_char(hiredate, 'rrrr') as "HD", count(*) as "인원"
from emp
group by to_char(hiredate, 'rrrr');

--학생, 학과별 인원.
select deptno1, count(*) as "인원"
from student
group by deptno1
having count(*) > 2;

--교수, position, pay합계, 최고급여, 최저급여 출력.
select position, sum(pay) as "급여합계", max(pay) as "최고급여", min(pay) as "최저급여"
from professor
group by position;

--사원, 부서별 평균급여, 인원.
--사원, 부서, 직무별 평균급여, 인원.
--사원, 평균급여, 인원.

-- 부서, 직무, 급여, 인원
-- 부서       급여, 인원
-- 부서, 직무, 급여, 인원
-- 부서       급여, 인원
--            급여, 인원

select deptno, null, round(avg(sal)), count(*), 'a'
from emp
group by deptno
union
select deptno, job, round(avg(sal)), count(*), 'b'
from emp
group by deptno, job
union
select null, null, round(avg(sal)), count(*), 'c'
from emp
order by 1, 2;

select decode(nvl(deptno, 999),999,'전체',deptno) as "부서"
     , nvl(job, '합계') as "직무"
     , round(avg(sal)) as "평균급여"
     , count(*) as "사원수"
from emp
group by cube(deptno, job)
order by 1, 2;

select count(*) from emp; -- 12
select count(*) from dept; -- 4

select count(*) --dept.*, emp.*
from emp, dept;

select *
from student;

select studno, s.name as "학생명"
     , s.grade
     , p.name as "교수명"
     , s.deptno1
     , d.dname as "학과명"
from student s-- 교수번호
left outer join professor p
on s.profno = p.profno
join department d
on s.deptno1 = d.deptno;

select p.profno, p.name, s.studno, s.name, s.profno as "담당교수"
from student s right outer join professor p
on p.profno = s.profno
;
select *
from student;

select *
from salgrade;

select s.grade, e.*
from emp e
join salgrade s
on e.sal >= s.losal
and e.sal <= s.hisal
where s.grade = 2;

-- oracle join.
select e.*, d.*
from emp e, dept d
where e.deptno = d.deptno;

select e1.empno as "사원번호"
      ,e1.ename as "사원명"
      ,e2.empno as "관리자번호"
      ,e2.ename as "관리자명"
from emp e1, emp e2
where e1.mgr = e2.empno(+);

select p.profno, p.name, s.studno, s.name
from professor p
left outer join student s
on p.profno = s.profno
order by s.studno, p.profno;

-- 254page 1번.
select s.name as "STU_NAME", d.deptno as "DEPTNO1", d.dname as "DEPT_NAME"
from student s
join department d
on s.deptno1 = d.deptno;

select * from p_grade;
-- 2번.
select e.name, e.position, to_char(e.pay, '999,999,999') as "PAY"
     , to_char(p.s_pay, '999,999,999') as "Low PAY"
     , to_char(p.e_pay, '999,999,999') as "High PAY"
from emp2 e
join p_grade p
on e.position = p.position;

-- 3번.
select * from p_grade;
select * from emp2;

select e.name, trunc(months_between(add_months(sysdate, -144), e.birthday)/12) as "AGE"
      ,e.position as "CURR_POSITION"
      ,p.position as "BE_POSITION"
from emp2 e
join p_grade p
on trunc(months_between(add_months(sysdate, -144), e.birthday)/12) between p.s_age and p.e_age;

select * from customer;
select * from gift;

select c.gname as "CUST_NAME", c.point, g.gname as "GIFT_NAME"
from customer c
join gift g
on c.point >= g.g_end
and g.gname = 'Notebook';

-- 5
select * from professor;
select p1.profno, p1.name, p1.hiredate, count(p2.profno)
from professor p1
left outer join professor p2
on p1.hiredate > p2.hiredate
group by p1.profno, p1.name, p1.hiredate
order by 4;

select * from emp;
select e1.empno, e1.ename, e1.hiredate, count(e2.empno) as "COUNT"
from emp e1
left outer join emp e2
on e1.hiredate > e2.hiredate
group by e1.empno, e1.ename, e1.hiredate
order by 4;
