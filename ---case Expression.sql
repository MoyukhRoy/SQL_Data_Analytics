---case Expression



SELECT 
        job_title_short,
        job_location,
        CASE
            WHEN job_location = 'Anywhere' THEN 'remort'
            WHEN job_location = 'New York, NY' THEN 'local'
            ELSE 'onsite'
         END AS Local_category
FROM job_postings_fact;            


--more depth analysis


SELECT 
        COUNT(job_id) AS number_of_jobs,
        CASE
            WHEN job_location = 'Anywhere' THEN 'remort'
            WHEN job_location = 'New York, NY' THEN 'local'
            ELSE 'onsite'
         END AS Location_category
FROM job_postings_fact
GROUP BY
    Location_category
ORDER BY 
       number_of_jobs DESC;

--more depth analysis


SELECT 
        COUNT(job_id) AS number_of_jobs,
        CASE
            WHEN job_location = 'Anywhere' THEN 'remort'
            WHEN job_location = 'New York, NY' THEN 'local'
            ELSE 'onsite'
         END AS Location_category
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    Location_category;