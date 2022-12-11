courses = LOAD '/user/maria_dev/udemy/Course_info.tsv' USING PigStorage('\t') AS (id:int, title:chararray, is_paid:boolean, price:float, headline:chararray, num_subscribers:int, avg_rating:float, num_reviews:int, num_comments:int, num_lectures:int, content_length_min:int, published_time:chararray, last_update_date:chararray, category:chararray, subcategory:chararray, topic:chararray, language:chararray, course_url:chararray, instructor_name:chararray, instructor_url:chararray);
courses_ordered = ORDER courses BY num_subscribers DESC;
top_10_courses = LIMIT courses_ordered 10;
top_10_courses = FOREACH top_10_courses GENERATE $1, $5;
DUMP top_10_courses;
STORE top_10_courses INTO 'udemy/Question_1' using PigStorage('\t');