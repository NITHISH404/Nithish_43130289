CREATE TABLE College (
    college_id INT PRIMARY KEY,
    college_name VARCHAR(50)
);

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    college_id INT,
    FOREIGN KEY (college_id) REFERENCES College(college_id)
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO College (college_id, college_name)
VALUES (1, 'Sathyabama'),
	   (2, 'SRM');

INSERT INTO Department (dept_id, dept_name, college_id)
VALUES (101, 'Computer Science Engineering', 1),
       (102, 'Mechanical Engineering', 1),
       (201, 'Electrical and Electronical Engineering', 2);

INSERT INTO Student (student_id, student_name, dept_id)
VALUES (1001, 'Ajith', 101),
       (1002, 'Vijay', 102),
       (1003, 'Suriya', 201);

SELECT * FROM College;
SELECT * FROM Department;
SELECT * FROM Student;

SELECT 
    s.student_id,
    s.student_name,
    d.dept_name,
    c.college_name
FROM Student s
JOIN Department d ON s.dept_id = d.dept_id
JOIN College c ON d.college_id = c.college_id;