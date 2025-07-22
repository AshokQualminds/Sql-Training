

Example QUERIES
 create table stu_dent(rollno number(10),sname varchar2(20),course varchar2(20),
                 fee number(5));
 insert into stu_dent values(1,'naresh','oracle',2000);
 select *from stu_dent;





--sql>insert into stu_dent(rollno,course)values(2,'java');
--sql>insert into stu_dent(rollno,course)values(2,'java');
--sql>select *from stu_dent where sname='naresh';
--sql>select *from stu_dent where course='java';
--sql>create table samp_tab(eid number(10),ename varchar2(20),job varchar2(20),sal number(7,2));
--Display salary of employees  with 2000 increment in their salary.
--Sql> SELECT ename,sal,sal + 2000 "Incremented salary" FROM emp
--Display the details of employees decreasing their salary by 200.
--Sql> select ename,sal,sal-200 from emp;
--Explination:-in emp table every employee salary subtracted with 200.
--Arithmetic Operator Multiplication(*) :-Used to perform multiplication.
--Example:-
--Display the details of the employees Incrementing their salary two times.
-- Sql> SELECT sal * 2 FROM emp;
--Explination:-every  emp table salary is multiplied by 2.
--Display half of the salary of employees.
--Sql> SELECT sal, sal/2 FROM emp;
--Sql> select empno,ename,sal,12*sal+100 from emp;
-- Sql> select empno,ename,sal,(12*sal)+100 from emp;
-- Sql> select empno,ename,sal,12*(sal+100) from emp;

--Display the details of Employees whose salary is equal to 2000.
--Sql> SELECT *FROM emp WHERE sal=950;
--Example: Display the details of the employees whose salary is less than 3000.
--  Sql> SELECT * FROM emp WHERE sal < 3000;
--Display the details of Employees whose salary is less than or equal to 3000.
--Sql> SELECT * FROM EMP WHERE sal <= 3000;
--Display the details of employees whose salary is not equals to 2000.
--Sql> SELECT * FROM emp WHERE sal != 3000;
--Sql> SELECT * FROM emp WHERE sal ^= 2000;
--Sql> SELECT * FROM emp WHERE sal <> 2000;
--Display the details of Employees whose salary is Greater than 1000 AND also whose salary is less than 2000.
--   Sql> SELECT *FROM emp WHERE sal > 1000 AND sal <2000;
--Sql> select ename,sal,job from emp 
--       where (sal>=1500 and sal<=5000) and
--       job='MANAGER';
--Display the details of Employees whose salary is Greater than 1000 OR also whose salary is less than 2000.
--Sql> SELECT *FROM emp WHERE sal> 1000 OR sal < 2000;
--Explination:-whose salaries more than 1000 or less than 2000 that all emp table display.
--SQL> select empno,ename,job,hiredate  from emp
--         where job='MANAGER' or deptno=20;
--sql> select empno,ename,job,hiredate  from emp
--          where (job='MANAGER' or deptno=10);
--sql> select empno,ename,job,hiredate  from emp
--                where (job='CLERK' or job='SALESMAN' or job='ANALYST');
--SQL> select empno,ename,job,hiredate  from emp
--               where (sal<=2500 or sal>=5000) or job='MANAGER';
--sql> select ename,job ,sal from emp
--               where job='CLERK' or job='MANAGER' and sal>1500;
--Display the details of employees whose salary is Greater than or Equals to 3000.
--Sql> SELECT * FROM emp WHERE sal < 3000;
--Explination:-whose salary less than 3000 that salaries all are comming.
--SQL> select empno,ename,job,sal from emp
--               where not ename='SMITH';
--SQL> select empno,ename,job,sal from emp
--          where not sal>=5000;
--sql> select empno,ename,job,sal,deptno from emp
--           where not job='CLERK' and deptno=20;
--Sql> SELECT *FROM emp WHERE empno IN (7125, 7369, 7782);
--Sql> UPDATE emp SET sal=sal+200 WHERE ename IN ('SMITH','ALLEN','WARD');
--Sql> DELETE FROM emp WHERE hiredate IN ('22-DEC-82','17-NOV-81');
--Sql> UPDATE emp SET sal=sal+200 WHERE ename NOT IN            
--                       ('SMITH','ALLEN','WARD');
--          Sql> DELETE FROM emp WHERE hiredate NOT IN ('22-DEC-82',' 17-NOV-81');
--SQL> select ename,sal,job from emp
--         where job between 'MANAGER' and 'SALESMAN';
--sql> select ename,sal,job,hiredate from emp
--         where hiredate    between '17-DEC-81' and '20-JUN-83';
--Sql> select ename,sal,job from emp
--      where job  not  between 'MANAGER' and 'SALESMAN';
--  sql> select ename,sal,job,hiredate from emp
--          where hiredate not   between '17-DEC-81' and '20-JUN-83';
--Example:- Display the employees whose name is starting with ‘S’ in EMP table.
--Sql> SELECT * FROM emp WHERE ename LIKE   'S%'
--EMPNO ENAME	JOB        	MGR HIREDATE    SAL  COMM DEPTNO
-------------------------------------------------------------------------------------------------------
-- 7369 SMITH                CLERK		7902 17-DEC-80   800		20
-- 7788 SCOTT                ANALYST    	7566 19-APR-87  3000            20

