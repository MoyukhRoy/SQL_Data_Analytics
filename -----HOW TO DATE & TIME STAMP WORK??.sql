-----HOW TO DATE & TIME STAMP WORK??

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date ::DATE AS DATE
FROM
    job_postings_fact
LIMIT 10;



SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS Date_time
FROM
    job_postings_fact
LIMIT 5;




--for reson of no time-zone we use "UTC"


SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date at time zone 'utc' at time zone 'est' as Date_time
FROM
    job_postings_fact
LIMIT 11;

--extrat date,month,time



SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date at time zone 'utc' at time zone 'est' as Date_time,
    EXTRACT(MONTH FROM job_posted_date) AS Date_month,
    EXTRACT(YEAR FROM job_posted_date) AS Date_Year
FROM
    job_postings_fact
LIMIT 11;

--example

SELECT
    job_id,
        EXTRACT(MONTH FROM job_posted_date) AS month
FROM 
    job_postings_fact
LIMIT 10;

--- aggregation of date

SELECT
    count(job_id) AS job_post_count,
        EXTRACT(MONTH FROM job_posted_date) AS month
FROM 
    job_postings_fact
    WHERE
    job_title_short = 'Data Analyst'
GROUP BY
        MONTH
ORDER BY
    job_post_count DESC;



    