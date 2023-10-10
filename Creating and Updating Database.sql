CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR (20),
    major VARCHAR (20)
);

DESCRIBE student;

DROP TABLE student;

ALTER TABLE student ADD gpa DECIMAL(3, 2);

ALTER TABLE student DROP COLUMN gpa;

INSERT INTO student VALUES (1, 'Jack', 'Biology');

INSERT INTO student VALUES (2, 'Kate', 'Sociology');

INSERT INTO student VALUES (3, 'Claire', 'Chemistry');

INSERT INTO student VALUES (4, 'Jack', 'Biology');

INSERT INTO student VALUES (5, 'Mike', 'Computer Science');


CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR (20) NOT NULL,
    major VARCHAR (20) UNIQUE
);

INSERT INTO student VALUES (1, 'Jack', 'Biology');

INSERT INTO student VALUES (2, 'Kate', 'Sociology');

INSERT INTO student VALUES (3, NULL, 'Chemistry');

INSERT INTO student VALUES (4, 'Jack', 'Biology');

INSERT INTO student VALUES (5, 'Mike', 'Computer Science');


CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR (20),
    major VARCHAR (20) DEFAULT('undecided')
);

INSERT INTO student(student_id, name) VALUES (1, 'Jack');

INSERT INTO student VALUES (2, 'Kate', 'Sociology');

INSERT INTO student VALUES (3, NULL, 'Chemistry');

INSERT INTO student VALUES (4, 'Jack', 'Biology');

INSERT INTO student VALUES (5, 'Mike', 'Computer Science');


CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (20),
    major VARCHAR (20)
);

INSERT INTO student(name, major) VALUES ('Jack', 'Biology');

INSERT INTO student(name, major) VALUES ('Kate', 'Sociology');

INSERT INTO student(name, major) VALUES (NULL, 'Chemistry');

INSERT INTO student(name, major) VALUES ('Jack', 'Biology');

INSERT INTO student(name, major) VALUES ('Mike', 'Computer Science');

SELECT * FROM student;

------

UPDATE student
SET major = 'Bio'
WHERE major = 'Biology';

UPDATE student
SET major = 'Comp Sci'
WHERE major = 'Computer Science';

UPDATE student
SET major = 'Comp Sci'
WHERE student_id = 4;

UPDATE student
SET major = 'Biochemistry'
WHERE major = 'Bio' OR major = 'chemistry';

UPDATE student
SET name = 'Tom', major = 'undecided'
WHERE student_id = 1;

UPDATE student
SET major = 'undecided';

DELETE FROM student
WHERE student_id = 5;

DELETE FROM student
WHERE name = 'Tom' AND major = 'undecided'; 

------