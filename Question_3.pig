courses = LOAD '/user/maria_dev/udemy/Course_info.tsv' USING PigStorage('\t') AS (id:int, title:chararray, is_paid:boolean, price:float, headline:chararray, num_subscribers:int, avg_rating:float, num_reviews:int, num_comments:int, num_lectures:int, content_length_min:int, published_time:chararray, last_update_date:chararray, category:chararray, subcategory:chararray, topic:chararray, language:chararray, course_url:chararray, instructor_name:chararray, instructor_url:chararray);
categories = GROUP courses BY category;
categories_subscribers = FOREACH categories GENERATE group, SUM(courses.num_subscribers) AS num_subscribers;
categories_ordered = ORDER categories_subscribers BY num_subscribers DESC;
top_categories = LIMIT categories_ordered 13;
DUMP top_categories;
STORE top_categories INTO 'udemy/Question_3' using PigStorage('\t');