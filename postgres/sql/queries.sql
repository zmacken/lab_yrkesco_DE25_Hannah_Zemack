-- show students reading independent courses
SELECT 
    s.student_id,
    r.first_name,
    r.last_name,
    ic.course_name,
    ici.independent_course_start_date
FROM student_independent_course sic
JOIN student s ON s.student_id = sic.student_id
JOIN restricted_personal_details_student r ON r.student_id = s.student_id
JOIN independent_course_instance ici ON ici.independent_course_instance_id = sic.independent_course_instance_id
JOIN independent_course ic ON ic.independent_course_id = ici.independent_course_id;

--show students their classes and educational leaders
SELECT 
    s.student_id,
    r.first_name AS student_first_name,
    r.last_name AS student_last_name,
    sc.class_name,
    el.first_name AS leader_first_name,
    el.last_name AS leader_last_name
FROM student s
JOIN restricted_personal_details_student r ON r.student_id = s.student_id
JOIN student_class stc ON stc.student_id = s.student_id
JOIN school_class sc ON sc.class_id = stc.class_id
JOIN educational_leader el ON el.leader_id = sc.leader_id;

-- show grades program courses
SELECT 
    s.student_id,
    r.first_name,
    r.last_name,
    pc.course_name,
    pc.program_id,
    gpc.grade
FROM grades_program_course gpc
JOIN student s ON s.student_id = gpc.student_id
JOIN restricted_personal_details_student r ON r.student_id = s.student_id
JOIN program_course pc ON pc.course_id = gpc.course_id;