--Display the employees whose name ends with ‘S’ in EMP table
--Sql> SELECT * FROM emp WHERE ename LIKE '%S'
--EMPNO ENAME	JOB         	MGR HIREDATE    	SAL  COMM DEPTNO
------------------------------------------------------------------------------------------------------------
-- 7566 JONES                 MANAGER    	7839 02-APR-81	2975	20
-- 7876 ADAMS               CLERK      	7788 23-MAY-87    	1100    20
-- 7900 JAMES                 CLERK      	7698 03-DEC-81      	950      30

--Display the employees whose names are having second letter as ‘L’ in EMP table
--Sql> SELECT * FROM emp WHERE ename LIKE '_L%'

--EMPNO ENAME                     JOB         MGR HIREDATE    SAL  COMM DEPTNO
-------------------------------------------------------------------------------------------------------
-- 7499 ALLEN                     SALESMAN   7698 20-FEB-81  1600   300	     30
-- 7698 BLAKE                     MANAGER    7839 01-MAY-81  2850      	     30
-- 7782 CLARK                     MANAGER    7839 09-JUN-81  2450      	     10
--Sql> select ename ,hiredate from  emp where hiredate  like '%JAN%';
--Sql> select empno,ename,job from emp where job like '_____';
--SQL> select empno,ename,job ,hiredate from emp where hiredate like '%-FEB-81';
--  Sql> select *from dept where dname like '__/_%' escape '/';
--(update dept set dname=’SO_FT_WARE’  where deptno=50;)
--Display the employees whose names are not having second letter as ‘L’ in EMP table?
--Sql> SELECT *FROM emp WHERE ename NOT LIKE '_L%';

--Display the employees whose names are not start with ‘S’ in EMP table.?
--Sql> SELECT *FROM emp WHERE ename NOT LIKE 'S%';
--Sql> select ename ,hiredate from  emp where hiredate not like '%JAN%';
--Sql> select empno,ename,job from emp where ename not like '_O%';

--Display the employees whose names are second letter start with ‘R’ from ending.?  
--Sql> SELECT *FROM emp WHERE ename LIKE '%R_';
--EMPNO ENAME	JOB         	MGR HIREDATE    SAL  COMM DEPTNO
-------------------------------------------------------------------------------------------------------
-- 7521 WARD                 SALESMAN   	7698 22-FEB-81    1250   500     30
-- 7782 CLARK                MANAGER    	7839 09-JUN-81     2450           	   10
-- 7902 FORD                  ANALYST    	7566 03-DEC-81     3000              20

