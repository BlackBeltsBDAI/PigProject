courses = LOAD '/user/maria_dev/udemy/Course_info.tsv' USING PigStorage('\t') AS (id:int, title:chararray, is_paid:boolean, price:float, headline:chararray, num_subscribers:int, avg_rating:float, num_reviews:int, num_comments:int, num_lectures:int, content_length_min:int, published_time:chararray, last_update_date:chararray, category:chararray, subcategory:chararray, topic:chararray, language:chararray, course_url:chararray, instructor_name:chararray, instructor_url:chararray);
course_type = GROUP courses BY is_paid;
course_type_avg_rating = FOREACH course_type GENERATE group, AVG(courses.avg_rating) AS avg_rating;
DUMP course_type_avg_rating;
STORE course_type_avg_rating INTO 'udemy/Question_6' using PigStorage('\t');