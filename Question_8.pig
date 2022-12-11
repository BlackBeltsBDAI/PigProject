courses = LOAD '/user/maria_dev/udemy/Course_info.tsv' USING PigStorage('\t') AS (id:int, title:chararray, is_paid:boolean, price:float, headline:chararray, num_subscribers:int, avg_rating:float, num_reviews:int, num_comments:int, num_lectures:int, content_length_min:int, published_time:chararray, last_update_date:chararray, category:chararray, subcategory:chararray, topic:chararray, language:chararray, course_url:chararray, instructor_name:chararray, instructor_url:chararray);
languages = GROUP courses BY language;
languages_courses = FOREACH languages GENERATE group AS language, COUNT(courses.id) AS num_courses;
arabic_courses = FILTER languages_courses BY language == 'Arabic';
DUMP arabic_courses
STORE arabic_courses INTO 'udemy/Question_8' using PigStorage('\t');