--Display the names in EMP table whose names having ‘LL’.?
--Sql> SELECT *FROM  emp WHERE ename LIKE ‘%LL%’;
--EMPNO ENAME          JOB         		MGR HIREDATE    SAL  COMM DEPTNO
-------------------------------------------------------------------------------------------------------
-- 7499 ALLEN               SALESMAN	7698 20-FEB-81  1600   300     30
-- 7934 MILLER             CLERK		7782 23-JAN-82  1300           	   10


--Sql> SELECT *FROM emp WHERE comm IS NULL;
--Sql> select empno,ename,job,sal ,deptno from emp where mgr is null;
--Sql> SELECT *FROM emp WHERE comm IS NOT NULL;
--Sql> select empno EmpNumber, ename EmpName,sal "EmpSalary",
--                     job Designation from emp;
--sql>select grade as "SalGrade", hisal "High Salary Range",losal "Low Salary Range"
--                             from salgrade;
--             sql> select empno "EmpNuber",sal "Basic",sal*0.25 HRA,sal*0.20 DA ,sal*0.15 "pf",
--                               sal+sal*0.25+sal*0.20+sal*0.15 "Gross" from emp;

--Sql>select *from emp where job<>'CLERK';
--SQL>select *from emp where sal>2500;
--Sql> select *from emp where job='SALESMAN' OR SAL>3000;
--Sql>select *from emp where deptno=10 or deptno=20 or deptno=50 or deptno=60;
--Sql> select *from emp where ename in('FORD','MILLER');
--Sql>select *from emp where sal between 3000 and 5000;
--Sql> select *from emp where comm is not null;
--Sql>select *from emp where ename like '_L%';
--Sql> select ename||'   '||job||'   '||sal from emp;
--Sql>select ename,sal,comm,sal+nvl(comm,0) from emp;
--Sql> select ename,sal,comm,(sal*12)+nvl(comm,0)  from emp;
--Sql>select ename,sal,comm,(sal+500)+nvl(comm,0) from emp;
--Sql>select  comm,nvl2(comm,0,1000) from emp;
--        Sql>select sal,comm,sal+nvl2(comm,100,1000)  from emp;
--        Sql>select ename,sal,comm,nvl2(comm,sal+comm,sal) income from emp
--                      where deptno in(10,30);
--Sql> select deptno,count(*) from emp
-- group by deptno
-- having count(deptno)>3;
--sql> select deptno,avg(sal) from emp
-- group by deptno
-- having avg(sal)>2500;
--sql> select deptno,min(sal),max(sal), sum(sal) from emp
-- where job='MANAGER'
-- group by deptno
-- having avg(sal)<1000;
--Sql> select max(avg(sal)) from emp group by deptno;
--Sql> select max(sum(sal)),min(sum(sal)) from emp 
--             group by deptno;
--sql> select max(avg(sal)),min(avg(sal)) from emp
--group by job;
--Example: Display employee records order by ename.
--Sql>SELECT *  FROM emp  ORDER BY ename;
--Here we can see that ‘ENAME’ values resulted in ‘ASCENDING ORDER’.
--Example: Display employee records order by ‘ename’ in descending order. Here we need to explicitly specify the keyword ‘DESC’.
--Sql>SELECT * FROM EMP ORDER BY ename DESC;
--Ordering the result based on a numeric column:-
--  Sql>SELECT * FROM emp  ORDER BY sal;
--We can as well order the result using a column sequence:-
--  Sql>SELECT empno,ename,job,sal  FROM emp
--              ORDER BY 2;
--Here 2 represents second column. So, data will be displayed with ename in ascending order.
--Sql> select ename,job,sal,deptno from emp where sal>=2000
--                 order by deptno,ename desc;
--sql> select  ename,job,sal,sal*12 Annualsal from emp 
--                 order by Annualsal;
--sql> select  ename,job,sal,deptno from emp 
--               order by deptno,job,sal;
--sql> select *from emp order by 5 desc;

