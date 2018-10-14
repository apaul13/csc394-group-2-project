CREATE TABLE STUDENT(
    FNAME            VARCHAR2(20),
    LNAME            VARCHAR2(20),
    Status           VARCHAR2(20),
    City             VARCHAR2(20),
    STATE            CHAR(2),
    Degree           VARCHAR2(20),
    EMAIL            VARCHAR2(50)
                     PRIMARY KEY,
    Experience       VARCHAR2(1000),
    studentSkills    VARCHAR(100)
);

CREATE TABLE JOBS (
    CompanyName     VARCHAR2(50),
    JobTitle        VARCHAR2(50),
    City            VARCHAR2(50),
    State           CHAR(2),
    Field           VARCHAR2(50),
    jobs_Skills     VARCHAR2(100),
    job_experience  VARCHAR2(1000)
);

CREATE TABLE SKILLS (
    Skills           VARCHAR2(100)
);

INSERT INTO STUDENT
    VALUES ( 'Jeff', 'Wirtz', 'Senior', 'Oak Park', 'IL', 'BS-Computer Science', 'wirtz101@yahoo.com', 'java', 'Team experience');
    
INSERT INTO STUDENT
    VALUES ('Michael', 'Donata', 'Senior', 'Chicago', 'IL', 'BS-Computer Science', 'mdonata@depaul.edu', 'java, C++, Python, Compiler', 'Manager experience');

INSERT INTO STUDENT
    VALUES('Homer', 'Simpson', 'Freshman', 'Springfield', 'MA', 'BS-Nuclear Physicist', 'hsimpson@depaul.edu', 'donut cooking', 'donut experience');
    
INSERT INTO JOBS
    VALUES ('IBA', 'Programmer', 'Oak Park', 'IL', 'BS-Computer Science', 'Java', 'Team experience');
    
INSERT INTO JOBS
    VALUES ('Google', 'Programmer', 'Chicago', 'IL', 'BS-Computer Science', 'C++', 'Manager experience');
    
INSERT INTO JOBS
    VALUES ('Google', 'Project Manager', 'Chicago', 'IL', 'MS-Computer Science', 'C++, Java, SQL, Python, Compiler', 'Manager experience');
    
INSERT INTO JOBS
    VALUES ('Security Parnters Inc.', 'Security Guard', 'Itasca', 'IL', 'None', 'likes donuts', 'Manager experience');

INSERT INTO JOBS
    VALUES ('SpringField Nuclear Power Plant', 'Nuclear Technician', 'Springfield', 'MA', 'BS-Nuclear Physicist', 'likes donuts', 'donut experience');    

INSERT INTO SKILLS
    VALUES( 'Manager Experience');
    
INSERT INTO SKILLS
    VALUES( 'Team Experience');
    
INSERT INTO SKILLS
    VALUES( 'Java');
    
INSERT INTO SKILLS
    VALUES( 'Python');
    
INSERT INTO SKILLS
    VALUES( 'C++');

INSERT INTO SKILLS
    VALUES('Cooking');
    
    
SELECT * FROM STUDENT;
SELECT * FROM SKILLS;
SELECT * FROM JOBS;

--By Location    
SELECT DISTINCT LNAME, JobTitle, CompanyName FROM STUDENT INNER JOIN JOBS on Student.State = Jobs.State
    WHERE STUDENT.STATE = JOBS.STATE
    order by LNAME;

--By Degree    
SELECT DISTINCT LNAME, JobTitle, CompanyName FROM STUDENT INNER JOIN JOBS on Student.State = Jobs.State
    WHERE JOBS.Field LIKE STUDENT.Degree 
    order by LNAME;
    
SELECT Field
    FROM JOBS;
SELECT DEGREE
    FROM STUDENT;
    
DROP TABLE JOBS;
DROP TABLE STUDENT;
DROP TABLE SKILLS;