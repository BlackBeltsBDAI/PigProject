courses = LOAD '/user/maria_dev/udemy/Course_info.tsv' USING PigStorage('\t') AS (id:int, title:chararray, is_paid:boolean, price:float, headline:chararray, num_subscribers:int, avg_rating:float, num_reviews:int, num_comments:int, num_lectures:int, content_length_min:int, published_time:chararray, last_update_date:chararray, category:chararray, subcategory:chararray, topic:chararray, language:chararray, course_url:chararray, instructor_name:chararray, instructor_url:chararray);
categories = GROUP courses BY category;
categories_courses = FOREACH categories GENERATE group, COUNT(courses.id) AS num_courses;
categories_ordered = ORDER categories_courses BY num_courses DESC;
categories_courses_ordered = LIMIT categories_ordered 13;
DUMP categories_courses_ordered;
STORE categories_courses_ordered INTO 'udemy/Question_5' using PigStorage('\t');