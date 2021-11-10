/*
-- ***********************
-- Name: PHAM MINH TRIET
-- ID: 157930199
-- Date: 10/19/2021
-- Purpose: DBS311 MIDTERM
-- ***********************
*/
set AUTOCOMMIT on;
 ----Create the EMPLOYEE table

create table employee (EMPNO char(6), FIRSTNAME varchar(12), MIDINIT char(1), LASTNAME varchar(15), WORKDEPT char(3), PHONENO char(4), HIREDATE date, JOB char(8), EDLEVEL smallint, SEX char(1), BIRTHDATE date, SALARY decimal(9,2), BONUS decimal(9,2), COMM decimal(9,2));

 -----Create the STAFF table

create table staff (ID smallint, NAME varchar(9), DEPT smallint, JOB char(5), YEARS smallint, SALARY decimal(7,2), COMM decimal(7,2));
 -----insert the employees into table

--42--
insert into employee values (000010,'CHRISTINE','I','HAAS','A00','3978',TO_DATE('01-01-1995','DD.MM.YYYY'),'PRES',18,'F',TO_DATE('24-08-1963','DD.MM.YYYY'),+0152750.00,+0001000.00,+0004220.00);
--41--
insert into employee values (000020,'MICHAEL','L','THOMPSON','B01','3476',TO_DATE('10-10-2003','DD.MM.YYYY'),'MANAGER',18,'M',TO_DATE('02-02-1978','DD.MM.YYYY'),+0094250.00,+0000800.00,+0003300.00);
--40--
insert into employee values (000030,'SALLY','A','KWAN','C01','4738',TO_DATE('05-04-2005','DD.MM.YYYY'),'MANAGER',20,'F',TO_DATE('11-05-1971','DD.MM.YYYY'),+0098250.00,+0000800.00,+0003060.00);
--39--
insert into employee values (000050,'JOHN','B','GEYER','E01','6789',TO_DATE('17-08-1979','DD.MM.YYYY'),'MANAGER',16,'M',TO_DATE('15-09-1955','DD.MM.YYYY'),+0080175.00,+0000800.00,+0003214.00);
--38--
insert into employee values (000060,'IRVING','F','STERN','D11','6423',TO_DATE('14-09-2003','DD.MM.YYYY'),'MANAGER',16,'M',TO_DATE('07-07-1975','DD.MM.YYYY'),+0072250.00,+0000500.00,+0002580.00);
--37--
insert into employee values (000070,'EVA','D','PULASKI','D21','7831',TO_DATE('30-09-2005','DD.MM.YYYY'),'MANAGER',16,'F',TO_DATE('26-05-2003','DD.MM.YYYY'),+0096170.00,+0000700.00,+0002893.00);
--36--
insert into employee values (000090,'EILEEN','W','HENDERSON','E11','5498',TO_DATE('15-08-2000','DD.MM.YYYY'),'MANAGER',16,'F',TO_DATE('15-05-1971','DD.MM.YYYY'),+0089750.00,+0000600.00,+0002380.00);
--35--
insert into employee values (000100,'THEODORE','Q','SPENSER','E21','0972',TO_DATE('19-06-2000','DD.MM.YYYY'),'MANAGER',14,'M',TO_DATE('18-12-1980','DD.MM.YYYY'),+0086150.00,+0000500.00,+0002092.00);
--34--
insert into employee values (000110,'VINCENZO','G','LUCCHESSI','A00','3490',TO_DATE('16-05-1988','DD.MM.YYYY'),'SALESREP',19,'M',TO_DATE('05-11-1959','DD.MM.YYYY'),+0066500.00,+0000900.00,+0003720.00);
--33--
insert into employee values (000120,'SEAN',' ',q'(O'CONNELL)','A00','2167',TO_DATE('05-12-1993','DD.MM.YYYY'),'CLERK',14,'M',TO_DATE('18-10-1972','DD.MM.YYYY'),+0049250.00,+0000600.00,+0002340.00);
--32--
insert into employee values (000130,'DELORES','M','QUINTANA','C01','4578',TO_DATE('28-07-2001','DD.MM.YYYY'),'ANALYST',16,'F',TO_DATE('15-09-1955','DD.MM.YYYY'),+0073800.00,+0000500.00,+0001904.00);
--31--
insert into employee values (000140,'HEATHER','A','NICHOLLS','C01','1793',TO_DATE('15-12-2006','DD.MM.YYYY'),'ANALYST',18,'F',TO_DATE('19-01-1976','DD.MM.YYYY'),+0068420.00,+0000600.00,+0002274.00);
--30--
insert into employee values (000150,'BRUCE',' ','ADAMSON','D11','4510',TO_DATE('12-02-2002','DD.MM.YYYY'),'DESIGNER',16,'M',TO_DATE('17-05-1977','DD.MM.YYYY'),+0055280.00,+0000500.00,+0002022.00);
--29--
insert into employee values (000160,'ELIZABETH','R','PIANKA','D11','3782',TO_DATE('11-10-2006','DD.MM.YYYY'),'DESIGNER',17,'F',TO_DATE('12-04-1980','DD.MM.YYYY'),+0062250.00,+0000400.00,+0001780.00);
--28--
insert into employee values (000170,'MASATOSHI','J','YOSHIMURA','D11','2890',TO_DATE('15-09-1999','DD.MM.YYYY'),'DESIGNER',16,'M',TO_DATE('05-01-1981','DD.MM.YYYY'),+0044680.00,+0000500.00,+0001974.00);
--27--
insert into employee values (000180,'MARILYN','S','SCOUTTEN','D11','1682',TO_DATE('07-07-2003','DD.MM.YYYY'),'DESIGNER',17,'F',TO_DATE('21-02-1979','DD.MM.YYYY'),+0051340.00,+0000500.00,+0001707.00);
--26--
insert into employee values (000190,'JAMES','H','WALKER','D11','2986',TO_DATE('26-07-2004','DD.MM.YYYY'),'DESIGNER',16,'M',TO_DATE('25-06-1982','DD.MM.YYYY'),+0050450.00,+0000400.00,+0001636.00);
--25--
insert into employee values (000200,'DAVID',' ','BROWN','D11','4501',TO_DATE('03-03-2002','DD.MM.YYYY'),'DESIGNER',16,'M',TO_DATE('29-05-1971','DD.MM.YYYY'),+0057740.00,+0000600.00,+0002217.00);
--24--
insert into employee values (000210,'WILLIAM','T','JONES','D11','0942',TO_DATE('11-04-1998','DD.MM.YYYY'),'DESIGNER',17,'M',TO_DATE('23-02-2003','DD.MM.YYYY'),+0068270.00,+0000400.00,+0001462.00);
--23--
insert into employee values (000220,'JENNIFER','K','LUTZ','D11','0672',TO_DATE('29-08-1998','DD.MM.YYYY'),'DESIGNER',18,'F',TO_DATE('19-03-1978','DD.MM.YYYY'),+0049840.00,+0000600.00,+0002387.00);
--22--
insert into employee values (000230,'JAMES','J','JEFFERSON','D21','2094',TO_DATE('21-11-1996','DD.MM.YYYY'),'CLERK',14,'M',TO_DATE('30-05-1980','DD.MM.YYYY'),+0042180.00,+0000400.00,+0001774.00);
--21--
insert into employee values (000240,'SALVATORE','M','MARINO','D21','3780',TO_DATE('05-12-2004','DD.MM.YYYY'),'CLERK',17,'M',TO_DATE('31-03-2002','DD.MM.YYYY'),+0048760.00,+0000600.00,+0002301.0);
--20--
insert into employee values (000250,'DANIEL','S','SMITH','D21','0961',TO_DATE('30-10-1999','DD.MM.YYYY'),'CLERK',15,'M',TO_DATE('12-11-1969','DD.MM.YYYY'),+0049180.00,+0000400.00,+0001534.00);
--19--
insert into employee values (000260,'SYBIL','P','JOHNSON','D21','8953',to_date('11-09-2005','DD.MM.YYYY'),'CLERK',16,'F',to_date('05-10-1976','DD.MM.YYYY'),+0047250.00,+0000300.00,+0001380.00);
--18--
insert into employee values (000270,'MARIA','L','PEREZ','D21','9001',to_date('30-09-2006','DD.MM.YYYY'),'CLERK',15,'F',to_date('26-05-2003','DD.MM.YYYY'),+0037380.00,+0000500.00,+0002190.00);
--17--
insert into employee values (000280,'ETHEL','R','SCHNEIDER','E11','8997',to_date('24-03-1997','DD.MM.YYYY'),'OPERATOR',17,'F',to_date('28-03-1976','DD.MM.YYYY'),+0036250.00,+0000500.00,+0002100.00);
--16--
insert into employee values (000290,'JOHN','R','PARKER','E11','4502',to_date('30-05-2006','DD.MM.YYYY'),'OPERATOR',12,'M',to_date('09-07-1985','DD.MM.YYYY'),+0035340.00,+0000300.00,+0001227.00);
--15--
insert into employee values (000300,'PHILIP','X','SMITH','E11','2095',to_date('19-06-2002','DD.MM.YYYY'),'OPERATOR',14,'M',to_date('27-10-1976','DD.MM.YYYY'),+0037750.00,+0000400.00,+0001420.00);
--14--
insert into employee values (000310,'MAUDE','F','SETRIGHT','E11','3332',TO_DATE('12-09-1994','DD.MM.YYYY'),'OPERATOR',12,'F',TO_DATE('21-04-1961','DD.MM.YYYY'),+0035900.00,+0000300.00,+0001272.00);
--13--
insert into employee values (000320,'RAMLAL','V','MEHTA','E21','9990',to_date('07-07-1995','DD.MM.YYYY'),'FIELDREP',16,'M',to_date('11-08-1962','DD.MM.YYYY'),+0039950.00,+0000400.00,+0001596.00);
--12--
insert into employee values (000330,'WING',' ','LEE','E21','2103',TO_DATE('23-02-2006','DD.MM.YYYY'),'FIELDREP',14,'M',to_date('18-07-1971','DD.MM.YYYY'),+0045370.00,+0000500.00,+0002030.00);
--11--
insert into employee values (000340,'JASON','R','GOUNOT','E21','5698',to_date('05-05-1977','DD.MM.YYYY'),'FIELDREP',16,'M',to_date('17-05-1956','DD.MM.YYYY'),+0043840.00,+0000500.00,+0001907.00);
--10
insert into employee values (200010,'DIAN','J','HEMMINGER','A00','3978',to_date('01-01-1995','DD.MM.YYYY'),'SALESREP',18,'F',to_date('14-08-1973','DD.MM.YYYY'),+0046500.00,+0001000.00,+0004220.00);
--9--
insert into employee values (200120,'GREG',' ','ORLANDO','A00','2167',to_date('05-05-2002','DD.MM.YYYY'),'CLERK',14,'M',TO_DATE('18-10-1972','DD.MM.YYYY'),+0039250.00,+0000600.00,+0002340.00);
--8--
insert into employee values (200140,'KIM','N','NATZ','C01','1793',to_date('15-12-2006','DD.MM.YYYY'),'ANALYST',18,'F',to_date('19-01-1976','DD.MM.YYYY'),+0068420.00,+0000600.00,+0002274.00);
--7--
insert into employee values (200170,'KIYOSHI',' ','YAMAMOTO','D11','2890',TO_date('15-09-2005','DD.MM.YYYY'),'DESIGNER',16,'M',TO_DATE('05-01-1981','DD.MM.YYYY'),+0064680.00,+0000500.00,+0001974.00);
--6--
insert into employee values (200220,'REBA','K','JOHN','D11','0672',TO_DATE('29-08-2005','DD.MM.YYYY'),'DESIGNER',18,'F',TO_DATE('19-03-1978','DD.MM.YYYY'),+0069840.00,+0000600.00,+0002387.00);
--5--
insert into employee values (200240,'ROBERT','M','MONTEVERDE','D21','3780',TO_DATE('05-12-2004','DD.MM.YYYY'),'CLERK',17,'M',TO_DATE('31-03-1984','DD.MM.YYYY'),+0037760.00,+0000600.00,+0002301.00);
--4--
insert into employee values (200280,'EILEEN','R','SCHWARTZ','E11','8997',TO_DATE('24-03-1997','DD.MM.YYYY'),'OPERATOR',17,'F',TO_DATE('28-03-1966','DD.MM.YYYY'),+0046250.00,+0000500.00,+0002100.00);
--3--
insert into employee values (200310,'MICHELLE','F','SPRINGER','E11','3332',TO_DATE('12-09-1994','DD.MM.YYYY'),'OPERATOR',12,'F',TO_DATE('21-04-1961','DD.MM.YYYY'),+0035900.00,+0000300.00,+0001272.00);
--2--
insert into employee values (200330,'HELENA',' ','WONG','E21','2103',TO_DATE('23-02-2006','DD.MM.YYYY'),'FIELDREP',14,'F',TO_DATE('18-07-1971','DD.MM.YYYY'),+0035370.00,+0000500.00,+0002030.00);
--1--
insert into employee values (200340,'ROY','R','ALONZO','E21','5698',TO_DATE('05-07-1997','DD.MM.YYYY'),'FIELDREP',16,'M',TO_DATE('17-05-1956','DD.MM.YYYY'),+0031840.00,+0000500.00,+0001907.00);

 -----insert the staffs into table