--Sql> select *from emp where job=(select job from emp where ename='SMITH')
--               AND ENAME<>'SMITH'
--               AND ENAmE LIKE '%A%';
--SQL> select ename,sal,deptno from emp 
--           where sal>2000 and deptno=(select deptno from dept 
--            where loc='DALLAS');
--SQL> select ename,job,deptno,sal from emp
--            where job='CLERK' and deptno=(select deptno from dept 
--              where dname='SALES');
--SQL> select ename,job ,deptno from emp
-- where deptno in(select deptno from emp
-- where ename='FORD')
-- AND
-- job in(select job from emp
-- where deptno=(select deptno from dept
-- where dname='SALES'));	
--SQL>SELECT EMPNO,ENAME,JOB,SAL,DEPTNO FROM EMP 
--         WHERE SAL<ANY(SELECT SAL FROM EMP
--         WHERE DEPTNO=30);
--sql> select *from emp 
--where sal>all(select avg(sal) from emp 
--group by deptno);
--sql>select ename,job,sal,deptno from emp 
--        where sal<all(select max(sal) from emp  group by job);
--sql> select e.empcount,d.deptcount from
--       (select count(*) empcount from emp)e,
--       (select count(*) deptcount from dept)d;
--Sql> select  e.empcount,d.deptcount,s.gradecount,
--     e.empcount+d.deptcount+s.gradecount totalreccount from
--     (select count(*) empcount from emp )e,
--     (select count(*) deptcount from dept)d,
--     (select count(*) gradecount from salgrade)s
--Sql> select a.deptno "deptment number",(a.numemp/b.totalcount)*100 "%employees",
--     (a.salsum/b.totalsal)*100 "%salary" from(select deptno,count(*) numemp,
--     sum(sal) salsum from emp group by deptno)a,
--     (select count(*) totalcount ,sum(sal) totalsal from emp)b
--sql> select *from dept d where exists(select *from emp e
--         where deptno=d.deptno
--          and deptno=10);
--sql>select p.ename from emp p
--             where exists (select *from emp c 
--             where c.empno=p.mgr);
-- sql> select *from dept d where exists(select *from emp e
--         where deptno=d.deptno
--          and deptno=10);
--sql>select p.ename from emp p
--             where exists (select *from emp c 
--             where c.empno=p.mgr);
--sql>select empno,ename,job,sal,nvl(comm,0),sal+nvl(comm,0)
--             from emp
--             where deptno=(select deptno from emp where empno=7654);
--SQL>select *from emp where deptno=(select deptno from emp 
--            where ename='FORD')and job in(select job from emp 
--             where deptno=(select deptno from dept
--              where dname='SALES'));
--sql> SQL> select empno,ename,job,sal,deptno from emp
--              where sal>(select max(sal) from emp
--              where job='SALESMAN');
--1. SQL> select empno, ename from emp where deptno=(select deptno from dept where dname='RESEARCH');

--2. SQL> select empno, ename from emp where deptno in (select deptno from dept where loc in ('NEW YORK','CHICAGO'));

--3. SQL> select dname from dept where deptno in ( select deptno from emp where job ='ANALYST');

--4. SQL> select empno, ename, mgr from emp where mgr = (select empno from emp where ename='JONES');

--5. SQL> select empno, ename, mgr from emp where mgr = (select mgr from emp where ename='JONES')

--6. SQL> select empno, ename, job from emp where deptno in ( select deptno from dept where dname in ('SALES','ACCOUNTING'))

--7. SQL> select empno, ename, job from emp where deptno in ( select deptno from dept where dname in ('SALES','RESEARCH')) and empno in (select mgr from emp)

--8. SQL> select empno, ename from emp where empno not in ( select mgr from emp where mgr is not null)

--9. select empno, ename from emp where empno in (select mgr from emp group by mgr
--having count(*) >= 2)

--10. SQL> select dname from dept where deptno in (select deptno from emp group by deptno having count(*) >=5)

