---problem 7

SELECT 
        job_postings.job_id,
        skill_id,
        
FROM
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact As job_postings on job_postings.job_id = skills_to_job . job_id

---depth analyts


SELECT 
        job_postings.job_id,
        skill_id,
        job_postings.job_work_from_home
FROM
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact As job_postings on job_postings.job_id = skills_to_job . job_id
LIMIT 100000




SELECT 
        job_postings.job_id,
        skill_id,
        job_postings.job_work_from_home
FROM
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact As job_postings on job_postings.job_id = skills_to_job . job_id
WHERE
    job_postings.job_work_from_home = true




SELECT 
        skill_id,
        count(*) As skill_count
FROM
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact As job_postings on job_postings.job_id = skills_to_job . job_id
WHERE
    job_postings.job_work_from_home = true
Group by
        skill_id


with remort_job_skills AS (
SELECT 
        skill_id,
        count(*) As skill_count
FROM
    skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact As job_postings on job_postings.job_id = skills_to_job . job_id
WHERE
    job_postings.job_work_from_home = true AND
    job_postings.job_title_short = 'Data Analyst'
Group by
        skill_id
)

select 
    skills.skill_id,
    skills AS skill_name,
    skill_count
FROM remort_job_skills
INNER JOIN skills_dim As skills on skills.skill_id = remort_job_skills.skill_id
Order by
        skill_count desc
        LIMIT 5