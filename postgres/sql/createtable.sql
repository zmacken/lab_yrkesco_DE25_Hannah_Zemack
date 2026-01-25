CREATE TABLE "student" (
  "student_id" int PRIMARY KEY NOT NULL
);

CREATE TABLE "restricted_personal_details_student" (
  "student_id" int NOT NULL,
  "first_name" varchar,
  "last_name" varchar,
  "personal_number" int,
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
  "class_year" year NOT NULL,
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
  "personal_number" int,
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
  "personal_number" int,
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
  "program_id" in,
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

ALTER TABLE "restricted_personal_details_student" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");

ALTER TABLE "independent_course" ADD FOREIGN KEY ("city_id") REFERENCES "city" ("city_id");

ALTER TABLE "independent_course_instance" ADD FOREIGN KEY ("independent_course_id") REFERENCES "independent_course" ("independent_course_id");

ALTER TABLE "independent_course_instance" ADD FOREIGN KEY ("educator_id") REFERENCES "educator" ("educator_id");

ALTER TABLE "student_independent_course" ADD FOREIGN KEY ("independent_course_instance_id") REFERENCES "independent_course_instance" ("independent_course_instance_id");

ALTER TABLE "student_independent_course" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");

ALTER TABLE "grades_independent" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");

ALTER TABLE "grades_independent" ADD FOREIGN KEY ("independent_course_id") REFERENCES "independent_course" ("independent_course_id");

ALTER TABLE "student_class" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");

ALTER TABLE "student_class" ADD FOREIGN KEY ("class_id") REFERENCES "school_class" ("class_id");

ALTER TABLE "school_class" ADD FOREIGN KEY ("leader_id") REFERENCES "educational_leader" ("leader_id");

ALTER TABLE "restricted_educatioal_leader" ADD FOREIGN KEY ("leader_id") REFERENCES "educational_leader" ("leader_id");

ALTER TABLE "grades_program_course" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("student_id");

ALTER TABLE "grades_program_course" ADD FOREIGN KEY ("course_id") REFERENCES "program_course" ("course_id");

ALTER TABLE "educator" ADD FOREIGN KEY ("consultant_id") REFERENCES "consultant" ("consultant_id");

ALTER TABLE "educator" ADD FOREIGN KEY ("employed_educator_id") REFERENCES "restricted_employed_educator" ("employed_educator_id");

ALTER TABLE "class_program_instance" ADD FOREIGN KEY ("class_id") REFERENCES "school_class" ("class_id");

ALTER TABLE "approved_program_year" ADD FOREIGN KEY ("approval_id") REFERENCES "class_program_instance" ("approval_id");

ALTER TABLE "program" ADD FOREIGN KEY ("program_id") REFERENCES "class_program_instance" ("program_id");

ALTER TABLE "program_course" ADD FOREIGN KEY ("program_id") REFERENCES "program" ("program_id");

ALTER TABLE "program_course" ADD FOREIGN KEY ("city_id") REFERENCES "city" ("city_id");

ALTER TABLE "program_course_instance" ADD FOREIGN KEY ("class_program_instance_id") REFERENCES "class_program_instance" ("class_program_instance_id");

ALTER TABLE "program_course" ADD FOREIGN KEY ("course_id") REFERENCES "program_course_instance" ("course_id");

ALTER TABLE "program_course_instance" ADD FOREIGN KEY ("educator_id") REFERENCES "educator" ("educator_id");