--11. SQL> select deptno, job, count(*) from emp where job = 'SALESMAN' group by deptno, job having count(*) >=3


--12. SQL> select empno, ename, deptno from emp where empno in (select mgr from emp group by mgr
--having count(*) >= 2) and deptno in (select deptno from dept where dname='RESEARCH' or dname='ACCOUNTING')

--13. SQL>select max(sal) from emp where sal < (select max(sal) from emp);

--14. SQL> select max(sal) from emp where sal < (select max(sal) from emp where sal < (select max(sal) from emp where sal < (select max(sal) from emp)))

--15.sql> SELECT * FROM EMP r1
-- WHERE &n=(SELECT COUNT(DISTINCT(SAL))
-- FROM EMP WHERE SAL>=r1.SAL);
--1. SQL> SELECT * FROM emp WHERE ename LIKE 'S%';

--2. SQL> SELECT * FROM emp WHERE ename LIKE '_L%';

--3. SQL> SELECT * FROM emp WHERE ename LIKE '%E_';

--4. SQL> SELECT * FROM emp WHERE ename LIKE '____';

--5. SQL> SELECT * FROM emp WHERE ename LIKE '%L%';

--6. SQL> SELECT * FROM emp WHERE ename LIKE '_____%';

--7. SQL> SELECT * FROM emp WHERE sal BETWEEN 2000 and 3000;

--9. SQL> SELECT * FROM emp WHERE mgr IS NULL OR COMM IS NULL;

--10. SQL> SELECT * FROM emp WHERE mgr IS NULL AND COMM IS NULL;

--11. SQL> SELECT * from emp WHERE job = 'MANAGER';

--12. SQL> SELECT * from emp WHERE job = 'MANAGER' and deptno in (10,20);

--13. SQL> SELECT * FROM emp WHERE job IN ('CLERK','ANALYST') AND sal >= 1000 AND deptno IN      
--       (20,30);

--14. SQL> SELECT * FROM emp where deptno in (20,30) and comm IS NULL;

--15. SQL> SELECT * FROM emp WHERE ename LIKE ('A%') OR ename LIKE ('S%');

--16. SQL>SELECT * FROM emp WHERE ename NOT LIKE ('%S') AND deptno IN (20,30);

--17. SQL> SELECT * FROM emp where comm IS NOT NULL AND sal > 1500 AND deptno = 30;

--18. SQL> SELECT * FROM emp where comm IS NOT NULL AND sal > 1500 AND job = 'MANAGER'
  
--19. SQL> SELECT * FROM emp WHERE job = 'MANAGER' OR job = 'CLERK' AND sal >=2000 AND deptno NOT IN (10,20);

--20. SQL> SELECT * FROM emp WHERE COMM IS NOT NULL;

--21. SQL> SELECT * from emp WHERE sal NOT BETWEEN 2000 AND 3000 AND job LIKE ('%MAN%');
--1).display the employee who got the maximum salary
--   Sql> select *From emp where sal=(select max(sal) from emp);

--2) display the employee who are working in sales department
--SQL> select *from emp where deptno in(select deptno from dept       
--           where dname='SALES');

--3) display the employee who are working are working as “clerk”
--SQL> select *from emp where job in(select job from emp 
--         where job='CLERK');

--4) display the employee who are working are working in “new work”
--Sql> select *From emp where deptno=(select deptno from dept 
--                where loc=(select loc from dept 
--                where loc='NEW YORK'));

--5)find out number of employees working in sales department
--Sql> select *from emp where deptno=(select deptno from dept
--             where dname='SALES'
--             group by deptno);

--6) deleting  the employees  who are working are working in accounting 
--      Department
--SQL> delete from dept where deptno=(select deptno from dept
--             where dname='ACCOUNTING');

--Sub query operators :(all,any,exists,some,not exists)
--1)list out the employees who earn more than every employee in department 30
--Sql> select *from emp where sal>all(select sal from emp
--          Where  deptno=30);