insert into staff values (10,'Sanders',20,'Mgr',7,+98357.50,null);
insert into staff values (20,'Pernal',20,'Sales',8,+78171.25,+00612.45);
insert into staff values (30,'Marenghi',38,'Mgr',5,+77506.75,null);
insert into staff values (40,q'(O'Brien)',38,'Sales',6,+78006.00,+00846.55);
insert into staff values (50,'Hanes',15,'Mgr',10,+80659.80,null);
insert into staff values (60,'Quigley',38,'Sales',null,+66808.30,+00650.25);
insert into staff values (70,'Rothman',15,'Sales',7,+76502.83,+01152.00);
insert into staff values (80,'James',20,'Clerk',null,+43504.60,+00128.20);
insert into staff values (90,'Koonitz',42,'Sales',6,+38001.75,+01386.70);
insert into staff values (100,'Plotz',42,'Mgr',7,+78352.80,null);
insert into staff values (110,'Ngan',15,'Clerk',5,+42508.20,+00206.60);
insert into staff values (120,'Naughton',38,'Clerk',null,+42954.75,+00180.00);
insert into staff values (130,'Yamaguchi',42,'Clerk',6,+40505.90,+00075.60);
insert into staff values (140,'Fraye',51,'Mgr',6,+91150.00,null);
insert into staff values (150,'Williams',51,'Sales',6,+79456.50,+00637.65);
insert into staff values (160,'Molinare',10,'Mgr',7,+82959.20,null);
insert into staff values (170,'Kermisch',15,'Clerk',4,+42258.50,+00110.10);
insert into staff values (180,'Abrahams',38,'Clerk',3,+37009.75,+00236.50);
insert into staff values (190,'Sneider',20,'Clerk',8,+34252.75,+00126.50);
insert into staff values (200,'Scoutten',42,'Clerk',null,+41508.60,+00084.20);
insert into staff values (210,'Lu',10,'Mgr',10,+90010.00,null);
insert into staff values (220,'Smith',51,'Sales',7,+87654.50,+00992.80);
insert into staff values (230,'Lundquist',51,'Clerk',3,+83369.80,+00189.65);
insert into staff values (240,'Daniels',10,'Mgr',5,+79260.25,null);
insert into staff values (250,'Wheeler',51,'Clerk',6,+74460.00,+00513.30);
insert into staff values (260,'Jones',10,'Mgr',12,+81234.00,null);
insert into staff values (270,'Lea',66,'Mgr',9,+88555.50,null);
insert into staff values (280,'Wilson',66,'Sales',9,+78674.50,+00811.50);
insert into staff values (290,'Quill',84,'Mgr',10,+89818.00,null);
insert into staff values (300,'Davis',84,'Sales',5,+65454.50,+00806.10);
insert into staff values (310,'Graham',66,'Sales',13,+71000.00,+00200.30);
insert into staff values (320,'Gonzales',66,'Sales',4,+76858.20,+00844.00);
insert into staff values (330,'Burke',66,'Clerk',1,+49988.00,+00055.50);
insert into staff values (340,'Edwards',84,'Sales',7,+67844.00,+01285.00);
insert into staff values (350,'Gafney',84,'Clerk',5,+43030.50,+00188.00);

