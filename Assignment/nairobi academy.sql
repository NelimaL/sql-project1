create schema nairobi_academy;

SET search_path TO nairobi_academy;

--TABLES

create table students(
students_id INT primary key,
first_name VARCHAR(50)not null,
last_name VARCHAR(50)not null,
gender VARCHAR(1),
date_of_birth DATE,
class VARCHAR(10),
city VARCHAR(50));

create table subjects(
subject_id INT primary key,
subject_name VARCHAR(100)not null unique,
department VARCHAR(50),
teacher_name VARCHAR(100),
credits INT);

create table exam_results(
exam_result_id INT primary key,
student_id INT not null,
subject_id INT not null,
marks INT not null,
exam_date DATE,
grade VARCHAR(2));

--ALTER TABLE

SET search_path TO nairobi_academy;

alter table students
add column phone_numbers VARCHAR(20);

select*from students;

alter table subjects
rename column credits to credit_hours; 

select*from subjects;

alter table students
drop column phone_numbers;

SET search_path TO nairobi_academy;

insert into students(students_id,first_name,last_name,gender,date_of_birth,class,city)
values
(1,'Amina', 'Wanjiku', 'F', '2008-03-12', 'Form 3', 'Nairobi'),
(2, 'Brian', 'Ochieng', 'M', '2007-07-25', 'Form 4', 'Mombasa'),
(3, 'Cynthia', 'Mutua', 'F', '2008-11-05', 'Form 3', 'Kisumu'),
(4, 'David', 'Kamau', 'M', '2007-02-18', 'Form 4', 'Nairobi'),
(5, 'Esther', 'Akinyi', 'F', '2009-06-30', 'Form 2', 'Nakuru'),
(6, 'Felix', 'Otieno', 'M', '2009-09-14', 'Form 2', 'Eldoret'),
(7, 'Grace', 'Mwangi', 'F', '2008-01-22', 'Form 3', 'Nairobi'),
(8, 'Hassan', 'Abdi', 'M', '2007-04-09', 'Form 4', 'Mombasa'),
(9, 'Ivy', 'Chebet', 'F', '2009-12-01', 'Form 2', 'Nakuru'),
(10, 'James', 'Kariuki', 'M', '2008-08-17', 'Form 3', 'Nairobi');

select*from exam_results;

INSERT INTO subjects (subject_id, subject_name, department, teacher_name, credit_hours) 
VALUES
(1, 'Mathematics', 'Sciences', 'Mr. Njoroge', 4),
(2, 'English', 'Languages', 'Ms. Adhiambo', 3),
(3, 'Biology', 'Sciences', 'Ms. Otieno', 4),
(4, 'History', 'Humanities', 'Mr. Waweru', 3),
(5, 'Kiswahili', 'Languages', 'Ms. Nduta', 3),
(6, 'Physics', 'Sciences', 'Mr. Kamande', 4),
(7, 'Geography', 'Humanities', 'Ms. Chebet', 3),
(8, 'Chemistry', 'Sciences', 'Ms. Muthoni', 4),
(9, 'Computer Studies', 'Sciences', 'Mr. Oduya', 3),
(10, 'Business Studies', 'Humanities', 'Ms. Wangari', 3);

INSERT INTO exam_results (exam_result_id, student_id, subject_id, marks, exam_date, grade) 
VALUES
(1, 1, 1, 78, '2024-03-15', 'B'),
(2, 1, 2, 85, '2024-03-16', 'A'),
(3, 2, 1, 92, '2024-03-15', 'A'),
(4, 2, 3, 55, '2024-03-17', 'C'),
(5, 3, 2, 49, '2024-03-16', 'D'),
(6, 3, 4, 71, '2024-03-18', 'B'),
(7, 4, 1, 88, '2024-03-15', 'A'),
(8, 4, 6, 63, '2024-03-19', 'C'),
(9, 5, 5, 39, '2024-03-20', 'F'),
(10, 6, 9, 95, '2024-03-21', 'A');

select*from exam_results;

select*from students;

select*from subjects;

update students
set town = 'Nairobi'
where students_id = 5;

SET search_path TO nairobi_academy;

SELECT * FROM exam_results
WHERE marks BETWEEN 50 AND 80;

SELECT * FROM exam_results
WHERE exam_date BETWEEN '2024-03-15' AND '2024-03-18';

SELECT * FROM students
WHERE city IN ('Nairobi', 'Mombasa', 'Kisumu');

SELECT * FROM students
WHERE class NOT IN ('Form 2', 'Form 3');

SELECT * FROM students
WHERE first_name LIKE 'A%' OR first_name LIKE 'E%';

SELECT * FROM subjects
WHERE subject_name LIKE '%Studies%';

SELECT COUNT(*) AS total_form3_students
FROM students
WHERE class = 'Form 3';

SELECT COUNT(*) AS total_70_scores
FROM exam_results
WHERE marks >= 70;


 select 
 	student_id, 
 	subject_id, 
 	marks,
 	case 
 		WHEN marks >= 80 THEN 'Distinction'
        WHEN marks >= 60 THEN 'Merit'
        WHEN marks >= 40 THEN 'Pass'
        ELSE 'Fail'
 	end as performance 
 from exam_results;
 
 SELECT 
    first_name,
    last_name,
    class,
    CASE 
        WHEN class IN ('Form 3', 'Form 4') THEN 'Senior'
        WHEN class IN ('Form 1', 'Form 2') THEN 'Junior'
    END AS student_level
FROM students;




