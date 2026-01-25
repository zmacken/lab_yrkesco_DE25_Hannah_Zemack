-- =========================
-- CITY
-- =========================
INSERT INTO city (city_id, city_name) VALUES
(1, 'Gothenburg'),
(2, 'Stockholm');

-- =========================
-- STUDENTS
-- =========================
INSERT INTO student (student_id) VALUES
(1), (2), (3), (4), (5);

INSERT INTO restricted_personal_details_student
(student_id, first_name, last_name, personal_number, email) VALUES
(1, 'Anna', 'Svensson', 9901011234, 'anna.svensson@student.se'),
(2, 'Erik', 'Johansson', 9803052345, 'erik.johansson@student.se'),
(3, 'Maria', 'Lindberg', 9707123456, 'maria.lindberg@student.se'),
(4, 'Johan', 'Karlsson', 9909094567, 'johan.karlsson@student.se'),
(5, 'Sara', 'Nilsson', 9811225678, 'sara.nilsson@student.se');

-- =========================
-- EDUCATIONAL LEADERS
-- =========================
INSERT INTO educational_leader
(leader_id, first_name, last_name, email) VALUES
(1, 'Karin', 'Andersson', 'karin.andersson@sti.se'),
(2, 'Lars', 'Pettersson', 'lars.pettersson@sti.se');

INSERT INTO restricted_educatioal_leader
(leader_id, personal_number, salary_per_month) VALUES
(1, 6501011111, 52000),
(2, 7002022222, 54000);

-- =========================
-- SCHOOL CLASSES (PROGRAMKLASSER)
-- =========================
INSERT INTO school_class
(class_id, leader_id, class_year, class_name) VALUES
(1, 1, '2023-01-01', 'STI-DE23'),
(2, 2, '2024-01-01', 'STI-PR24');

-- Endast programstudenter här
INSERT INTO student_class (student_id, class_id) VALUES
(1, 1),
(2, 1),
(3, 2);

-- =========================
-- EDUCATORS
-- =========================
INSERT INTO consultant
(consultant_id, company_name, company_number, fskatt_true_false, adress, cost_per_hour, email) VALUES
(1, 'TechEdu Konsult AB', '556677-8899', true, 'Sveavägen 10', 950, 'kontakt@techedu.se');

INSERT INTO restricted_employed_educator
(employed_educator_id, personal_number, salary_per_month, email, adress) VALUES
(1, 7503033333, 45000, 'eva.larsson@sti.se', 'Odengatan 5');

INSERT INTO educator
(educator_id, first_name, last_name, consultant_id, employed_educator_id) VALUES
(1, 'Eva', 'Larsson', NULL, 1),
(2, 'Olof', 'Berg', 1, NULL);

-- =========================
-- INDEPENDENT COURSES
-- =========================
INSERT INTO independent_course
(independent_course_id, city_id, course_code, course_name, points, course_desc) VALUES
(1, 2, 'IND-STI-DB', 'Databaser med SQL', 50, 'Grundläggande databasteknik'),
(2, 2, 'IND-STI-PY', 'Python för dataanalys', 50, 'Python och dataanalys');

INSERT INTO independent_course_instance
(independent_course_instance_id, independent_course_id, educator_id, independent_course_start_date) VALUES
(1, 1, 1, '2024-01-15'),
(2, 2, 2, '2024-02-01');

-- Endast fristående studenter + en programstudent som läser extra
INSERT INTO student_independent_course
(student_id, independent_course_instance_id) VALUES
(4, 1),
(5, 1),
(5, 2),
(2, 2);

INSERT INTO grades_independent
(student_id, independent_course_id, grade) VALUES
(4, 1, 'G'),
(5, 1, 'VG'),
(5, 2, 'G'),
(2, 2, 'VG');

-- =========================
-- PROGRAMS (STI-INSPIRERADE)
-- =========================
INSERT INTO program
(program_id, program_name, points) VALUES
(1, 'Data Engineer – Stockholm Technical Institute', 400),
(2, 'Software Developer – Stockholm Technical Institute', 400);

INSERT INTO approved_program_year
(approval_id, approval_year, number_approved_years) VALUES
(1, 2023, 2),
(2, 2024, 2);

INSERT INTO class_program_instance
(class_program_instance_id, class_id, approval_id, program_id, start_date) VALUES
(1, 1, 1, 1, '2023-08-20'),
(2, 2, 2, 2, '2024-08-20');

-- =========================
-- PROGRAM COURSES (STI)
-- =========================
INSERT INTO program_course
(course_id, program_id, city_id, course_code, points, course_name, course_desc) VALUES
(1, 1, 2, 'STI-DE-DB', 100, 'Databasteknik', 'Avancerad SQL och datamodellering'),
(2, 1, 2, 'STI-DE-PY', 100, 'Python för Data Engineers', 'Python, ETL och dataflöden'),
(3, 2, 2, 'STI-SD-JS', 100, 'JavaScript & Webbutveckling', 'Frontend och backend'),
(4, 2, 2, 'STI-SD-JAVA', 100, 'Java och OOP', 'Objektorienterad programmering');

INSERT INTO program_course_instance
(course_instance_id, class_program_instance_id, course_id, educator_id, course_start_date) VALUES
(1, 1, 1, 1, '2023-09-01'),
(2, 1, 2, 2, '2023-11-01'),
(3, 2, 3, 1, '2024-09-01'),
(4, 2, 4, 2, '2024-11-01');

INSERT INTO grades_program_course
(student_id, course_id, grade) VALUES
(1, 1, 'VG'),
(1, 2, 'G'),
(2, 1, 'G'),
(2, 2, 'VG'),
(3, 3, 'G'),
(3, 4, 'VG');

