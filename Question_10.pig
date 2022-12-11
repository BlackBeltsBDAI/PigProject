courses = LOAD '/user/maria_dev/udemy/Course_info.tsv' USING PigStorage('\t') AS (id:int, title:chararray, is_paid:boolean, price:float, headline:chararray, num_subscribers:int, avg_rating:float, num_reviews:int, num_comments:int, num_lectures:int, content_length_min:int, published_time:chararray, last_update_date:chararray, category:chararray, subcategory:chararray, topic:chararray, language:chararray, course_url:chararray, instructor_name:chararray, instructor_url:chararray);
free_courses = FILTER courses BY is_paid == false;
instructors_free_courses = GROUP free_courses BY instructor_name;
courses_count = FOREACH instructors_free_courses GENERATE group, COUNT(free_courses.id) AS num_courses;
courses_count_ordered = ORDER courses_count BY num_courses DESC;
DUMP courses_count_ordered
STORE courses_count_ordered INTO 'udemy/Question_10' using PigStorage('\t');