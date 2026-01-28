INSERT INTO school_class (class_id, leader_id, class_name)
VALUES (null, 1, null); -- cannot be null


INSERT INTO student_class (student_id, class_id) VALUES (101, 999); -- 999 finns inte i school_class

INSERT INTO city (city_id, city_name)
VALUES (1, 'Malmö');  -- 1 används redan av Stockholm
