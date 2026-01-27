-- =========================
-- CITY
-- =========================
INSERT INTO city (city_id, city_name) VALUES
(1, 'Stockholm'),
(2, 'Göteborg');

-- =========================
-- STUDENTS
-- =========================
INSERT INTO student (student_id) VALUES
(101), (102), (103), (104), (105);

INSERT INTO restricted_personal_details_student
(student_id, first_name, last_name, personal_number, email) VALUES
(101, 'Alice', 'Sundström', 20010101, 'alice.sundstrom@student.sti.se'),
(102, 'Benjamin', 'Holm', 20020304, 'benjamin.holm@student.sti.se'),
(103, 'Clara', 'Nyberg', 20011211, 'clara.nyberg@student.sti.se'),
(104, 'Daniel', 'Ek', 20030505, 'daniel.ek@student.sti.se'),
(105, 'Ella', 'Bergström', 20020707, 'ella.bergstrom@student.sti.se');

-- =========================
-- EDUCATIONAL LEADERS
-- =========================
INSERT INTO educational_leader (leader_id, first_name, last_name, email) VALUES
(1, 'Karin', 'Persson', 'karin.persson@sti.se'),
(2, 'Olof', 'Björk', 'olof.bjork@sti.se');

INSERT INTO restricted_educatioal_leader
(leader_id, personal_number, salary_per_month) VALUES
(1, 19650101, 52000),
(2, 19780202, 54000);

-- =========================
-- SCHOOL CLASSES
-- =========================
INSERT INTO school_class (class_id, leader_id, class_name) VALUES
(10, 1, 'STI-DE24'),
(11, 2, 'STI-FE23');

INSERT INTO student_class (student_id, class_id) VALUES
(101, 10),
(102, 10),
(103, 11),
(104, 11),
(105, 10);

-- =========================
-- EDUCATORS
-- =========================
INSERT INTO consultant
(consultant_id, company_name, company_number, fskatt_true_false, adress, cost_per_hour, email) VALUES
(201, 'TechConsult AB', '556677-8899', TRUE, 'Sveavägen 12, Stockholm', 650, 'info@techconsult.se');

INSERT INTO restricted_employed_educator
(employed_educator_id, personal_number, salary_per_month, email, adress) VALUES
(301, 19850101, 38000, 'lisa.holm@sti.se', 'Fleminggatan 5, Stockholm'),
(302, 19890202, 39500, 'henrik.larsson@sti.se', 'Kungsgatan 8, Stockholm');

INSERT INTO educator (educator_id, first_name, last_name, consultant_id, employed_educator_id) VALUES
(401, 'Lisa', 'Holm', NULL, 301),
(402, 'Henrik', 'Larsson', NULL, 302),
(403, 'Peter', 'Sandberg', 201, NULL);

-- =========================
-- PROGRAMS
-- =========================
INSERT INTO program (program_id, program_name, points) VALUES
(1, 'Data Engineer', 400),
(2, 'Frontend Developer', 400);

-- =========================
-- CLASS PROGRAM INSTANCE
-- =========================
INSERT INTO class_program_instance (class_program_instance_id, class_id, start_date) VALUES
(1001, 10, '2024-08-20'),
(1002, 11, '2023-08-20');

-- =========================
-- APPROVED PROGRAM YEARS
-- =========================
INSERT INTO approved_program_year
(approval_id, class_program_instance_id, approval_year, number_approved_years) VALUES
(1, 1001, 2024, 1),
(2, 1002, 2023, 1);

-- =========================
-- PROGRAM COURSES
-- =========================
INSERT INTO program_course
(course_id, program_id, city_id, course_code, points, course_name, course_desc) VALUES
(501, 1, 1, 'DE-SQL', 20, 'Databasteknik', 'SQL, ER-modellering och databasdesign'),
(502, 1, 1, 'DE-PY', 20, 'Python för Data Engineers', 'Python, ETL och dataflöden'),
(503, 2, 1, 'FE-JS', 20, 'JavaScript Grundkurs', 'Frontend‑utveckling med JS'),
(504, 2, 1, 'FE-HTMLCSS', 20, 'HTML & CSS', 'Webbdesign och responsiv layout');

-- =========================
-- PROGRAM COURSE INSTANCES
-- =========================
INSERT INTO program_course_instance
(course_instance_id, class_program_instance_id, course_id, educator_id, course_start_date) VALUES
(7001, 1001, 501, 401, '2024-09-01'),
(7002, 1001, 502, 402, '2024-10-01'),
(7003, 1002, 503, 403, '2023-09-01'),
(7004, 1002, 504, 401, '2023-10-01');

-- =========================
-- PROGRAM COURSE GRADES
-- =========================
INSERT INTO grades_program_course (student_id, course_id, grade) VALUES
(101, 501, 'VG'),
(102, 501, 'G'),
(105, 501, 'IG'),
(103, 503, 'G'),
(104, 503, 'VG');

-- =========================
-- INDEPENDENT COURSES
-- =========================
INSERT INTO independent_course
(independent_course_id, city_id, course_code, course_name, points, course_desc) VALUES
(801, 1, 'IC-EXCEL', 'Excel för Analys', 10, 'Excel för dataanalys och rapportering'),
(802, 1, 'IC-PBI', 'Power BI Intro', 10, 'Dashboard‑design och datavisualisering'),
(803, 2, 'IC-ITIL', 'ITIL Foundation', 10, 'IT‑service management‑grunder');

-- =========================
-- INDEPENDENT COURSE INSTANCES
-- =========================
INSERT INTO independent_course_instance
(independent_course_instance_id, independent_course_id, educator_id, independent_course_start_date) VALUES
(9001, 801, 401, '2024-09-15'),
(9002, 802, 402, '2024-10-10'),
(9003, 803, 403, '2024-11-01');

-- =========================
-- STUDENT → INDEPENDENT COURSE
-- =========================
INSERT INTO student_independent_course
(independent_course_instance_id, student_id) VALUES
(9001, 101),
(9001, 102),
(9002, 103),
(9003, 104),
(9002, 105);

-- =========================
-- INDEPENDENT COURSE GRADES
-- =========================
INSERT INTO grades_independent (student_id, independent_course_id, grade) VALUES
(101, 801, 'VG'),
(102, 801, 'G'),
(103, 802, 'VG'),
(104, 803, 'G'),
(105, 802, 'IG');
