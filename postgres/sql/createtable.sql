CREATE TABLE "student" (
  "student_id" int PRIMARY KEY NOT NULL
);

CREATE TABLE "restricted_personal_details_student" (
  "student_id" int NOT NULL,
  "first_name" varchar,
  "last_name" varchar,
  "personal_number" varchar,
  "email" varchar
);

CREATE TABLE "independent_course" (
  "independent_course_id" int PRIMARY KEY NOT NULL,
  "city_id" int NOT NULL,
  "course_code" varchar,
  "course_name" varchar,
  "points" int,
  "course_desc" varchar
);

CREATE TABLE "independent_course_instance" (
  "independent_course_instance_id" int PRIMARY KEY NOT NULL,
  "independent_course_id" int NOT NULL,
  "educator_id" int,
  "independent_course_start_date" date
);

CREATE TABLE "student_independent_course" (
  "independent_course_instance_id" int NOT NULL,
  "student_id" int NOT NULL
);

CREATE TABLE "grades_independent" (
  "student_id" int NOT NULL,
  "independent_course_id" int NOT NULL,
  "grade" varchar
);

CREATE TABLE "student_class" (
  "student_id" int NOT NULL,
  "class_id" int NOT NULL
);

CREATE TABLE "school_class" (
  "class_id" int PRIMARY KEY NOT NULL,
  "leader_id" int,
  "class_year" date NOT NULL,
  "class_name" varchar
);

CREATE TABLE "educational_leader" (
  "leader_id" int PRIMARY KEY NOT NULL,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar
);

CREATE TABLE "restricted_educatioal_leader" (
  "leader_id" int NOT NULL,
  "personal_number" varchar,
  "salary_per_month" float
);

CREATE TABLE "grades_program_course" (
  "student_id" int NOT NULL,
  "course_id" int NOT NULL,
  "grade" varchar
);

CREATE TABLE "city" (
  "city_id" int PRIMARY KEY NOT NULL,
  "city_name" varchar
);

CREATE TABLE "educator" (
  "educator_id" int PRIMARY KEY NOT NULL,
  "first_name" varchar,
  "last_name" varchar,
  "consultant_id" int,
  "employed_educator_id" int
);

CREATE TABLE "consultant" (
  "consultant_id" int PRIMARY KEY,
  "company_name" varchar,
  "company_number" varchar,
  "fskatt_true_false" boolean,
  "adress" varchar,
  "cost_per_hour" float,
  "email" varchar
);

CREATE TABLE "restricted_employed_educator" (
  "employed_educator_id" int PRIMARY KEY,
  "personal_number" varchar,
  "salary_per_month" float,
  "email" varchar,
  "adress" varchar
);

CREATE TABLE "class_program_instance" (
  "class_program_instance_id" int PRIMARY KEY,
  "class_id" int,
  "approval_id" int,
  "program_id" int,
  "start_date" date
);

CREATE TABLE "program" (
  "program_id" int PRIMARY KEY,
  "program_name" varchar,
  "points" int
);

CREATE TABLE "approved_program_year" (
  "approval_id" int PRIMARY KEY,
  "approval_year" int,
  "number_approved_years" int
);

CREATE TABLE "program_course" (
  "course_id" int PRIMARY KEY,
  "program_id" int,
  "city_id" int,
  "course_code" varchar,
  "points" int,
  "course_name" varchar,
  "course_desc" varchar
);

CREATE TABLE "program_course_instance" (
  "course_instance_id" int PRIMARY KEY NOT NULL,
  "class_program_instance_id" int NOT NULL,
  "course_id" int NOT NULL,
  "educator_id" int,
  "course_start_date" date
);