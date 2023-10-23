--ldp:function get_courses

CREATE FUNCTION get_courses(
    minimum_number_of_students bigint DEFAULT '0',
    maximum_number_of_students bigint DEFAULT '2147483647'
)
RETURNS TABLE(
    id text,
    course_number text,
    name text,
    description text,
    number_of_students bigint,
    section_name text)
AS $$
SELECT id::text, course_number, name, description, number_of_students, section_name
    FROM course_courses
    WHERE course_courses.number_of_students >= minimum_number_of_students
      AND course_courses.number_of_students <= maximum_number_of_students
$$
LANGUAGE SQL
STABLE
PARALLEL SAFE;