--2) list out the employees who earn more than the lowest salary in deptno 30
--Sql> select *from emp where sal>any(select sal from emp 
--            where deptno=30);

--3)find out which  department  does not  have any  employees
--Sql> select deptno from dept d
--          where not exists (select deptno from emp e
--          where e.deptno=d.deptno);

--4)find out employees who earn greater than the average salary for  their department
--Sql> select empno,ename,job,sal,deptno From emp e
--  where sal>(select avg(sal) from emp  where deptno=e.deptno);

--5)List the empno, ename, sal, dname of all the ‘Mgrs’ and       
--    ‘Analyst’working in NEWYORK, DALLAS with an exp more than 7 years without
--           receiving the Comma Asc order of Loc
--sql> SELECT EMPNO, ENAME,SAL, dname FROM EMP, DEPT
--              WHERE LOC IN ('NEW YORK','DALLAS') AND
--               JOB IN('MANAGER','ANALYST')AND
--                 MONTHS_BETWEEN(SYSDATE,HIREDATE)/12 > 7
--                 AND COMM IS NULL
--                  AND EMP.DEPTNO = DEPT.DEPTNO;
--Sql> sql> select ename,job,sal,d.deptno,d.dname from emp e,dept d
--                 where e.deptno=d.deptno and e.ename in('SMITH','FORD');
--sql>select empno,job,sal,e.deptno ,d.dname,d.loc from emp e,dept d
--                  where e.deptno=d.deptno and d.deptno<>20;
--sql> select e.empno,e.ename,e.sal ,s.grade from emp e,salgrade s 
--                where (e.sal>=s.losal and e.sal<=s.hisal) and s.grade=1;    
-- sql>select e.ename,e.job,m.ename from emp e,emp m
--                 where e.mgr=m.empno
--                 and e.job  NOT IN('MANAGER','CLERK','ANALYST');
--sql>select ename,job,dname,loc from emp ,dept
--                      where ename ='MARTIN';
--sql> select e.ename,d.deptno,d.dname from emp e,dept d
--         where e.deptno=d.deptno(+)
--         and e.deptno(+)=10
--         order by e.deptno;
--sql> select emp.ename from emp left OUTER join dept on (emp.deptno = 
--                      dept.deptno) and emp.ename like 'A%';
--                            Sql>SELECT dname, ename FROM dept NATURAL JOIN emp;

--SQL> select ename,loc from emp e join dept d
--              on e.deptno=d.deptno
--              where loc='CHICAGO';
--Sql> select e.ename,e.sal,d.deptno,d.dname,s.grade from emp e join
--                  dept d on e.deptno=d.deptno join salgrade s
--                   on e.sal between s.losal and s.hisal;

--sql>alter table dept drop primary key cascade;
--* To drop a not null constraint to existing table
--Syntax:-alter table tableName constraint constraintName;
--sql>alter table emp drop constraint emp_mgr-fk;
--sql>alter table dept drop unique(dname);
--* If we want to see the indexName that time we writy the below example
--Example:-
--sql> select index_name from user_constraints 
--         where table_name='EMP';
--Enabling constraints:-
--• The constraint can be enabled without dropping  it or recreating it.
--• The alter table statement with the enable clause is used for the purpose.
--Syntax:-
--      Alter table <tablename> enable constraint             
--            <constraintname>;
--Sql> create table   customer
--                 (status char(3) not null,
--                  sal    number  not null);
--Sql> CREATE TABLE Stu_Class(
--           Stu_Id number(2) NOT NULL,
--           Stu_Name varchar2(15) NOT NULL,
--           Stu_Class  varchar2(10) NOT NULL);
--sql>CREATE TABLE supplier
--( supplier_id numeric(10) not null,
--  supplier_name varchar2(50) not null,
--  contact_name varchar2(50),
--  CONSTRAINT supplier_unique UNIQUE (supplier_id)
--);

