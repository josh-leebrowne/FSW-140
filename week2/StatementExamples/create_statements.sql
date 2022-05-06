USE hr;

CREATE TABLE countriesTwo (
	COUNTRY_ID varchar(2),
    COUNTRY_NAME varchar(40),
    REGION_ID decimal(10, 0)
);

CREATE TABLE IF NOT EXISTS dup_countries LIKE countries;

CREATE TABLE IF NOT EXISTS dup_countries AS SELECT * FROM countries;

CREATE TABLE IF NOT EXISTS countries (
     COUNTRY_ID varchar(2),
     COUNTRY_NAME varchar(40)
     CHECK(COUNTRY_NAME IN('Italy','India','China')) ,
     REGION_ID decimal(10,0)
);

CREATE TABLE IF NOT EXISTS countries (
     COUNTRY_ID varchar(2) NOT NULL,
     COUNTRY_NAME varchar(40) NOT NULL,
     REGION_ID decimal(10,0) NOT NULL,
     UNIQUE(COUNTRY_ID)
);

CREATE TABLE IF NOT EXISTS countries (
     COUNTRY_ID varchar(2) NOT NULL UNIQUE PRIMARY KEY,
     COUNTRY_NAME varchar(40) NOT NULL,
     REGION_ID decimal(10,0) NOT NULL
);

CREATE TABLE IF NOT EXISTS countries (
     COUNTRY_ID integer NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
     COUNTRY_NAME varchar(40) NOT NULL,
     REGION_ID decimal(10,0) NOT NULL
);

DESC countries;

CREATE TABLE IF NOT EXISTS countries (
     COUNTRY_ID varchar(2) NOT NULL UNIQUE DEFAULT '',
     COUNTRY_NAME varchar(40) DEFAULT NULL,
     REGION_ID decimal(10,0) NOT NULL,
PRIMARY KEY (COUNTRY_ID,REGION_ID));

CREATE TABLE IF NOT EXISTS jobs (
     JOB_ID varchar(10) NOT NULL UNIQUE,
     JOB_TITLE varchar(35) NOT NULL DEFAULT ' ',
     MIN_SALARY decimal(6,0) DEFAULT 8000,
     MAX_SALARY decimal(6,0) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS jobs (
     JOB_ID varchar(10) NOT NULL ,
     JOB_TITLE varchar(35) NOT NULL,
     MIN_SALARY decimal(6,0),
     MAX_SALARY decimal(6,0)
     CHECK(MAX_SALARY<=25000)
);

CREATE TABLE job_history (
     EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY,
     START_DATE date NOT NULL,
     END_DATE date NOT NULL
     CHECK (END_DATE LIKE '--/--/----'),
     JOB_ID varchar(10) NOT NULL,
     DEPARTMENT_ID decimal(4,0) DEFAULT NULL,
     FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

CREATE TABLE IF NOT EXISTS job_history (
     EMPLOYEE_ID decimal(6,0) NOT NULL,
     START_DATE date NOT NULL,
     END_DATE date NOT NULL
     CHECK (END_DATE LIKE '--/--/----'),
     JOB_ID varchar(10) NOT NULL,
     DEPARTMENT_ID decimal(4,0) NOT NULL
);

CREATE TABLE IF NOT EXISTS employees (
     EMPLOYEE_ID decimal(6,0) NOT NULL PRIMARY KEY,
     FIRST_NAME varchar(20) DEFAULT NULL,
     LAST_NAME varchar(25) NOT NULL,
     EMAIL varchar(25) NOT NULL,
     PHONE_NUMBER varchar(20) DEFAULT NULL,
     HIRE_DATE date NOT NULL,
     JOB_ID varchar(10) NOT NULL,
     SALARY decimal(8,2) DEFAULT NULL,
     COMMISSION_PCT decimal(2,2) DEFAULT NULL,
     MANAGER_ID decimal(6,0) DEFAULT NULL,
     DEPARTMENT_ID decimal(4,0) DEFAULT NULL,
     FOREIGN KEY(DEPARTMENT_ID, MANAGER_ID)
     REFERENCES departments(DEPARTMENT_ID,MANAGER_ID)
);