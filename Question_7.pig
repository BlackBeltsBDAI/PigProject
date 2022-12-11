courses = LOAD '/user/maria_dev/udemy/Course_info.tsv' USING PigStorage('\t') AS (id:int, title:chararray, is_paid:boolean, price:float, headline:chararray, num_subscribers:int, avg_rating:float, num_reviews:int, num_comments:int, num_lectures:int, content_length_min:int, published_time:chararray, last_update_date:chararray, category:chararray, subcategory:chararray, topic:chararray, language:chararray, course_url:chararray, instructor_name:chararray, instructor_url:chararray);
subcategories = GROUP courses BY subcategory;
subcategories_avg_price = FOREACH subcategories GENERATE group, AVG(courses.price) AS price;
subcategories_prices_ordered = ORDER subcategories_avg_price BY price DESC;
DUMP subcategories_prices_ordered
STORE subcategories_prices_ordered INTO 'udemy/Question_7' using PigStorage('\t');