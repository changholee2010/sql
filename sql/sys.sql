select username from all_users;

ALTER SESSION SET "_ORACLE_SCRIPT"=true;

CREATE USER scott
IDENTIFIED BY tiger
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE
TO scott;


select * from tab;

select * from dba_users
order by username;

SELECT *
FROM  dba_users
WHERE username = 'SCOTT';

ALTER USER SCOTT ACCOUNT UNLOCK;