SELECT
    stc.student_id,
    scc.class_name,
    cpi.program_id,
    pgc.grade,
    pgc.course_id,
    pc.course_name,
    p.program_name
FROM student_class stc
LEFT JOIN school_class scc ON scc.class_id = stc.class_id
LEFT JOIN class_program_instance cpi ON cpi.class_id = scc.class_id
LEFT JOIN program p ON p.program_id = cpi.program_id
LEFT JOIN program_course pc ON pc.program_id = p.program_id
LEFT JOIN grades_program_course pgc ON pgc.course_id = pc.course_id
ORDER BY student_id
