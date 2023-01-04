-- POSTGRESQL

CREATE TABLE instructor
(
    id        varchar(255)   NOT NULL,
    name      varchar(255)   NOT NULL,
    dept_name varchar(255)   NOT NULL,
    salary    numeric(12, 2) NOT NULL
);

CREATE TABLE course
(
    course_id varchar(255)  NOT NULL,
    title     varchar(255)  NOT NULL,
    dept_name varchar(255)  NOT NULL,
    credits   numeric(3, 0) NOT NULL
);

-- insert some data to tables

INSERT INTO instructor (id, name, dept_name, salary)
VALUES ('1', 'Srinivasan', 'Comp. Sci.', 65000);

INSERT INTO instructor (id, name, dept_name, salary)
VALUES ('2', 'Wu', 'Finance', 90000);

INSERT INTO instructor (id, name, dept_name, salary)
VALUES ('3', 'Mozart', 'Music', 40000);

INSERT INTO instructor (id, name, dept_name, salary)
VALUES ('4', 'Einstein', 'Physics', 95000);

INSERT INTO instructor (id, name, dept_name, salary)
VALUES ('5', 'El Said', 'History', 60000);

INSERT INTO instructor (id, name, dept_name, salary)
VALUES ('6', 'Gold', 'Physics', 87000);

INSERT INTO instructor (id, name, dept_name, salary)
VALUES ('7', 'Katz', 'Comp. Sci.', 75000);

INSERT INTO course (course_id, title, dept_name, credits)
VALUES ('CS-101', 'CS-101', 'Comp. Sci.', 4);

INSERT INTO course (course_id, title, dept_name, credits)
VALUES ('CS-290', 'CS-290', 'Comp. Sci.', 4);


-- sum of salaries of all instructors in a department

SELECT dept_name, SUM(salary) AS total_salary
FROM instructor
GROUP BY dept_name;

-- instructors of Physics department who earn between $45,000 and $100,000, sorted by salary

SELECT name, salary
FROM instructor
WHERE dept_name = 'Physics'
  AND salary BETWEEN 45000 AND 100000
ORDER BY salary;

-- departments that sum of the salaries of their instructors is greater than $120,000

SELECT dept_name, SUM(salary) AS total_salary
FROM instructor
GROUP BY dept_name
HAVING SUM(salary) > 120000;

-- courses that their name starts with 'CS-1'

SELECT title
FROM course
WHERE title LIKE 'CS-1%';