SELECT * FROM employee order by empno;
SELECT * FROM staff order by id;
--SELECT COUNT(*) FROM staff;
--SELECT COUNT(*) FROM employee;


-- Question 1 – 
--Write a query which shows the common last names of any individuals in both 
--tables. Make sure you ignore case (Smith=SMITH=smith). Make sure duplicates 
--are removed. Alphabetically order the results.
-- Q1 SOLUTION --

select lower(name),count(name) from staff GROUP BY name
Intersect
select lower(lastname),count(lastname) from employee GROUP BY lastname
order by 1 ;





-- Q2 SOLUTION --
select cast(empno as number) as "employee IDs" from employee
minus
select id from staff
order by 1 desc;

-- Q3 SOLUTION --
--change column name
ALTER TABLE
   employee
RENAME COLUMN
PHONENO 
TO
PHONEEXT;
--add phone column
ALTER TABLE employee
ADD PHONE VARCHAR2(50 BYTE) ;
--add phone data
UPDATE employee SET 
PHONE = '416-123-'||(PHONEEXT);
--select all data for employees who have the last name of 'smith'
select * from employee where lower(lastname) = 'smith';


-- Q4 SOLUTION --select * from staff where job = 'Mgr';
select ID, name , dept ,nvl(years,0) , job from staff where ((job != 'Mgr' and (salary + comm) > any (select salary from staff where job = 'Mgr')) or (job != 'Mgr' and nvl(years,0) > any (select nvl(years,0) from staff where job = 'Mgr'))) and dept != 10
order by dept ,name;

