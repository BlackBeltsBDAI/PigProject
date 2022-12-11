courses = LOAD '/user/maria_dev/udemy/Course_info.tsv' USING PigStorage('\t') AS (id:int, title:chararray, is_paid:boolean, price:float, headline:chararray, num_subscribers:int, avg_rating:float, num_reviews:int, num_comments:int, num_lectures:int, content_length_min:int, published_time:chararray, last_update_date:chararray, category:chararray, subcategory:chararray, topic:chararray, language:chararray, course_url:chararray, instructor_name:chararray, instructor_url:chararray);
categories = GROUP courses BY category;
categories_avg_rating = FOREACH categories GENERATE group, AVG(courses.avg_rating) AS avg_rating;
categories_ordered = ORDER categories_avg_rating BY avg_rating DESC;
DUMP categories_ordered;
STORE categories_ordered INTO 'udemy/Question_4' using PigStorage('\t');