--sql> CREATE TABLE supplier
--( supplier_id numeric(10) not null,
--  supplier_name varchar2(50) not null,
--  contact_name varchar2(50),
--  CONSTRAINT supplier_unique UNIQUE (supplier_id, supplier_name)
--);
--sql>CREATE TABLE t1 (
--        c1 NUMBER,
--        c2 VARCHAR2(30),
--        c3 VARCHAR2(30),
--        PRIMARY KEY (c1,c2));
--Sql>CREATE TABLE t1 (
--        c1 NUMBER,
--        c2 VARCHAR2(30),
--        c3 VARCHAR2(30),
--        CONSTRAINT t1_pk PRIMARY KEY (c1,c2));
--Sql> create table b1(name varchar2(20)  constraint che_name check(name=upper(name)));
--Sql> create table dept(deptno number(2) constraint dno_pk primary key
--                    constraint deptno_chk check(deptno between 10 and 99),
--                    dname varchar2(20) constraint dname_nn not null constraint dname_chk
--                    check(dname=upper(dname)),loc varchar2(20) default 'NEW YORK'
--                    constraint loc_chk check(loc in('NEW YORK','DALLAS','BOSTON','CHICAGO')));
--sql> create table emp(empno number(4) constraint empno_pk primary key,
--          ename varchar2(20) constraint ename_nn not null
--          check(substr(ename,1,1) between 'A' and 'Z' and
--       ename=upper(ename)),job varchar2(20) constraint job_chk
--      check(job in('ANALYST','CLERK','MANAGER','PRESIDENT','SALESMAN')),
--       hiredate date default sysdate,
--       sal number(8,2) constraint sal_nn not null
--       constraint chk_sal check(sal between 1000 and 10000),
--       comm number(8,2),
--      deptno number(2), constraint tot_sal_chk
--      check(sal+comm<=100000));

