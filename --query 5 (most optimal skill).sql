--query 5 (most optimal skill)

---with "CETs" view

WITH skill_demand AS(
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) as demend_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL 
        AND job_work_from_home = TRUE
    GROUP BY
            skills_dim.skill_id    
), avarage_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        round(avg(salary_year_avg),2) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL 
        AND job_work_from_home = TRUE
    GROUP BY
            skills_job_dim.skill_id
    
)

SELECT 
    skill_demand.skill_id,
    skill_demand.skills,
    demend_count,
    avg_salary
FROM
    skill_demand
INNER JOIN avarage_salary ON skill_demand.skill_id = avarage_salary.skill_id
WHERE
    demend_count > 10
ORDER BY 
    demend_count DESC,
    avg_salary DESC
LIMIT 50


---opotimizing the above code and rewrite



SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) as demend_count,
    round(avg(job_postings_fact.salary_year_avg),2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL 
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
Having
    COUNT(skills_job_dim.skill_id) > 10
ORDER BY 
    avg_salary DESC,
    demend_count DESC
LIMIT 50;
    