-- Q5 SOLUTION --
select name,dept,job from staff where dept = (select dept from staff where name = 'Graham') and name != 'Graham'
order by name;

-- Q6 SOLUTION --
select (initcap(lastname)|| ', '||initcap(firstname)) as "Name" , job ,(salary+bonus+comm) as "Variable Pay" from employee where ((salary+bonus+comm) in (select  max(salary+bonus+comm) from employee group by job )) or ((salary+bonus+comm) in (select min(salary+bonus+comm)from employee group by job))
order by "Variable Pay" desc;

-- Q7 SOLUTION --
select name from staff where (lower(name) like '%il%') or (lower(name) like '%s') order by name; 

-- Q8 SOLUTION --
select name , job, salary,comm from staff where((salary < any (select salary from staff where job = 'Mgr'))or (salary + comm) < any ( select salary + comm from staff where job = 'Sales')) and job != 'Sales' ;

-- Q9 SOLUTION--

select job, avg(salary+comm+bonus) as "compensation" from employee where (edlevel >= 16) and (lower(job) != 'clerk')   group by job order by "compensation" ;


-- Q10 SOLUTION --
--number of years employed is rounded up to the closest whole number
select firstname, lastname , hiredate, birthdate,edlevel,round((sysdate - hiredate)/360)as " YEARS OF SERVICE" from employee where lower(lastname) in 
(select lower(name) from staff 
Intersect
select lower(lastname) from employee);

