Table student{
  student_id int [not null, primary key]
}

Table restricted_personal_details_student{
  student_id int [not null, ref: - student.student_id]
  first_name varchar
  last_name varchar
  personal_number int
  email varchar
}

Table independent_course {
  independent_course_id int [not null, primary key]
  city_id int [not null, ref: - city.city_id]
  course_code varchar
  course_name varchar
  points int
  course_desc varchar
}

Table independent_course_instance {
  independent_course_instance_id int [not null, primary key]
  independent_course_id int [not null, ref: > independent_course.independent_course_id]
  educator_id int [ref: - educator.educator_id]
  independent_course_start_date date
}

Table student_independent_course {
  independent_course_instance_id int [not null, ref: > independent_course_instance.independent_course_instance_id]
  student_id int [not null, ref: > student.student_id]
}

Table grades_independent {
  student_id int [not null, ref: > student.student_id]
  independent_course_id int [not null, ref: > independent_course.independent_course_id]
  grade varchar
}

Table student_class {
  student_id int [not null, ref: > student.student_id]
  class_id int [not null, ref: > school_class.class_id]
}

Table school_class {
  class_id int [not null, primary key]
  leader_id int [ref: - educational_leader.leader_id]
  class_year date [not null]
  class_name varchar
}

Table educational_leader {
  leader_id int [not null, primary key]
  first_name varchar
  last_name varchar
  email varchar
}

Table restricted_educatioal_leader {
  leader_id int [not null, ref: - educational_leader.leader_id]
  personal_number int
  salary_per_month float
}

Table grades_program_course {
  student_id int [not null, ref: > student.student_id]
  course_id int [not null, ref: > program_course.course_id]
  grade varchar
}

Table city {
  city_id int [not null, primary key]
  city_name varchar
}

Table educator {
  educator_id int [not null, primary key]
  first_name varchar
  last_name varchar
  consultant_id int [ref: - consultant.consultant_id]
  employed_educator_id int [ref: - restricted_employed_educator.employed_educator_id]
}

Table consultant {
  consultant_id int [primary key]
  company_name varchar
  company_number varchar
  fskatt_true_false boolean
  adress varchar
  cost_per_hour float
  email varchar
}

Table restricted_employed_educator {
  employed_educator_id int [primary key]
  personal_number int
  salary_per_month float
  email varchar
  adress varchar
}

Table class_program_instance{
  class_program_instance_id int [primary key]
  class_id int [ref: > school_class.class_id]
  approval_id int [ref: < approved_program_year.approval_id]
  program_id int [ref: < program.program_id]
  start_date date
}

Table program {
  program_id int [primary key]
  program_name varchar
  points int
}

Table approved_program_year {
  approval_id int [primary key]
  approval_year int
  number_approved_years int
}

Table program_course {
  course_id int [primary key]
  program_id int [ref: > program.program_id]
  city_id int [ref: - city.city_id]
  course_code varchar
  points int
  course_name varchar
  course_desc varchar
}

Table program_course_instance {
  course_instance_id int [not null, primary key]
  class_program_instance_id int [not null, ref: > class_program_instance.class_program_instance_id]
  course_id int [not null, ref: < program_course.course_id]
  educator_id int [ref: - educator.educator_id]
  course_start_date date
}





















