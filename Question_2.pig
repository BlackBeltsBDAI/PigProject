courses = LOAD '/user/maria_dev/udemy/Course_info.tsv' USING PigStorage('\t') AS (id:int, title:chararray, is_paid:boolean, price:float, headline:chararray, num_subscribers:int, avg_rating:float, num_reviews:int, num_comments:int, num_lectures:int, content_length_min:int, published_time:chararray, last_update_date:chararray, category:chararray, subcategory:chararray, topic:chararray, language:chararray, course_url:chararray, instructor_name:chararray, instructor_url:chararray);
instructors = GROUP courses BY instructor_name;
instructors_subscribers = FOREACH instructors GENERATE group, SUM(courses.num_subscribers) AS num_subscribers;
instructors_ordered = ORDER instructors_subscribers BY num_subscribers DESC;
top_10_instructors = LIMIT instructors_ordered 10;
DUMP top_10_instructors;
STORE top_10_instructors INTO 'udemy/Question_2' using PigStorage('\t');