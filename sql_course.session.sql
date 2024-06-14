CREATE table job_applied (
    job_id int,
    app_sent_date date,
    cv boolean,
    cv_file_name varchar(255),
    cov_letter_sent boolean,
    cov_letter_file_name varchar(255),
    status varchar(50)

);




insert into job_applied(
    job_id,
    app_sent_date,
    cv,
    cv_file_name,
    cov_letter_sent,
    cov_letter_file_name,
    status)

values                   

        (1,'2024-02-1',true,'resume_01.pdf',true,'cover_letter_01.pdf','submitted'),
        (2,'2024-02-02',false,'resume_02.pdf',false,null,'rejected'),
        (3,'2024-02-03',true,'resume_03.pdf',true,'cover_letter_03.pdf','submitted'),
        (4,'2024-02-05',true,'resume_04.pdf',true,'cover_letter_04.pdf','submitted'),
        (5,'2024-02-06',false,'resume_05.pdf',false,'cover_letter_05.pdf','rejected'),
        (6,'2024-02-08',false,'resume_06.pdf',true,null,'rejected'),
        (7,'2024-02-09',false,'resume_07.pdf',false,null,'submitted'),
        (8,'2024-02-10',true,'resume_08.pdf',true,'cover_letter_08.pdf','submitted');







Alter table job_applied
add contact varchar(50);


update job_applied
set contact = 'rupankar palit'
where job_id = 1;

alter table job_applied
rename column contact to contact_name;


SELECT * FROM job_applied

Alter table job_applied
drop column contact_name;

delete from job_applied
where job_id = 1

drop table job_applied

DROP TABLE IF EXISTS job_applied;


DROP TABLE job_applied CASCADE;



-- This should result in an error since the table no longer exists
SELECT * FROM job_applied;

-- Check the system catalogs
SELECT table_name 
FROM information_schema.tables 
WHERE table_name = 'job_applied';