--  sql>select job from emp where deptno=20
--•	              union
--•	              select job from emp where deptno=30;
--•	   Sql> SELECT * FROM
--•	              (SELECT ENAME FROM EMP WHERE JOB = 'CLERK'
--•	                union
--•	              SELECT ENAME FROM EMP WHERE JOB = 'ANALYST');
--sql> SELECT * FROM
--               (SELECT SAL FROM EMP WHERE JOB = 'CLERK'
--                    union all
--             SELECT SAL FROM EMP WHERE JOB = 'ANALYST');
--      sql>  SELECT ename FROM
--                (SELECT ENAME FROM EMP WHERE JOB = 'CLERK'
--                    intersect
--               SELECT ENAME FROM EMP WHERE JOB = 'ANALYST');
--     sql> SELECT * FROM (SELECT SAL FROM EMP               
--                 WHERE JOB = 'PRESIDENT'
--                     except
--            SELECT SAL FROM EMP WHERE JOB =   
--                     'MANAGER');
--   Sql>select rownum ,ename from emp where rownum<7
--                              except
--           select rownum,ename from emp where rownum<6;
--Sql> create or alter view edept30 as
--         select *from emp where deptno=30
--         with check option constraint edept30chkview;
--sql> create or alter view emanage as
--       select *from emp where job='MANAGER'
--       with check option constraint empmanagerview;
-- Sql> create or alter view edeptread(empid,name,designation)
--             as
--             select empno,ename,job from emp
--             where deptno=20 with read only;
--   sql> create or alter force view v5
--               as
--            select *from master;
--    sql> create view payinfo as select empno Ecode,sal Basic,sal*0.25 Da,sal*0.35 HRA,
--            sal*0.12 PF ,sal+sal*0.25+sal*0.35+sal*0.12 GROSS from emp;
--    sql> sql>create or alter view empManagers as
--         select rownum serialNo,initcap(e.ename)||'works under'||m.ename "Employee and      
--          Managers" from emp e,emp m where e.mgr=m.empno;
--     sql>create or alter view EmpAccounts as
--        select ename,deptno,sal monthly,sal*12 Annual from emp
--        where deptno=(select deptno from dept where dname='ACCOUNTING')
--        order by Annual;
--  sql> create or alter view CumSum as  select     
--        B.sal,sum(A.sal)cum_sal
--        from emp A,emp B where A.rowid<=B.rowid
--        group by B.rowid,B.sal;
--    sql> create or alter view OrgDesignations as
--         select job from emp
--         where deptno=10 union
--         select job from emp where deptno in(20,30);
--   sql> create or alter view empview(empNumber,empName,emsSal,empDeptno)
--              as
--             select empno,ename,sal,deptno from emp
--                where deptno=20;
--sql> create materialized view employee_view
--         refresh on commit
--         enable query rewrite
--                as
--         select job,sum(sal) from emp
--             group by job
--          /
--     Sql> create materialized view  emp_dept_sum
--               enable query rewrite
--               as
--               select dname,d.deptno,sum(sal) from emp e,dept d
--               where e.deptno=d.deptno
--               group by dname,d.deptno;
--Sql> create index jobindex on emp(job);
--Sql> create unique index eno_uniq_index on emp(empno);
--Sql> create index DnoIndex on dept(Deptno);
--Sql> create index upper_dept_dname_index on dept(upper(loc));
--Sql> create bitmap index indexempbitmapdeptno on emp(deptno);
--Sql> create unique index eno_ename_index on emp(empno,ename); 
--Sql> select job,avg(sal) from emp group by rollup(job);
--sql> select  job, deptno,avg(sal) salary from emp
--group by rollup(job,deptno);
--sql> select deptno,job,sum(sal) salary from emp
--group by cube(deptno,job);
--sql> select deptno,grouping(deptno),job,grouping(job),sum(sal) from emp
--group by cube(deptno,job);
--    sql> select decode(grouping(job),1,'ALL Designations',job)departments,sum(sal)
--             from emp group by rollup(job);
--sql> select ename,mgr ,sum(sal) from emp group by grouping sets(ename,mgr)
--Sql> select empno,ename,job,sal,case job when 'MANAGER' then 'man'
--             when 'CLERK' then 'clk'
--             when 'SALESMAN' then 'sman'
--             else 'other job'
--             end
--             from emp;
--sql> select ename,sal,case when sal>=800 and 
--             sal<=2000 then 'lowest pay'
--            	when sal>=2001 and sal<=4000 then 'moderate pay'
--             else 'high pay' end
--             from emp;
--Sql> select empno,ename,job,sal,
--case when job='MANAGER' then  'MAG'
--             when sal=3000  then 'MPAY'
--             when job='SALESMAN' then 'SMAN'
--else 'not specified' end
--             cjob from emp;
--sql>  select mgr,deptno ,sum(sal) from emp
--            	group by mgr ,cube(mgr,deptno);
--sql>      sql> select deptno,job,group_id(),sum(sal) from emp
--             group by deptno,rollup(deptno,job)
--             having group_id()=0;
--  sql> select *from(select empno,ename,sal,deptno,rank() over( partition by deptno
--             order by sal desc)r from emp)
--             where r<=5
--             order by deptno,sal desc;
--sql> select *from(select empno,ename,sal,deptno,rank() over( partition by deptno
--             order by sal desc)rank from emp)
--             where rank between 3 and 8
--             order by deptno,sal desc
--sql> sql> select ename,sal,sum(sal) over(order by sal asc range 5000
--             preceding )saltol from emp;
--Sql> select ename,hiredate,sal,lEAD(sal,1,0) over(order by hiredate )presal from emp;
--Sql>create table pet_info( pet varchar2(20),city varchar2(20),pcount number(4));
--Sql>insert into pet_info values('dog','hyd',3500);
--Sql>insert into pet_info values('cat','hyd',300);
--Sql> insert into pet_info values('dog','secunderabad',250);
--Sql>insert into pet_info values('cat','secunderabad',200);
