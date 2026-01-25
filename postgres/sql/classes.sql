SELECT
    stc.student_id,
    scc.class_name,
    cpi.program_id,
    gpc.grade,
    pc.course_name,
    p.program_name,
    c.city_name
FROM student_class stc
LEFT JOIN school_class scc ON scc.class_id = stc.class_id
LEFT JOIN class_program_instance cpi ON cpi.class_id = scc.class_id
LEFT JOIN program p ON p.program_id = cpi.program_id
LEFT JOIN student s ON s.student_id = stc.student_id
LEFT JOIN grades_program_course gpc ON gpc.student_id = s.student_id
LEFT JOIN program_course pc ON pc.course_id = gpc.course_id
LEFT JOIN city c ON c.city_id = pc.city_id
ORDER BY stc.student_id;
