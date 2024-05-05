CREATE TABLE Student ( student_name VARCHAR(255) NOT NULL,
student_id INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(255) NOT NULL,
phone VARCHAR(20)
);
use J;
CREATE TABLE Department ( department_id INT PRIMARY KEY AUTO_INCREMENT, department_name VARCHAR(255) NOT NULL );
CREATE TABLE Course (
course_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
credits INT NOT NULL,
department_id INT NOT NULL,
FOREIGN KEY (department_id) REFERENCES Department (department_id),
description TEXT
);
CREATE TABLE Instructor (
instructor_id INT PRIMARY KEY AUTO_INCREMENT,
instructor_name VARCHAR(255) NOT NULL,
department_id INT NOT NULL,
FOREIGN KEY (department_id) REFERENCES Department (department_id)
);
CREATE TABLE Grade ( student_id INT NOT NULL,
course_id INT NOT NULL,
grade TEXT NOT NULL,
grade_id INT,
PRIMARY KEY (student_id, course_id),
FOREIGN KEY (student_id) REFERENCES Student (student_id),
FOREIGN KEY (course_id) REFERENCES Course (cCourseourse_id)
);

CREATE TABLE Enrollment (
  enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
INSERT INTO Student (student_id, student_name, email,phone)
VALUES (1, 'John Doe', 'john.doe@example.com', '(555) 555-1234'),
       (2, 'Jane Smith', 'jane.smith@example.com', '(555) 555-5678'),
       (3, 'Michael Brown', 'michael.brown@example.com', '(555)       555-9012'),
       (4, 'Amanda Johnson', 'amanda.johnson@example.com', '(555) 555-3456'),
       (5, 'David Miller', 'david.miller@example.com', '(555) 555-7890');

INSERT INTO Department (department_id, department_name)
VALUES (1, 'Computer Science'),
       (2, 'Mathematics'),
       (3, 'English Literature'),
       (4, 'Biology'),
       (5, 'History');       
       
INSERT INTO Course (course_id, Title, credits, department_id)
VALUES (1, 'Introduction to Computer Science', 3, 1),
       (2, 'Calculus I', 4, 2),
       (3, 'Introduction to Literature', 3, 3),
       (4, 'Biology I', 4, 4),
       (5, 'History of Western Civilization', 3, 5);   
       
INSERT INTO Instructor (instructor_name, department_id, instructor_id)
VALUES ('Professor Jones', 1, '123'),
       ('Dr. Miller', 2, '456'),
       ('Ms. Garcia', 3, '789'),
       ('Dr. Chen', 4, '012'),
       ('Professor Williams', 5, '345');    
INSERT INTO Grade (student_id, course_id, grade, grade_id)
VALUES (1, 1, 'A', 101),
       (2, 2, 'B', 102),
       (3, 3, 'C', 103),
       (4, 4, 'A-', 104),
       (5, 5, 'B+', 105);      
       
       
       select * from Grade;
       
       CREATE VIEW InstructorDetails AS
SELECT i.instructor_name, d.department_name
FROM Instructor i
INNER JOIN Department d ON i.department_id = d.department_id;

CREATE VIEW EnrolledStudents AS
SELECT s.student_name, c.title, c.credits
FROM Student s
INNER JOIN Enrollment e ON s.student_id = e.student_id
INNER JOIN Course c ON e.course_id = c.course_id;

CREATE VIEW StudentGrades AS
SELECT s.student_name, c.title, g.grade 
FROM Student s
INNER JOIN Enrollment e ON s.student_id = e.student_id
INNER JOIN Grade g ON e.student_id = g.student_id AND e.course_id = g.course_id
INNER JOIN Course c ON e.course_id = c.course_id;

CREATE VIEW AverageGradesPerCourse AS
SELECT c.title, AVG(g.grade) AS average_grade
FROM Course c
INNER JOIN Enrollment e ON c.course_id = e.course_id
INNER JOIN Grade g ON e.student_id = g.student_id AND e.course_id = g.course_id
GROUP BY c.course_id;

CREATE VIEW StudentsByGradeInDept AS
SELECT s.student_name, i.department_name, g.grade
FROM Student s
INNER JOIN Enrollment e ON s.student_id = e.student_id
INNER JOIN Grade g ON e.student_id = g.student_id AND e.course_id = 
g.course_id
INNER JOIN Instructor i ON e.course_id = i.course_id
INNER JOIN Department d ON i.department_id = d.department_id
WHERE g.grade = 'A';







       