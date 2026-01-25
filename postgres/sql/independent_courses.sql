SELECT
    ic.course_name,
    ici.independent_course_start_date,
    e.educator_id,
    e.first_name,
    e.last_name
FROM independent_course ic
LEFT JOIN independent_course_instance ici ON ici.independent_course_id = ic.independent_course_id
LEFT JOIN educator e ON e.educator_id = ici.educator_id