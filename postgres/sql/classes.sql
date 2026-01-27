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

